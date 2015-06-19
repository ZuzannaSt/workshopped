require 'spec_helper'

describe CategoryDecorator do

  let(:category) { described_class.new(build(:category, name: 'name')) }

  describe '#name_upcase' do
    it 'displays category name in upcase' do
      expect(category.name_upcase).to eq 'NAME'
    end
  end

end
