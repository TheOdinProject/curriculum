class FlagNotification < Noticed::Base
  deliver_by :database

  param :flag
end
