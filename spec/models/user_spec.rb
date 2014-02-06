require 'spec_helper'

describe User do
  
  context 'before save' do
    describe '#set_age' do
      it 'calculates and saves records age' do
        user = FactoryGirl.create(:user, :dob => Date.parse("1986-01-20"))
        expect(user.age).to eq(28)
      end
    end
  end

  context 'after save' do
    it "is invalid without a first name" 
    it "is invalid without a last name" 
    
  end

  describe '#full_name' do
    it "returns a user's full name as a string" do
      user = FactoryGirl.create(:user)
      expect(user.full_name).to eq([user.first_name, user.last_name].join(" "))
    end
  end

end
