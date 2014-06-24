class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

    def auth_hash
    request.env['omniauth.auth']
  end



  def create
     auth = request.env["omniauth.auth"]
    @user = User.create_with_omniauth(auth)
   
   render :show
   # redirect_to show_path
  end

  # GET /users/1/edit
  def edit
  end


  
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  # POST /users
  # POST /users.json

  




  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :access_token, :access_secret)
    end
end
