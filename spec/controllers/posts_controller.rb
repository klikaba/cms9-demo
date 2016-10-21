require "rails_helper"

describe PostsController, type: :controller do
  describe 'render index template' do
	it 'GET index template' do
		get :index
		expect(response).to render_template(:index)   
	end

	it 'GET status 200' do
		get :index
		expect(response.status).to eq(200) # wraps assert_template
	end

	it 'GET error' do
		get :index
		expect(response.status).not_to eq(300) # wraps assert_template
	end
  end

   describe 'render post template' do
	
   	let(:post_definition) { FactoryGirl.create(:post_definition) }
   	let(:post_field) { FactoryGirl.create(:post_field) }
   	let(:field) { FactoryGirl.create(:field) }
   	let(:post) { FactoryGirl.create(:post) }

	it 'SHOW post' do
		get :show, id: post 
		expect(response).to render_template(:show)   
	end

	it 'GET error' do
		get :show, id: post 
		expect(response.status).to eq(200) # wraps assert_template
	end

	it 'assigns requested post to @post' do
		get :show, id: post 
		expect(assigns(:post)).to eq(post) # wraps assert_template
	end

  end
end