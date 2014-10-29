# encoding: utf-8
require 'spec_helper'
require 'ruboty/handlers/ume'
require 'ruboty/ume/actions/ume'
require 'ruboty/ume/actions/umec'

describe Ruboty::Handlers::Ume do
  context :ume do
    let(:robot) do
      Ruboty::Robot.new
    end

    let(:ume) do
      Ruboty::Ume::Actions::Ume
    end

    cases = [
      {
        case_no: 1,
        case_title: 'hit message case',
        body: 'ruboty ume 10',
        expected: 'expected message',
        hit: true
      },
      {
        case_no: 2,
        case_title: 'not hit message case',
        body: 'ruboty umeume 10',
        hit: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow_any_instance_of(ume).to receive(:ume).and_return(c[:expected])

          # -- then --
          if c[:hit]
            Ruboty.logger.should_receive(:info).with(c[:expected])
          else
            Ruboty.logger.should_not_receive(:info)
          end

          # -- when --
          robot.receive(body: c[:body], from: 'sender', to: 'channel')
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

  context :umec do
    let(:robot) do
      Ruboty::Robot.new
    end

    let(:umec) do
      Ruboty::Ume::Actions::Umec
    end

    cases = [
      {
        case_no: 1,
        case_title: 'hit message case',
        body: 'ruboty umec hoge 10',
        expected: 'expected message',
        hit: true
      },
      {
        case_no: 2,
        case_title: 'not hit message case',
        body: 'ruboty umecumec hoge 10',
        hit: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow_any_instance_of(umec).to receive(:umec).and_return(c[:expected])

          # -- then --
          if c[:hit]
            Ruboty.logger.should_receive(:info).with(c[:expected])
          else
            Ruboty.logger.should_not_receive(:info)
          end

          # -- when --
          robot.receive(body: c[:body], from: 'sender', to: 'channel')
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
