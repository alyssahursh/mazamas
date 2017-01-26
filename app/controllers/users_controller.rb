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

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    stripe_customer = Stripe::Customer.create(
      :email => @user.email,
    )
    @user.stripe_id = stripe_customer.id
  end





  def start_subscription
    # Find the existing user
    @user = current_user

    # Check that there is a stripe account in their name, or create one
    stripe

    # Make the API Key available to this method
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    # Hold the customer's token, locate the customer's stripe record, then save the token as a new source
    token = params[:stripeToken]
    stripe_customer = Stripe::Customer.retrieve(@user.stripe_id)
    stripe_customer.sources.create({:source => token})

    # Create the stripe subscription
    subscription = Stripe::Subscription.create(
      :customer => @user.stripe_id,
      :plan => "annual-membership"
    )

    # Update the user
    @user.subscription_id = subscription.id
    @user.membership_status = "active"
    @user.membership_expiration = Date.today + 1.year
    @user.autorenew = true
    @user.save

    # Redirect to the user show page
    redirect_to user_path(@user)
  end

  def end_autorenew
    @user = current_user

    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    subscription = Stripe::Subscription.retrieve(@user.subscription_id)
    subscription.delete(:at_period_end => true)

    @user.autorenew = false
    @user.save

    redirect_to user_path(@user)
  end

  def restart_autorenew
    @user = current_user

    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    subscription = Stripe::Subscription.retrieve(@user.subscription_id)
    subscription.plan = "annual-membership"
    subscription.save

    @user.autorenew = true
    @user.save

    redirect_to user_path(@user)
  end



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your account was successfully updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      puts "About to set user"
      @user = User.find(params[:id])
      puts "User is #{@user}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {}).permit(:first_name, :last_name, :email, :birthdate, :address1, :address2, :city, :state, :zip, :phone, :emergency_contact, :emergency_phonera)
    end

    def stripe
      puts "Checking for stripe account"
      if @user.stripe_id.nil?
        puts "Stripe account id is nil #{@user.stripe_id}"
        Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

        stripe_customer = Stripe::Customer.create(
          :email => @user.email
        )
        @user.stripe_id = stripe_customer.id
        puts "Stripe account id is #{@user.stripe_id}"
      end
    end
end
