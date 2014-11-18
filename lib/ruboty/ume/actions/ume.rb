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
          ".\n" * Ruboty::Ume::Actions.normalize_count(message[:count])
        rescue => e
          e.message
        end
      end
    end
  end
end
