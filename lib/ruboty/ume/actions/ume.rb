require 'ruboty/ume/actions'

module Ruboty
  module Ume
    module Actions
      # Ume
      class Ume < Ruboty::Actions::Base
        def call
          message.reply(ume)
        end

        private

        def ume
          repeat_count = Ruboty::Ume::Actions.normalize_count(message[:count])
          ".\n" + ("\n" * (repeat_count - 2)) + ".\n"
        rescue => e
          e.message
        end
      end
    end
  end
end
