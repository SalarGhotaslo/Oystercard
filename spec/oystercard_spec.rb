require 'oystercard'

describe Oystercard do
    context "So that I can top up my oystercard"
        it 'should start with a balance of zero' do
            expect(subject.balance).to eq(0)
        end  
        it 'should top up the oystercard by the specified amount' do
            subject.top_up(5)
            expect(subject.balance).to eq(5)
        end
    end