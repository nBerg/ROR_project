class AssignmentsController < ApplicationController
  before_filter :get_lecture, :except => [:index]
  before_filter :get_course, :only => [:index]
  before_filter :require_admin, :except => [:index, :show]

  # GET /courses/1/assignments
  def index
    @lectures = @course.lectures.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /courses/1/lectures/1/assignments/1
  def show
    @assignment = @lecture.assignments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /courses/1/lectures/1/assignments/new
  def new
    @assignment = @lecture.assignments.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /courses/1/lectures/1/assignments/1/edit
  def edit
    @assignment = @lecture.assignments.find(params[:id])
  end

  # POST /courses/1/lectures/1/assignments
  def create
    @assignment = @lecture.assignments.new(params[:assignment])

    respond_to do |format|
      if @assignment.save
        flash[:success] = 'Assignment was successfully created.'
        format.html { redirect_to [@course, @lecture, @assignment] }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /courses/1/lectures/1/assignments/1
  def update
    @assignment = @lecture.assignments.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        flash[:success] = 'Assignment was successfully updated.'
        format.html { redirect_to [@course, @lecture, @assignment] }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /courses/1/lectures/1/assignments/1
  def destroy
    @assignment = @lecture.assignments.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to [@course, @lecture] }
    end
  end

  private

    def get_course
      @course = Course.find(params[:course_id])
    end

    def get_lecture
      get_course
      @lecture = @course.lectures.find(params[:lecture_id])
    end
end
