require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @category = Category.create(:name => 'Ferns')
      @product = Product.create({name: 'PlantName', price: 10.99, quantity: 10, category: @category})
    end

    it 'passes validation since all parameters have values' do
      expect(@product).to be_valid
    end

    it 'fails since there is no name declared' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'fails since there is no price declared' do
      @product.price = 'test'
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Price is not a number")
    end

    it 'fails since there is no quantity declared' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'fails since there is no category declared' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Category must exist")
      expect(@product.errors.full_messages[1]).to eq("Category can't be blank")
    end
  
  end
end