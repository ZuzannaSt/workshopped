require 'spec_helper'

describe ProductDecorator do

  let(:user) { build(:user, firstname: 'John', lastname: 'Doe') }
  let(:category) { described_class.new(build(:category, name: 'Name')) }
  let(:product) { described_class.new(create(:product, category: category, title: 'the_title')) }

  describe '#owner' do
    it 'displays product owner fullname' do
      expect(product.owner).to eq 'John Doe'
    end
  end

  describe '#title' do
    it 'displays product humanized title' do
      expect(product.title).to eq 'The title'
    end
  end

  describe '#average_rating_rounded' do
    let(:review1) { create(:review, rating: 5, product: product) }
    let(:review2) { create(:review, rating: 4, product: product) }

    before do
      product.reviews << [review1, review2]
    end

    it 'displays product average rating rounded' do
      expect(product.average_rating_rounded).to eq 4.5
    end
  end

  describe '#category_name' do
    it 'displays category name' do
      expect(product.category_name).to eq 'Name'
    end
  end

  describe '#short_description' do
    let(:product) { described_class.new(build(:product, description: Faker::Lorem.paragraph(20))) }

    it 'displays short description of a product' do
      expect(product.short_description.length).to eq 680
    end
  end
end
