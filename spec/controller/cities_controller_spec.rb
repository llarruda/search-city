require 'rails_helper'

RSpec.describe CitiesController, :type => :controller do
  context "Get #index" do
    it "should response with http status 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "Get #show" do
    it "should response with http status 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "Post #search" do
    let(:params) {
      { search: 'curitiba' }
    }

    it "should response with http status 200" do
      post :search, params: { post: params }
      expect(response).to have_http_status(200)
    end

    it 'should be fulfilled with sucessful status' do
      post :search, params: { post: params }
      expect(response).to be_successful
    end
  end
end
