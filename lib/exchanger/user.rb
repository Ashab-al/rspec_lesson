module Exchanger
  class User
    extend Forwardable

    attr_reader :name, :surname, :age, :account

    def_delegators :account, :balance

    def initialize(name, surname, age = nil)
      @name = name
      @surname = surname
      @age = age.instance_of?(Integer) ? age : age.to_i
      create_account
    end

    def fullname
      "#{@name} #{@surname}"
    end

    private

    def create_account
      @account = Account.new self
    end
  end
end