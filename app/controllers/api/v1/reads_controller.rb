class Api::V1::ReadsController < ApplicationController
  def create
    @read = Read.new(link_id: params[:link_id])
    if @read.save
      render json: @read, status: 201
    else

    end
  end
end
