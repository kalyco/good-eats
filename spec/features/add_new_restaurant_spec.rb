require 'rails_helper'

feature 'user views restaurant details' do

  scenario 'user adds new restaurant' do
    sign_up

    visit "/restaurants/new"
    fill_in 'Name', with: 'Snowcone King'
    fill_in 'Address', with: 'Igloo #6'
    fill_in 'City', with: 'Juneau'
    fill_in 'State', with: 'Alaska'
    fill_in 'Zipcode', with: '77777'
    click_button "Add Restaurant"

    expect(page).to have_content('You have added a new restaurant!')
  end
end

def sign_up
  visit new_user_registration_path

  fill_in 'Email', with: 'john@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

  click_button 'Sign up'

  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_content('Sign Out')
end
