class LecturesController < ApplicationController
  before_filter :get_course
  before_filter :require_admin, :except => [:show]

  # GET /course/1/lectures/1
  def show
    @lecture = @course.lectures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /courses/1/lectures/1/edit
  def edit
    @lecture = @course.lectures.find(params[:id])

    logger.debug @course
    logger.debug @lecture
  end

  # POST /course/1/lectures
  def create
    next_num = @course.Num_Lectures + 1
    @lecture = @course.lectures.new(:num => next_num)
    @course.Num_Lectures = next_num

    respond_to do |format|
      if @lecture.save && @course.save
        format.html { redirect_to edit_course_lecture_url(@course, @lecture) }
      else
        # TODO: May be a problem where one is saved and not the other
        format.html { render action: course_path(@course) }
      end
    end
  end

  # PUT /courses/1/lectures/1
  def update
    @lecture = @course.lectures.find(params[:id])

    respond_to do |format|
      if @lecture.update_attributes(params[:lecture])
        flash[:success] = 'Lecture was successfully updated.'
        format.html { redirect_to [@course, @lecture] }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /course/1/lectures/1
  def destroy
    @lecture = @course.lectures.find(params[:id])

    if (@lecture.num == @course.Num_Lectures)
      @course.Num_Lectures -= 1
      @course.save
    end

    @lecture.destroy

    # TODO: Need to figure out how I want to deal with this

    respond_to do |format|
      flash[:success] = 'Lecture was successfully destroyed.'
      format.html { redirect_to course_url(@course) }
    end
  end


  private

    def get_course
      @course = Course.find(params[:course_id])
    end

end
