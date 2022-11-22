require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.create({
        first_name: 'Bobby',
        last_name: 'Hill',
        email: 'bobbyhill@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
    end

    it 'fails since there is no given first name' do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'fails since there is no given last name' do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'fails since there is no given password' do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'fails since there is no given password confirmation' do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'fails since there is no given email' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'fails since the given email is invalid' do
      @user.email = 'babababaaba'
      @user.save
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'fails since the password is below 8 characters' do
      @user.password = 'pass'
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it 'fails since the password and password confirmation do not match' do
      @user.password = 'password123'
      @user.password_confirmation = 'password1234'
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.create({
        first_name: 'Bobby',
        last_name: 'Hill',
        email: 'bobbyhill@gmail.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
    end

    it 'should login successfully given correct credentials' do
      loginUser = User.authenticate_with_credentials("bobbyhill@gmail.com", "testpass")
      expect(loginUser).to match(@user)
    end

    it 'should not login succesfully given incorrect credentials' do
      loginUser = User.authenticate_with_credentials("bobbyhill23@gmail.com", "testpass")
      expect(loginUser).to be(nil)
    end

    it 'should authenticate the user even if they include caps' do
      loginUser = User.authenticate_with_credentials("BOBBYhIlL@gmail.com", "testpass")
      expect(loginUser).to match(@user)
    end

    it 'should authenticate the user even if they include spaces' do
      loginUser = User.authenticate_with_credentials("   bobbyhill@gmail.com", "testpass")
      expect(loginUser).to match(@user)
    end
  end

end