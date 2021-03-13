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
  end
end
