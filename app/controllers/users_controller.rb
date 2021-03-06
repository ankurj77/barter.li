class UsersController < ApplicationController
  before_action :authenticate_user!
  respond_to :json, :html, only: [ :create_user_review ]
  
  # edit profile of the user
  # get /profile
  def edit_profile
  	@user = current_user
  end
  
  # patch /profile
  def update_profile
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to root_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit_profile' }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # post /user_reviews
  def create_user_review
    @user_review = UserReview.new(user_review_params)
      if @user_review.save
        respond_with(@user_review) 
      else
        respond_with(@user_review.errors)
      end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, 
      :middle_name, :gender, :age, :birthday, :anniversary, :occupancy, 
      :marital_status, :mobile, :region, :country, :state, :city, :street,
      :address, :pincode, :latitude, :locality, :longitude, :accuracy, :altitude)
    end

    def user_review_params
      params.require(:user_review).permit(:body, :user_id)
    end

end



