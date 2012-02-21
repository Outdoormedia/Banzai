class HomeController < ApplicationController
        
        def index
          @login_message = "Please login: "
          @welcome_message = "Welcome to the MOVE System."
          @login_status_message = "You are not logged in at this time."
        end
end
