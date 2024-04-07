# frozen_string_literal: true

module Exchanger
  class Account
    include Exchanger::Utils::Uid

    attr_reader :uid, :balance

    def initialize(user)
      @uid = get_hash user.name, user.surname
      @balance = 0
    end

    def transfer(receiver, amount)
      withdraw amount
      receiver.deposit amount
    end

    def withdraw(amount)
      raise(Exchanger::IncorrectSum, "Amount must be positive") unless amount.positive?
      raise(Exchanger::NotEnoughMoney, "amount bigger than balance (#{amount} > #{@balance})") if amount > @balance

      @balance -= amount
    end

    def deposit(amount)
      raise(Exchanger::IncorrectSum, "Amount must be positive") unless amount.positive?

      @balance += amount
    end
  end
end
