class RegisterController < PublicController
    def new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to home_path
        else
            redirect_to register_path, status: :unprocessable_entity, alert: "Unable to save"
        end
    end

    private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end