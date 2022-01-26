require 'rails_helper'

RSpec.describe 'Devise forms', type: :system do
  describe 'Log in' do
    it 'shows the right content' do
      visit root_path
      sleep(5)
      expect(page).to have_content('Log in')
    end
  end
end
