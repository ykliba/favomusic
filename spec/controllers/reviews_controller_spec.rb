require 'rails_helper'

describe ReviewsController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end

    describe 'GET #edit' do
      it "@reviewに正しい値が入っていること" do
        review = create(:review)
        get :edit, params: { id: review }
        expect(assigns(:review)).to eq review
      end

      it "edit.html.hamlに遷移すること" do
        tweet = create(:tweet)
        get :edit, params: { id: tweet }
        expect(response).to render_template :edit
      end
    end

    describe 'GET #index' do
      it "@reviewに正しい値が入っていること" do
        reviews = create_list(:review, 3)
        get :index
        expect(assigns(:reviews)).to match(reviews.sort{ |a, b| b.created_at <=> a.created_at } )
      end

      it "index.html.erbに遷移すること" do
        get :index
        expect(response).to render_template :index
      end
    end
  
  end
end