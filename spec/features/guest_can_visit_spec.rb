require 'rails_helper'

feature 'Guest can visit the home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content 'Virtual Job Fair'
  end
end
