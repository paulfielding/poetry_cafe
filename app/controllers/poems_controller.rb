class PoemsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
  	@poem = current_user.poems.build(params[:poem])
  	if @poem.save
  		flash[:success] = "Poem created!"
  		redirect_to root_path
  	else
      @feed_items = []
  		render 'static_pages/home'
  	end
  end

  def destroy
    @poem.destroy
    redirect_to root_path
  end

  private
   def correct_user
      @poem = current_user.poems.find_by_id(params[:id])
      redirect_to root_path if @poem.nil?
    end
end