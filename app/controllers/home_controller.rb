class HomeController < ApplicationController
        
        def index
          @login_message = "Please login: "
          @welcome_message = "Welcome to the MOVE System."
          @login_status_message = "You are not logged in at this time."
          
          @copyright_message = "Copyright 2007-12 MOVE Pty Ltd"
          @organization_name = 'Outdoor Media Association'

        end
end
