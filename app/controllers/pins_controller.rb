class PinsController < ApplicationController

  def index
    @pins = Pin.all
    json_response(@pins)
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      json_response(@pin, :created)
    else
      json_response(@pin.errors, :unprocessable_entity)
    end

  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    head :no_content
  end

  private

  def set_pin

  end

  def pin_params
    params.require(:pin).permit(:title, :image, :user_id)
  end
end
