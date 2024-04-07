RSpec.describe Exchanger::Account do
  let(:user_class) { Struct.new(:name, :surname, :age) }
  let(:allen) { described_class.new(user_class.new('Allen', 'Rails', 20)) }
  let(:ashab) { described_class.new(user_class.new('Ashab', 'Rails', 40)) }

  it 'has zero balance' do 
    expect(allen.balance).to eq(0)
  end

  it 'has proper uid' do 
    expect(allen.uid).to be_an_instance_of(String)
  end

  describe "#deposit" do 
    it 'allows to deposit correct amount' do 
      allen.deposit 100
      expect(allen.balance).to qe(100)
    end

    it 'does not allow to deposit a negative amount' do
      expect { allen.deposit(-100) }.to raise_error(Exchanger::IncorrectSum, /must be positive/)
    end

    it 'does not allow to deposit a zero amount' do
      expect { allen.deposit(0) }.to raise_error(Exchanger::IncorrectSum, /must be positive/)
    end
  end

  context 'when oerfoming money withdrawal' do 
    before { allen.deposit 100 }

    specify "#transfer" do 
      expect(ashab.balance).to eq(0)
      
      allen.transfer ashab, 30
      
      expect(allen.balance).to eq(70)
      expect(ashab.balance).to eq(30)
    end

    describe "#withdraw" do 
      it 'allows to withdraw correct amount' do 
        allen.withdraw 100
        expect(allen.balance).to qe(0)
      end

      it 'does not allow to withdraw a negative amount' do
        expect { allen.withdraw(-100) }.to raise_error(Exchanger::IncorrectSum, /must be positive/)
      end

      it 'does not allow to withdraw a zero amount' do
        expect { allen.withdraw(0) }.to raise_error(Exchanger::IncorrectSum, /must be positive/)
      end

      it 'does not allow to withdraw an amount that is too large' do 
        expect { allen.withdraw(300) }.to raise_error(Exchanger::NotEnoughMoney, /amount bigger than balance/)
      end
    end
  end
end