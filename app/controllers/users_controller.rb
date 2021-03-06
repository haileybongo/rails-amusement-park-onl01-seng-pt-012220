class UsersController < ApplicationController
    
    def welcome
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.create(user_params)
            if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/signup'
        end
    end

    def signup
    end

    def signin
    end

    def login
        @user = User.find_by(name: params[:user][:name])
            if @user 
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
             redirect_to '/signin'
            end
    end

    def logout
        session.delete(:user_id)
        redirect_to '/'
    end


    def show
        if current_user
        @user = current_user
        else
            redirect_to '/'
        end
    end

   
    private
   
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password )
    end

end
