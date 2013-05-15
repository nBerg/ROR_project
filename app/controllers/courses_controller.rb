class CoursesController < ApplicationController
    before_filter :require_admin, :except => [:index, :show]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.order_by('Call_Number ASC').paginate(page: params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    logger.debug params

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        logger.debug 'saved!!!!'
        flash[:success] = 'Course was successfully created.'
        format.html { redirect_to @course }
        format.json { render json: @course, status: :created, location: @course }
      else
        logger.debug 'not saved!!!!'
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
  
    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:success] = 'Course was successfully updated.'
        format.html { redirect_to @course }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end 
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      flash[:success] = 'Course was successfully destroyed.'
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
