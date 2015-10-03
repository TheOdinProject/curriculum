module AdminFlashHelper
  
  def disabled_flash_ids_from_cookies
    disabled_flash_ids = []
    cookies.each do |name,value| 
      match = name.match(/admin_flash_(\d*)/)
      if match 
        disabled_flash_ids << match[1].to_i
      end  
    end
    disabled_flash_ids
  end
end
