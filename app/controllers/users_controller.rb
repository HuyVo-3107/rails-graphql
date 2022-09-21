require 'aws-sdk-cognitoidentityprovider'
class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def invite
    client = Aws::CognitoIdentityProvider::Client.new(
      region: 'us-east-1',
      credentials: Aws::Credentials.new('AKIAVMOGNHE76M3RPQPA', 'tHM+2T49tbCTzFMEkHC/xnK0CwWU82t9lpyKXwYQ'),
      )

    resp = client.admin_get_user({
                                   user_pool_id: "us-east-1_wm2RDwts1", # required
                                   username: "717db010-acd4-4fdf-9c77-e9b69aa3c703", # required
                                 })
    resp_create = client.admin_create_user({
                                      user_pool_id: "us-east-1_wm2RDwts1", # required
                                      username: "tuhuy147@gmail.com", # required
                                      user_attributes: [
                                        {
                                          name: "email", # required
                                          value: "tuhuy147@gmail.com",
                                        },
                                        {
                                          name: "phone_number", # required
                                          value: "+840908965892",
                                        },
                                      ],
                                      validation_data: [],
                                      temporary_password: "123asd!@#QWE",
                                      force_alias_creation: false,
                                      message_action: "SUPPRESS", # accepts RESEND, SUPPRESS
                                      client_metadata: {
                                        "StringType" => "StringType",
                                      },
                                    })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
