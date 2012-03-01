module Muse
  module Config
    class << self
      def default(input)
        Math.cos(2* Math::PI*input).to_f
      end
    end
  end
end
