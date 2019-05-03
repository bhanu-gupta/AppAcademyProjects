require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET#new' do 
        it 'brings up a form for signing up' do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'POST#create' do
        context 'for valid user' do
            let!(:valid_params) { {user: {username: 'validname', password: '123456'}} }
            before(:each) do
                post :create, params: valid_params
            end

            it 'should save user to the database' do
                expect(User.last.username).to eq('validname')    
            end

            it 'should redirect to users show page' do
                expect(response).to redirect_to(user_url(User.last.id))
                expect(response).to have_http_status(302)
            end

            it 'should login a user' do
                expect(subject.current_user.username).to eq('validname')
            end
        end

        context 'for invalid user' do
            let!(:invalid_params) { {user: {username: 'invalidname', password: '123'}} }
            before(:each) do
                post :create, params: invalid_params
            end

            it 'should add errors to flash errors cookie' do
                expect(flash[:errors]).to be_present
            end

            it 'should render new_users page' do
                expect(response).to render_template(:new)
                expect(response).to have_http_status(200)
            end
        end
    end

end