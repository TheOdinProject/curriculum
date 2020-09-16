class ErrorsController < ApplicationController
  def not_found
    render status: :not_found
  end
end
