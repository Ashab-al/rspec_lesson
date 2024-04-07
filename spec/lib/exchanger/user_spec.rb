# frozen_literal: true

RSpec.describe Exchanger::User do
  let(:user) { described_class.new 'Allen', 'Rails', 20 }
  let(:user_age_is_string) { described_class.new 'Allen', 'Rails', '20' }

  it 'returns name' do 
    expect(user.name).to eq('Allen')
  end

  it 'returns surname' do 
    expect(user.surname).to eq('Rails')
  end

  it 'returns age' do 
    expect(user.age).to eq(20)
  end

  it 'returns age as a Integer' do 
    expect(user_age_is_string).to be_an_instance_of(Integer)
  end

  it 'returns fullname' do 
    expect(user.fullname).to eq('Allen Rails')
  end

  specify '#account' do 
    expect(user.account).to be_an_instance_of(Exchanger::Account)
  end

  it 'has zero balance by default' do 
    expect(user.balance).to eq(0)
  end

  # #method - метод экзампляра класса
  # .method - метод класса

  # specify '' do
  # end

  # describe "#method" do 
  #   example "20, 30" do 
  #   end

  #   example "-230, 30" do
  #   end
  # end
  
  # context == describe

  # feature == context == describe
  # scenario == example, it ..
end
