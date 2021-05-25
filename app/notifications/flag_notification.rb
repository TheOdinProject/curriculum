class FlagNotification < Noticed::Base
  deliver_by :database, format: :to_database

  def to_database
    {
      type: self.class.name,
      params: params[:flag],
      url: params[:url],
      message: params[:message]
    }
  end

  param :flag, :url, :message
end
