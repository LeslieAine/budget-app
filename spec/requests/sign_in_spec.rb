require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! name: 'Markos', email: 'markos@gmail.com', password: 'password'
    end

    it 'Fill incorrect email and password inputs' do
      visit new_user_session_path
      fill_in 'Email', with: 'marko@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Without fill email and password inputs' do
      visit new_user_session_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Fill correct email and password inputs' do
      visit new_user_session_path
      fill_in 'Email', with: 'markos@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end
