class LegalController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def accept
    session[:acceptLegal] = true
    puts session[:acceptLegal]
    render :nothing => true, :status => 204
  end

  def decline
    session[:acceptLegal] = false
    puts session[:acceptLegal]
    render :nothing => true, :status => 204
  end

end
