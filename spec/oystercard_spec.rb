# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  describe '#Balance' do
    it 'should start with a balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#Top_up' do
    it 'should top up the oystercard by the specified amount' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end
    it 'should not let you have a balance over £90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect{subject.top_up(1)}.to raise_error("Max balance of #{maximum_balance} reached")
        end
    end
  end
