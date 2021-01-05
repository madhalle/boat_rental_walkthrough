class Dock
    attr_reader :name,
                :max_rental_time,
                :rental_log,
                :revenue

  def initialize(name, max_rental_time)
    @name            = name
    @max_rental_time = max_rental_time
    @rental_log      = {}
    @revenue         = 0
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end



  def charge(boat)
    if boat.hours_rented <= @max_rental_time
      cost = boat.hours_rented * boat.price_per_hour
    else
      cost = @max_rental_time * boat.price_per_hour
    end
    {
      :card_number => rental_log[boat].credit_card_number,
      :amount => cost
    }
    # if boat.amount >= @max_rental_time
    #    boat.amount
    #  end
  end

  def log_hour
    @rental_log.each do |boat, rental|
      boat.add_hour
    end
  end

  def return(boat)
    @revenue += charge(boat)[:amount]
    @rental_log.delete(boat)
  end
end
