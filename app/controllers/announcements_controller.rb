class AnnouncementsController < ApplicationController
  before_filter :get_course
  before_filter :require_admin, :except => [:index, :show]

  # GET /courses/1/announcements
  def index
    @announcements = @course.announcements.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /course/1/announcements/1
  def show
    @announcement = @course.announcements.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /courses/1/announcements/new
  def new
    @announcement = @course.announcements.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /course/1/announcements/1/edit
  def edit
    @announcement = @course.announcements.find(params[:id])
  end

  # POST /course/1//announcements
  def create
    @announcement = @course.announcements.new(params[:announcement])

    respond_to do |format|
      if @announcement.save
        flash[:success] = 'Announcement was successfully created.'
        format.html { redirect_to [@course, @announcement] }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /course/1/announcements/1
  def update
    @announcement = @course.announcements.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        flash[:success] = 'Announcement was successfully updated.'
        format.html { redirect_to [@course, @announcement] }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /course/1/announcements/1
  def destroy
    @announcement = @course.announcements.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to course_url(@course) }
    end
  end


  private

    def get_course
      @course = Course.find(params[:course_id])
    end
end
