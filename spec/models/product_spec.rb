require 'rails_helper'
require "product"


RSpec.describe Product, type: :model do
  describe "Validation" do 
    context "validates name" do 
      it "returns true" do 
        category = Category.new(:name => "Cat")
        category.save
        product = Product.new(:price => 10, :quantity => 5, :category => category)
        expect(product).not_to be_valid
      end
    end
    context "validates price" do 
      it "returns true" do 
        category = Category.new(:name => "Cat")
        category.save
        product = Product.new(:name => "Johnny", :quantity => 5, :category => category)
        expect(product).not_to be_valid
      end
    end
    context "validates quantity" do 
      it "returns true" do 
        category = Category.new(:name => "Cat")
        category.save
        product = Product.new(:name => "Johnny", :price => 10, :category => category)
        expect(product).not_to be_valid
      end
    end
    context "validates category" do 
      it "returns true" do 
        category = Category.new(:name => "Cat")
        category.save
        product = Product.new(:name => "Johnny",:price => 10, :quantity => 5)
        expect(product).not_to be_valid
      end
    end
    context "validates error" do 
      it "returns true" do 
        category = Category.new(:name => "Cat")
        category.save
        product = Product.new(:name => "Johnny",:price => 10, :quantity => 5)
        expect(product).not_to be_valid
      end
    end
  end
end
