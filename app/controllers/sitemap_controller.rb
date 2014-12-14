 class SitemapController < ApplicationController

   def index
     @static_pages = [root_url, about_url, contact_url, faq_url, login_url, signup_url]
     @frequently_updated_pages = [forum_url]
     @courses = Course.all
     respond_to do |format|
       format.xml
     end
   end
 end