class ApplicationController < ActionController::Base

  helper_method :hours_of_operation
  helper_method :number_of_seats_available



  private

  def hours_of_operation
    openTime = Restaurant.find(1).open_at
    closeTime = Restaurant.find(1).close_at

    timeArray = [["6am", 600], ["6:30am", 650], ["7am", 700], ["7:30am", 750], ["8am", 800], ["8:30am", 850], ["9am", 900], ["9:30am", 950], ["10am", 1000], ["10:30am", 1050], ["11am", 1100], ["11:30am", 1150], ["12pm", 1200], ["12:30pm", 1250], ["1pm", 1300], ["1:30pm", 1350], ["2pm", 1400], ["2:30pm", 1450], ["3pm", 1500], ["3:30pm", 1550], ["4pm", 1600], ["4:30pm", 1650], ["5pm", 1700], ["5:30pm", 1750], ["6pm", 1800], ["6:30pm", 1850], ["7pm", 1900], ["7:30pm", 1950], ["8pm", 2000], ["8:30pm", 2050], ["9pm", 2100], ["9:30pm", 2150], ["10pm", 2200], ["10:30pm", 2250], ["11pm", 2300], ["11:30pm", 2350], ["12am", 2400], ["12:30am", 50], ["1am", 100], ["1:30am", 150], ["2am", 200], ["2:30am", 250], ["3am", 300], ["3:30am", 350], ["4am", 400 ], ["4:30am", 450], ["5am", 500], ["5:30am", 550]]

    openTimeArray = []

    timeArray.each do |time|
      if time[1] >= openTime && time[1] <= closeTime
        openTimeArray << time
      end
    end
    
    return openTimeArray
  end

  def number_of_seats_available(date, time)
    date = date.to_s
    reservationsOnDay = Reservation.where("date = ?", date)
    restaurantCapacity = Restaurant.find(1).capacity
    seatsTaken = 0
    reservationsOnDay.each do |reservation|
      reservationTimeBlock = [reservation.time, (reservation.time + 200)]
      if time >= reservationTimeBlock[0] && time <= reservationTimeBlock[1]
        seatsTaken += reservation.partysize
      end
    end
    seatsAvailable = restaurantCapacity - seatsTaken
    return seatsAvailable
  end

end
