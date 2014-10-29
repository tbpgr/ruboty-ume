# encoding: utf-8
require 'spec_helper'
require 'ruboty/ume/actions/umec'

describe Ruboty::Ume::Actions::Umec do
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
        case_title: '10 count with hoge text case',
        text: 'hoge',
        count: 10,
        expected: "hoge\nhoge\nhoge\nhoge\nhoge\nhoge\nhoge\nhoge\nhoge\nhoge\n"
      },
      {
        case_no: 2,
        case_title: 'no count hoge text case',
        text: 'hoge',
        expected: "hoge\n" * Ruboty::Ume::Actions::DEFAULT_COUNT
      },
      {
        case_no: 3,
        case_title: 'not Fixnum count case',
        text: 'hoge',
        count: 'hoge',
        expected: "invalid value for Integer(): \"hoge\""
      },
      {
        case_no: 4,
        case_title: 'nil text case',
        count: 2,
        expected: "--\n" * 2
      },
      {
        case_no: 5,
        case_title: 'empty text case',
        text: '',
        count: 2,
        expected: "--\n" * 2
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message[:count] = c[:count] if c[:count]
          message[:text] = c[:text] if c[:text]
          action = Ruboty::Ume::Actions::Umec.new(message)

          # -- when --
          actual = action.send(:umec)

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
