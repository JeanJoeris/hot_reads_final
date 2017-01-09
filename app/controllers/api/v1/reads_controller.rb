class Api::V1::ReadsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @read = Read.new(link_id: params[:link_id])
    if @read.save
      render json: @read, status: 201
    else
      render json: @read.errors.full_messages, status: 500
    end
  end
end
