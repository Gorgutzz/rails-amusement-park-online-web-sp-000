class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if (self.nausea.to_i > self.happiness.to_i)
      return "sad"
    elsif (self.nausea.to_i < self.happiness.to_i)
      return "happy"
    end
  end

end
