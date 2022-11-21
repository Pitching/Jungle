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
        expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
      end

      it 'fails since there is no given first name' do
        @user.last_name = nil
        @user.save
        expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
      end
  end
end
