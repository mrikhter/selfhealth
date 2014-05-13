class ChangeGenderInUsers < ActiveRecord::Migration
  def self.up
    User.all.each do |user|
      if user.gender == "female"
        user.gender = 0
      else
        user.gender = 1
      end
      user.save!
    end

    change_column :users, :gender, 'integer USING CAST(gender AS integer)'
  end

  def self.down
    change_column :users, :gender, :string
  end
end
