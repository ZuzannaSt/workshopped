require 'spec_helper'

describe UsersController do
  let(:user) { build(:user) }
  let(:valid_attributes) do
    {
      firstname: 'John',
      lastname: 'Doe',
      email: 'john@doe.com',
      password: 'password123'
    }
  end

  context 'user is not signed in' do
    describe 'GET show' do
      it 'expose the requested user' do
        user = User.create! valid_attributes
        get :show, { id: user.to_param }
        expect(controller.user).to eq(user)
      end
    end
  end
end
