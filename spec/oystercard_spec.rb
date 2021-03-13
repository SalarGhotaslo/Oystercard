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
      expect { subject.top_up(1) }.to raise_error("Max balance of #{maximum_balance} reached")
    end
  end

  describe '#Deduct' do
    it 'should deduct money from your card by specified amount' do
      subject.top_up(5)
      subject.deduct(5)
      expect(subject.balance).to eq(0)
    end
  end

  describe '#Journey' do
    context 'Before the user touches their oystercard in or out' do
      it 'in_journey should respond with false' do
        expect(subject.in_journey).to eq(false)
      end
    end
    context 'If the user touches the oystercard in' do
      it 'responds with true to tell us the user is in_journey' do
        subject.top_up(5)
        subject.touch_in
        expect(subject.in_journey).to eq(true)
      end
      it 'responds with an error if the user does not have more than £1' do
        expect { subject.touch_in }.to raise_error('Top up your card to travel')
      end
    end
    context 'If the user touches the oystercard out' do
      it 'responds with false to tell us the user is not in_journey' do
        subject.top_up(5)
        subject.touch_in
        subject.touch_out
        expect(subject.in_journey).to eq(false)
      end
      it 'should deduct the fare journey from the balance' do
          subject.top_up(5)
          subject.touch_in
          expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
      end
    end
  end
end
