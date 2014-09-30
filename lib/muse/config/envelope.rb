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

module Muse
  module Envelope
    class << self
      def default(input, duration)
        Math.cos((Math::PI*input)/(2*duration.to_f))
      end
      
      def sine(input, duration)
        Math.sin((Math::PI*input)/duration.to_f)
      end

      def tangent(input, duration)
        Math.sin((Math::PI*input)/duration.to_f) / 
          Math.cos((Math::PI*input)/(2*duration.to_f))
      end

    end
  end
end
