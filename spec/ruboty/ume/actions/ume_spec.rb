# encoding: utf-8
require 'spec_helper'
require 'ruboty/ume/actions/ume'

describe Ruboty::Ume::Actions::Ume do
  context :ume do
    let(:message) do
      # Dummy Message
      class Message < Hash
        def reply(message)
          message
        end
      end
      Message.new
    end

    cases = [
      {
        case_no: 1,
        case_title: '10 count case',
        count: '10',
        expected: "\n\n\n\n\n\n\n\n\n\n"
      },
      {
        case_no: 2,
        case_title: 'no count case',
        expected: "\n" * Ruboty::Ume::Actions::DEFAULT_COUNT
      },
      {
        case_no: 3,
        case_title: 'not Fixnum count case',
        count: 'hoge',
        expected: "invalid value for Integer(): \"hoge\"",
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message[:count] = c[:count] if c[:count]
          action = Ruboty::Ume::Actions::Ume.new(message)

          # -- when --
          actual = action.send(:ume)

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end
end
