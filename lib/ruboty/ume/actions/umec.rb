require 'ruboty/ume/actions'

module Ruboty
  module Ume
    # Actions
    module Actions
      DEFAULT_TEXT = '--'

      # Umec
      class Umec < Ruboty::Actions::Base
        def call
          message.reply(umec)
        end

        private

        def umec
          repeat_count = Ruboty::Ume::Actions.normalize_count(message[:count])
          text = normalize_text(message[:text])
          "#{text}\n" * repeat_count
        rescue => e
          e.message
        end

        def normalize_text(text)
          return DEFAULT_TEXT if text.nil?
          return DEFAULT_TEXT if text.empty?
          return DEFAULT_TEXT unless text.is_a?(String)
          text
        end
      end
    end
  end
end
