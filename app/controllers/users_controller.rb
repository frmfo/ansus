class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :user_params_without_password, only: [:update]
  

  # GET /users
  def index
    @users = policy_scope(User.includes(:branches, :roles).all)
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to users_path
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      @user.update_without_password(user_params_without_password)
     
    else
      @user.update(user_params)
      
    end
    authorize @user

    if @user.valid?
      if @user == current_user
        bypass_sign_in(@user)
      end

      redirect_to users_path
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    authorize @user
    redirect_to users_url, notice: 'Usuário excluído.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin, role_ids: [], branch_ids: [] )
    end

    def user_params_without_password
      if user_params[:password].blank? && user_params[:password_confirmation].blank?
        user_params.delete(:password)
        user_params.delete(:password_confirmation)
        user_params
      end
    end
end
