require 'rails_helper'

RSpec.describe 'Admin User Tests', type: :feature do

  let(:user) { create(:user, role: 'admin') }

  it 'allows the user to log in' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'notapassword'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
    click_on 'Add Conservation Record'
  end
end
