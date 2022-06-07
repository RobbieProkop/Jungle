require 'rails_helper'
require "user"

RSpec.describe User, type: :model do
  describe "Validation" do 
    context "validates first name" do 
      it "returns true" do 
        user = User.new(:last_name => "Smith",:email => "a@b.ca", :password => "123",  :password_confirmation => "123")
        expect(user).not_to be_valid
      end
    end
    context "validates last name" do 
      it "returns true" do 
        user = User.new(:first_name => "John", :email => "a@b.ca", :password => "123", :password_confirmation => "123")
        expect(user).not_to be_valid
      end
    end
    context "validates email" do 
      it "returns true" do 
        user = User.new(:first_name => "John", :last_name => "Smith", :password => "123", :password_confirmation => "123")
        expect(user).not_to be_valid
      end
    end
    context "validates uniqueness of email" do 
      it "returns true" do 
        user1 = User.new(:first_name => "John", :last_name => "Smith", :email => "a@b.ca", :password => "123", :password_confirmation => "123")
        user1.save
        user2 = User.new(:first_name => "Jane", :last_name => "Doe", :email => "a@B.ca", :password => "123", :password_confirmation => "123")
        expect(user2).not_to be_valid
      end
    end
    context "validates password" do 
      it "returns true" do 
        user = User.new(:first_name => "John", :last_name => "Smith",:email => "a@b.ca", :password_confirmation => "123")
        expect(user).not_to be_valid
      end
    end
    context "validates password confirmation" do 
      it "returns true" do 
        user = User.new(:first_name => "John", :last_name => "Smith", :email => "a@b.ca", :password => "123")
        expect(user).not_to be_valid
      end
    end
    context "validates if passwords match" do 
      it "returns true" do 
        user = User.new(:first_name => "John", :last_name => "Smith", :email => "a@b.ca", :password => "123", :password_confirmation => "123")
        expect(user.password).to eq(user.password_confirmation)
      end
    end
    context "validates password length" do 
      it "should not allow a password with less than 2 characters" do 
        user = User.new(:first_name => "John", :last_name => "Smith", :email => "a@b.ca", :password => "1", :password_confirmation => "1")
        expect(user).not_to be_valid
      end
    end
    
  end
  describe '.authenticate_with_credentials' do
    it "should return nil if user does not exist" do 
      user = User.create(:first_name => "John", :last_name => "Smith", :email => "a@b.ca", :password => "123", :password_confirmation => "123")
        expect(user.authenticate_with_credentials("email", "123")).to be_nil
    end
    context "if email has whitespaces" do 
      it "should return true" do 
        user = User.create(:first_name => "John", :last_name => "Smith", :email => "a@b.ca", :password => "123", :password_confirmation => "123")
        expect(user.authenticate_with_credentials(" a@b.ca ", "123")).not_to be_nil
      end
    end
    context "if user types different case for email" do 
      it "should return true" do 
        user = User.create(:first_name => "John", :last_name => "Smith", :email => "a@b.ca", :password => "123", :password_confirmation => "123")
        expect(user.authenticate_with_credentials("A@b.ca", "123")).not_to be_nil
      end
    end
  end
end
