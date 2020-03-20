class ApplicationController < ActionController::Base

  helper_method :hours_of_operation
  helper_method :readable_time




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

  def readable_time(time)
    if time == 600
      return "6am"
    elsif time == 650
      return "6:30am"
    elsif time == 700
      return "7am"
    elsif time == 750
      return "7:30am"
    elsif time == 800
      return "8am"
    elsif time == 850
      return "8:30am"
    elsif time == 900
      return "9am"
    elsif time == 950
      return "9:30am"
    elsif time == 1000
      return "10:00am"
    elsif time == 1050
      return "10:30am"
    elsif time == 1100
      return "11am"
    elsif time == 1150
      return "11:30am"
    elsif time == 1200
      return "12pm"
    elsif time == 1250
      return "12:30pm"
    elsif time == 1300
      return "1pm"
    elsif time == 1350
      return "1:30pm"
    elsif time == 1400
      return "2pm"
    elsif time == 1450
      return "2:30pm"
    elsif time == 1500
      return "3pm"
    elsif time == 1550
      return "3:30pm"
    elsif time == 1600
      return "4pm"
    elsif time == 1650
      return "4:30pm"
    elsif time == 1700
      return "5pm"
    elsif time == 1750
      return "5:30pm"
    elsif time == 1800
      return "6pm"
    elsif time == 1850
      return "6:30pm"
    elsif time == 1900
      return "7pm"
    elsif time == 1950
      return "7:30pm"
    elsif time == 2000
      return "8pm"
    elsif time == 2050
      return "8:30pm"
    elsif time == 2100
      return "9pm"
    elsif time == 2150
      return "9:30pm"
    elsif time == 2200
      return "10pm"
    elsif time == 2250
      return "10:30pm"
    elsif time == 2300
      return "11pm"
    elsif time == 2350
      return "11:30pm"
    elsif time == 2400
      return "12am"
    elsif time == 100
      return "1am"
    elsif time == 150
      return "1:30am"
    elsif time == 200
      return "2am"
    elsif time == 250
      return "2:30am"
    elsif time == 300
      return "3am"
    elsif time == 350
      return "3:30am"
    elsif time == 400
      return "4am"
    elsif time == 450
      return "4:30am"
    elsif time == 500
      return "5am"
    elsif time == 550
      return "5:30am"
    end
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
