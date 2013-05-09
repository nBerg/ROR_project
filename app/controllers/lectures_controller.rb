class LecturesController < ApplicationController
  before_filter :get_course

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = @course.lectures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lectures }
    end
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @lecture = @course.lectures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lecture }
    end
  end

  # GET /lectures/new
  # GET /lectures/new.json
  def new
    @lecture = @course.lectures.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lecture }
    end
  end

  # GET /lectures/1/edit
  def edit
    @lecture = @course.lectures.find(params[:id])
  end

  # POST /lectures
  # POST /lectures.json
  def create

    logger.debug "HERE2"
    logger.debug params

    @lecture = @course.lectures.new(params[:lecture])

    respond_to do |format|
      if @lecture.save
        flash[:success] = 'Lecture was successfully created.'
        format.html { redirect_to course_lectures_path(@course) }
        format.json { render json: @lecture, status: :created, location: @lecture }
      else
        format.html { render action: "new" }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lectures/1
  # PUT /lectures/1.json
  def update
    @lecture = @course.lectures.find(params[:id])

    respond_to do |format|
      if @lecture.update_attributes(params[:lecture])
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture = @course.lectures.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to course_lectures_url }
      format.json { head :no_content }
    end
  end

  def get_course
    logger.debug "HERE"
    logger.debug params
    @course = Course.find(params[:course_id])
  end

end
