class EnrollmentsController < ApplicationController
  before_filter :require_admin, :except => [:index]
  before_filter :get_course

  def index
    @course = Course.find(params[:course_id])
  end

  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.find_by(email: params[:email].downcase)

    respond_to do |format|
      if @user
        @course.users << @user
        flash.now[:success] = 'Student was successfully enrolled.'
        format.html { render action: "index" }
      else
        flash.now[:error] = 'Error trying to enroll student.'
        format.html { render action: "index" }
      end
    end
  end

  # GET /courses/1/enroll
  def destroy
    logger.debug params
    @user = User.find(params[:id])

    @course.users.delete(@user)
    @user.courses.delete(@course)

    respond_to do |format|
      flash.now[:success] = 'User successfully removed from course.'
      format.html { render action: "index" }
    end
  end

  private

    def get_course
      @course = Course.find(params[:course_id])
    end

end
