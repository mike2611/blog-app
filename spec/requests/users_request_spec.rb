require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe ':index' do
    it 'Gets an ok status' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'Correct template is render' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'The body includes the correct placeholder text' do
      get '/users'
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe ':index' do
    it 'Gets an ok status' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'Correct template is render' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'The body includes the correct placeholder text' do
      get '/users/1'
      expect(response.body).to include('Here is a profile for a given user')
    end
  end
end
