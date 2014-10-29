module Ruboty
  module Ume
    # Actions
    module Actions
      DEFAULT_COUNT = 15

      def normalize_count(repeat_count)
        return DEFAULT_COUNT if repeat_count.nil?
        Integer(repeat_count)
      end

      module_function :normalize_count
    end
  end
end
