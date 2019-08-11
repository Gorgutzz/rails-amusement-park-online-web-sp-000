class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # binding.pry

    if !enough_tickets_to_ride? && !tall_enough_to_ride?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."

    elsif !enough_tickets_to_ride?
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."

    elsif !tall_enough_to_ride?
    "Sorry. You are not tall enough to ride the #{self.attraction.name}."

    else
      update_user_ticket_post_ride
      update_user_happiness_post_ride
      update_user_nausea_post_ride
      "Thanks for riding the #{self.attraction.name}!"

    end
  end


  ##helper methods for above

  def enough_tickets_to_ride?
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough_to_ride?
    self.user.height > self.attraction.min_height
  end

  def update_user_ticket_post_ride
    self.user.tickets -= self.attraction.tickets
    self.user.save
  end

  def update_user_happiness_post_ride
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end

  def update_user_nausea_post_ride
    self.user.nausea += self.attraction.nausea_rating
    self.user.save
  end

end
