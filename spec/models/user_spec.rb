require 'spec_helper'

describe User do
  
  context 'before save' do
    it "is invalid without a first name" do
      user = FactoryGirl.build(:user, :first_name => nil)
      expect(user).to be_invalid
    end

    it "is invalid without a last name" do
      user = FactoryGirl.build(:user, :last_name => nil)
      expect(user).to be_invalid
    end

    it "is invalid without an email" do
      user = FactoryGirl.build(:user, :email => nil)
      expect(user).to be_invalid
    end

    describe '#set_age' do
      it 'calculates and saves records age' do
        user = FactoryGirl.create(:user, :dob => Date.parse("1986-01-20"))
        expect(user.age).to eq(28)
      end
    end
    
  end

  describe '#full_name' do
    it "returns a user's full name as a string" do
      user = FactoryGirl.create(:user)
      expect(user.full_name).to eq([user.first_name, user.last_name].join(" "))
    end
  end

end
