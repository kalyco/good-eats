require 'rails_helper'

feature 'user adds review' do
  let(:restaurant) { FactoryGirl.create(:restaurant) }
  let(:review) {FactoryGirl.create(:review) }
  let(:review1) {FactoryGirl.create(:review1) }
  let(:review2) {FactoryGirl.create(:review2) }


  scenario 'user can view multiple restaurant reviews' do
    sign_up
    restaurant
    review
    review2
    visit "/restaurants"
    click_link "#{restaurant.name}"

    expect(page).to have_content("#{review.body}")
    expect(page).to have_content("#{review2.body}")

  end

  scenario 'user views review only for specific restaurant' do
    sign_up
    restaurant
    review1
    visit "/restaurants"
    click_link "#{restaurant.name}"

    expect(page).not_to have_content("#{review1.body}")
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
