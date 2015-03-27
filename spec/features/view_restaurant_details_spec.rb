require 'rails_helper'

feature 'user views restaurant details' do
  let(:restaurant) { FactoryGirl.create(:restaurant) }
  let(:restaurant1) { FactoryGirl.create(:restaurant1) }

  scenario 'user views restaurant details' do
    sign_up
    restaurant
    restaurant1
    visit "/restaurants"
    click_link "#{restaurant.name}"
    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant.address)
    expect(page).to have_content(restaurant.city)
    expect(page).to have_content(restaurant.state)
    expect(page).to have_content(restaurant.zipcode)

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
