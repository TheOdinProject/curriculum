 class SitemapController < ApplicationController

   def index
     @static_pages = static_pages
     @courses = Course.all

     respond_to do |format|
       format.xml
     end
   end

   private

   def static_pages
     [root_url, about_url, contact_url, faq_url, login_url, signup_url].freeze
   end
 end
