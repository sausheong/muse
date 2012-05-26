# Muse
# Copyright (C) 2012  Chang Sau Sheong
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'bindata'

module Muse
  
  class RiffChunk < BinData::Record
    int32be :chunk_id
    int32le :chunk_size
    int32be :format  
  end

  class FormatChunk < BinData::Record
    int32be :chunk_id
    int32le :chunk_size
    int16le :audio_format
    int16le :num_channels
    int32le :sample_rate
    int32le :byte_rate
    int16le :block_align
    int16le :bits_per_sample  
  end

  class DataChunk < BinData::Record
    int32be :chunk_id
    int32le :chunk_size  
  end

  class TempData < BinData::Record
    array :stream do
      int16le :left
      int16le :right
    end
  end
  
  class WavFormat < BinData::Record
    riff_chunk   :riff_chunk
    format_chunk :format_chunk
    data_chunk   :data_chunk
  end
  
  class WavHeader
    SAMPLE_RATE = 44100
    attr :wav, :file, :sample_rate, :format_chunk, :riff_chunk, :data_chunk
    
    def initialize(filename, stream_size)
      @sample_rate = SAMPLE_RATE
      @file = File.open(filename, "wb")

      @riff_chunk = RiffChunk.new
      @riff_chunk.chunk_id = "RIFF".unpack("N").first
      @riff_chunk.format = "WAVE".unpack("N").first

      @format_chunk = FormatChunk.new
      @format_chunk.chunk_id = "fmt ".unpack("N").first
      @format_chunk.chunk_size = 16
      @format_chunk.audio_format = 1
      @format_chunk.num_channels = 2
      @format_chunk.bits_per_sample = 16
      @format_chunk.sample_rate =  @sample_rate
      @format_chunk.byte_rate = @format_chunk.sample_rate * @format_chunk.num_channels * @format_chunk.bits_per_sample/2
      @format_chunk.block_align = @format_chunk.num_channels * @format_chunk.bits_per_sample/2
      
      @data_chunk = DataChunk.new
      @data_chunk.chunk_id = "data".unpack("N").first
      @data_chunk.chunk_size = stream_size * @format_chunk.num_channels * @format_chunk.bits_per_sample/8
      @riff_chunk.chunk_size = 36 + @data_chunk.chunk_size
      
      @wav = WavFormat.new
      @wav.riff_chunk = @riff_chunk
      @wav.format_chunk = @format_chunk
      @wav.data_chunk = @data_chunk
      @wav.write(@file)
      @file.close
    end
  end
end
