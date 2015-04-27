class ApiController < ApplicationController
  include NumericHelper

  def check_coordinates
    latitude   = convert_coordinates(params[:latitude])
    longtitude = convert_coordinates(params[:longtitude])
    email      = params[:email]

    if latitude.present? and longtitude.present? and email.present?
      @treasure = Treasure.near([latitude.to_f, longtitude.to_f], 1000000, :order => "distance", :units => :km).first
      distance = @treasure.distance_from([latitude.to_f, longtitude.to_f], :km) * 1000 #value in km
      distance = distance.round

      if distance <= 5
        @treasure.founded += 1
        @treasure.save
        TreasureMailer.inform_user(email, @treasure.founded).deliver_later
      end

      render json: {
             status:   'ok',
             distance: distance
             }
    else
      render json: {status: 'error', distance: -1, error: 'error description'}
    end
  end

end
