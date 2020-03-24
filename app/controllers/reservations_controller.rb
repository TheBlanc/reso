class ReservationsController < ApplicationController

  def new
   @reso = Reservation.new
  end

  def create
    @reso = Reservation.new
    @reso.name = params[:reservation][:name]
    @reso.phonenumber = params[:reservation][:phonenumber]
    @reso.date = params[:reservation][:date]
    @reso.time = params[:reservation][:time]
    @reso.partysize = params[:reservation][:partysize]
    @reso.notes = params[:reservation][:notes]

    if @reso.save
      flash[:notice] = "Reservation successfully made."
      redirect_to reservation_path(@reso)
    else
      flash[:notice] = "Something went wrong."
      render :new
    end

  end

  def show
    @reso = Reservation.find(params[:id])
  end

  def edit
    @reso = Reservation.find(params[:id])
  end

  def update
    @reso = Reservation.find(params[:id])
    @reso.name = params[:reservation][:name]
    @reso.phonenumber = params[:reservation][:phonenumber]
    @reso.date = params[:reservation][:date]
    @reso.time = params[:reservation][:time]
    @reso.partysize = params[:reservation][:partysize]
    @reso.notes = params[:reservation][:notes]


    if @reso.save
      flash[:notice] = "Reservation successfully updated."
      redirect_to reservation_path(@reso)
    else
      flash[:notice] = "Something went wrong."
      render :edit
    end

  end

  def index
    @resos = Reservation.all.order(:date).order(:time)
  end

  def today
    reservations = Reservation.where("date = ?", Date.today)
    @resos = reservations.order(:time)
  end

  def tomorrow
    reservations = Reservation.where("date = ?", Date.today + 1.days)
    @resos = reservations.order(:time)
  end

  def twodays
    reservations = Reservation.where("date = ?", Date.today + 2.days)
    @resos = reservations.order(:time)
  end

  def threedays
    reservations = Reservation.where("date = ?", Date.today + 3.days)
    @resos = reservations.order(:time)
  end

  def fourdays
    reservations = Reservation.where("date = ?", Date.today + 4.days)
    @resos = reservations.order(:time)
  end

  def fivedays
    reservations = Reservation.where("date = ?", Date.today + 5.days)
    @resos = reservations.order(:time)
  end

  def sixdays
    reservations = Reservation.where("date = ?", Date.today + 6.days)
    @resos = reservations.order(:time)
  end

  def destroy
    @reso = Reservation.find(params[:id])
    @reso.destroy

    redirect_to root_url
  end

end
