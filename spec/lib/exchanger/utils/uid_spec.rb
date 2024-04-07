RSpec.describe Exchanger::Utils::Uid do
  let(:base_class) { Class.new { include Exchanger::Utils::Uid }.new }

  describe '#get_hash' do
    it 'return nil when no args' do
      expect(base_class.get_hash).to be_nil
    end

    it 'returns string when at least 1 arg' do
      expect(base_class.get_hash('str', 'str2')).to be_an_instance_of(String)
    end
  end
end
