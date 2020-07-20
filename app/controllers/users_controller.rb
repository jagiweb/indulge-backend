class UsersController < ApplicationController

      def sign_in
        # Try and find a user in our database with the username we've been sent
        user = User.find_by(username: params[:username])
        # If we can find a user, attempt to authenticate them with the password we've been sent
        if user && user.authenticate(params[:password])
          # If we can authenticate the user successfully, send them back their username and generate a token for them
          render json: { username: user.username, token: generate_token(id: user.id) }
        else
          # Otherwise, send back an error
          render json: { error: "Username or Password is invalid "}
        end
      end
    
      def sign_up
        # Try and find a user in our database with the username we've been sent
        user = User.new(users_params)
        # If we can find a user, attempt to authenticate them with the password we've been sent
        if user.valid?
          # If we can authenticate the user successfully, send them back their username and generate a token for them
          user.save
          render json: { user: user, username: user.username, token: generate_token(id: user.id), message: "Your account has been created" }
        else
          # Otherwise, send back an error
          render json: { message: "Invalid username/password/email"}
        end
      end
    
      def validate
        # Check if we can decode the token we've been sent and find a valid user
        if get_user
          # If so, send back that user's username and a newly generated token
          render json: { username: get_user.username, token: generate_token(id: get_user.id)}
        else
          # Otherwise, send back an error
          render json: { error: "You are not authorized" }
        end
      end

    private

    def users_params
      params.permit(:username, :password, :email, :name, :lastname)
    end

end
