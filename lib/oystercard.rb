# frozen_string_literal: true

class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'Max balance of 90 reached' if amount + @balance > MAXIMUM_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
