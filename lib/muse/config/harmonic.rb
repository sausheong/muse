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
  module Harmonic
    class << self
      
      def base(input)
        2 * Math::PI * input
      end
      
      def default(input)
        Math.sin(base(input))
      end

      def second(input)
        Math.sin(base(input))
        Math.sin(base(input) * 3)
      end

      def third(input)
        Math.sin(base(input)) + 
        Math.sin(base(input) * 3) + 
        Math.sin(base(input) * 5)
      end

      def guitar(input)
        Math.sin(base(input)) + 
        Math.sin(base(input) * 2) + 
        Math.sin(base(input) * 0.5)
      end

    end
  end
end
