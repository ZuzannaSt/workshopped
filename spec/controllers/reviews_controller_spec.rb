require 'spec_helper'

describe ReviewsController do
  let(:product)      { create(:product) }
  let(:category)      { create(:category, name: "NewName") }
  let(:user) { create(:user) }

  let(:valid_attributes) do
    {
      content: 'MyString',
      rating: 2,
      product_id: product.id,
      user_id: user.id
    }
  end

  context 'user is not signed in' do
    describe 'POST create' do
      describe 'with valid params' do
        it 'redirects user to login page' do
          post :create, { review: valid_attributes, product_id: product.to_param, category_id: category.to_param }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

  describe 'GET edit' do
    it 'expose the requested review' do
      review = Review.create! valid_attributes
      get :edit, { id: review.to_param, product_id: product.to_param, category_id: category.to_param }
      expect(controller.review).to eq(review)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      context 'user is signed in' do
        let(:user) { create(:user) }
        let(:product) { create(:product) }

        before do
          sign_in user
          allow(controller).to receive_message_chain(:user_signed_in?).and_return(true)
          allow(controller).to receive_message_chain(:current_user).and_return(user)
          allow(controller).to receive_message_chain(:authenticate_user!).and_return(user)
          product.user = user
        end

        it 'creates a new Review' do
          expect {
            post :create, { review: valid_attributes, product_id: product.to_param, category_id: category.to_param }
          }.to change(Review, :count).by(1)
        end

        it 'expose a newly created product' do
          post :create, { review: valid_attributes, product_id: product.to_param, category_id: category.to_param }
          expect(controller.review).to be_a(Review)
          expect(controller.review).to be_persisted
        end

        it 'redirects to the assigned product' do
          post :create, { review: valid_attributes, product_id: product.to_param, category_id: category.to_param }
          expect(response).to redirect_to(category_product_url(product.category, product))
        end

        describe 'with invalid params' do
          it 'expose a newly created but unsaved review' do

            allow_any_instance_of(Review).to receive(:save).and_return(false)
            post :create, { review: { 'content' => 'invalid value' }, product_id: product.to_param, category_id: category.to_param }
            expect(controller.review).to be_a_new(Review)
          end

          it "re-renders the product show template" do
            allow_any_instance_of(Review).to receive(:save).and_return(false)
            post :create, { review: { 'content' => 'invalid value' }, product_id: product.to_param, category_id: category.to_param }
            expect(response).to render_template 'products/show'
          end
        end
      end
    end
  end

  describe 'PUT update' do
    context 'user is signed in' do
      let(:user) { create(:user) }
      let(:review) { Review.create! valid_attributes }

      before do
        sign_in user
        allow(controller).to receive_message_chain(:user_signed_in?).and_return(true)
        allow(controller).to receive_message_chain(:current_user).and_return(user)
        allow(controller).to receive_message_chain(:authenticate_user!).and_return(user)
        product.user = user
      end

      describe 'with valid params' do
        it 'updates the requested review' do
          allow_any_instance_of(Review).to receive(:save).and_return(true)
          put :update, { id: review.to_param, review: { 'content' => 'New value' }, product_id: product.to_param, category_id: category.to_param }
          expect(response).to redirect_to(category_product_path(product.category, product))
        end

        it 'expose the requested review' do
          put :update, { id: review.to_param, review: valid_attributes, product_id: product.to_param, category_id: category.to_param }
          expect(controller.review).to eq(review)
        end

        it 'redirects to the reviewed product' do
          put :update, { id: review.to_param, review: valid_attributes, product_id: product.to_param, category_id: category.to_param }
          expect(response).to redirect_to(category_product_url(product.category, product))
        end
      end

      describe 'with invalid params' do
        it 'expose the review' do
          allow_any_instance_of(Review).to receive(:save).and_return(false)
          put :update, { id: review.to_param, review: { 'title' => 'invalid value' }, product_id: product.to_param, category_id: category.to_param }
          expect(controller.review).to eq(review)
        end

        it "re-renders the 'edit' template" do
          allow_any_instance_of(Product).to receive(:save).and_return(false)
          put :update, { id: review.to_param, review: { 'title' => 'invalid value' }, product_id: product.to_param, category_id: category.to_param }
          expect(response).to redirect_to(category_product_url(product.category, product))
        end
      end
    end
  end

  describe 'DELETE destroy' do
    let(:user) { create(:user) }
    let(:category) { create(:category, name: "NewNewName") }
    let(:product) { create(:product) }
    let(:review) { create(:review, user: user, product: product) }

    context 'user is signed in' do
      before do
        sign_in user
        allow(controller).to receive_message_chain(:user_signed_in?).and_return(true)
        allow(controller).to receive_message_chain(:current_user).and_return(user)
        allow(controller).to receive_message_chain(:authenticate_user!).and_return(user)
        review.user = user
      end

      it 'destroys the requested review' do
        expect {
          delete :destroy, { id: review.to_param, product_id: product.to_param, category_id: category.to_param }
        }.to change(Review, :count).by(-1)
      end

      it 'redirects to the product page' do
        delete :destroy, { id: review.to_param, product_id: product.to_param, category_id: category.to_param }
        expect(response).to redirect_to(category_product_url(product.category, product))
      end
    end

    context 'user is not signed in' do
      it 'redirects user to login page' do
        delete :destroy, { id: review.to_param, product_id: product.to_param, category_id: category.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
