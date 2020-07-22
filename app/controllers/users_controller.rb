class UsersController < ApplicationController

      def sign_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          render json: { username: user.username, token: generate_token(id: user.id), user: user, tournaments: user.tournaments}
        else
          render json: { error: "Username or Password is invalid "}
        end
      end
    
      def sign_up
        user = User.new(users_params)
        if user.valid?
          user.save
          render json: { user: user, username: user.username, token: generate_token(id: user.id), tournaments: user.tournaments }
        else
          render json: { message: "Invalid username/password/email"}
        end
      end
    
      def validate
        if get_user
          render json: { username: get_user.username, token: generate_token(id: get_user.id), user: get_user, id: get_user.id, tournaments:get_user.tournaments}
        else
          render json: { error: "You are not authorized" }
        end
      end

      def get_tournaments
        user = User.find_by(id: params[:id])
        if user
            render json: {tournaments: user.tournaments}
        else
            render json: {message: "Invalid"}
        end

    end

    private

    def users_params
      params.permit(:username, :password, :email, :name, :lastname)
    end

end
