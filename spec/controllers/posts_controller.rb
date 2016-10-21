require "rails_helper"

describe PostsController, type: :controller do
  describe 'render index template' do
	it 'GET index' do
		get :index
		expect(response).to render_template(:index)   
	end

	it 'GET error' do
		get :index
		expect(response.status).to eq(200) # wraps assert_template
	end
  end
end