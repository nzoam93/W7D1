class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            user.reset_session_token
            redirect_to cats_urls
        else
            render plain: "Invalid Credentials"
        end

    end

    def destroy
        logout
        redirect_to new_session_url
    end

    
end
