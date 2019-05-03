require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    before(:each) do
        visit new_user_url
    end

    scenario 'has a new user page' do
        expect(page).to have_content 'New User'
    end

    feature 'signing up a user' do
        scenario 'shows username on the homepage after signup' do
            username = Faker::Internet.user_name
            fill_in('username', with: "#{username}")
            fill_in('password', with: "123456")
            click_button 'Sign Up!'
            
            expect(page).to have_content username
        end
    end
end

feature 'logging in' do
    let!(:user) {create(:user)}
    scenario 'shows username on the homepage after login' do
        log_user_in(user)
        expect(page).to have_content user.username
    end

end

feature 'logging out' do
    let!(:user) {create(:user)}
    before(:each) do

        log_user_in(user)
        
        click_button('Log Out!')
        
    end

    scenario 'begins with a logged out state' do
        expect(page).to have_content 'Log In!'
    end
    
    scenario 'doesn\'t show username on the homepage after logout' do
        expect(page).to_not have_content user.username
    end
end