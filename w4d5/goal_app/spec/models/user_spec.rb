require 'rails_helper'

RSpec.describe User, type: :model do 

    describe 'uniqueness' do
        before(:each) do
            create(:user)
        end

        it {should validate_uniqueness_of(:username)}
        it {should validate_uniqueness_of(:session_token)}
    end

    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password).is_at_least(6)}

    describe '::find_by_credentials' do
        let!(:user) { create(:user) }

        it 'should return a valid user' do
            expect(User.find_by_credentials(user.username, 'pasword123')).to eq(user)
        end

        it 'should return nil for an invalid user' do
            expect(User.find_by_credentials(user.username, 'notpassword')).to be_nil
        end

    end

    describe '#is_password?' do
        let!(:user) { create(:user)}
        
        context 'with valid password' do
            it 'should return true' do
                expect(user.is_password?('pasword123')).to be(true)
            end
        
        end

        context 'with invalid password' do 
            it 'should return false' do
                expect(user.is_password?('wrongpassword')).to be(false)
            end
        end
    end

    describe '#reset_session_token!' do
        let!(:user) { create(:user)}

        it 'should return a new session token' do
            session_token = user.session_token
            expect(user.reset_session_token!).to_not eq(session_token)
        end

        it 'should save the new session token to database' do
            expect(user.reset_session_token!).to eq(User.last.session_token)
        end

    end
end