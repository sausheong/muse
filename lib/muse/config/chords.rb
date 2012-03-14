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
  module Config
    class << self

      # major
      def _CM(options={})
        add_to_stream chord(%w(c2 e2 g2), options)
      end

      def _FM(options={})
        add_to_stream chord(%w(f2 a2 c3), options)
      end

      # minor
      def _Dm(options={})
        add_to_stream chord(%w(d2 f2 a2), options)
      end

      # dominant 7th
      def _C7(options={})
        add_to_stream chord(%w(c2 e2 g2 ais2), options)
      end

      def _BbM(options={})
        add_to_stream chord(%w(ais2 d3 f3), options)
      end

    end
  end
end
