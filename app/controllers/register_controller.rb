class RegisterController < PublicController
    def new
        @user = User.new
        puts "hey girl"
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to profile_path(@user), notice: "Welcome #{@user.email}"
        else 
            render :new, status: :unprocessable_entity
        end
    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end