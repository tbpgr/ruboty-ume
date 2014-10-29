require 'ruboty/ume/actions/ume'
require 'ruboty/ume/actions/umec'

module Ruboty
  module Handlers
    # Ume
    class Ume < Base
      on(
        /ume (?<count>.*?)\z/,
        name: 'ume',
        description: 'output empty message N lines (<count> times)'
      )

      on(
        /umec (?<text>.+?) (?<count>.*?)\z/,
        name: 'umec',
        description: 'output <text> message N lines (<count> times)'
      )

      def ume(message)
        Ruboty::Ume::Actions::Ume.new(message).call
      end

      def umec(message)
        Ruboty::Ume::Actions::Umec.new(message).call
      end
    end
  end
end
