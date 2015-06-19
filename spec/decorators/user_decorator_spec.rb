require 'spec_helper'

describe UserDecorator do
  let(:user) { described_class.new(build(:user, firstname: 'John', lastname: 'Doe')) }

  describe '#fullname' do
    it 'displays user fullname' do
      expect(user.fullname).to eq 'John Doe'
    end
  end

  describe '#online?' do
    it 'displays message if user is offline' do
      expect(user.online?).to include('offline')
    end

    it 'displays circle if user is online' do
      user.update_attribute(:firstname, 'Johny')
      expect(user.online?).to include('online')
    end

  end
end
