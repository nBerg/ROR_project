require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { Building1: @course.Building1, CallNumber: @course.CallNumber, CourseTitle: @course.CourseTitle, EndTime1: @course.EndTime1, Instructor1Name: @course.Instructor1Name, MeetsOn1: @course.MeetsOn1, Room1: @course.Room1, StartTime1: @course.StartTime1 }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: { Building1: @course.Building1, CallNumber: @course.CallNumber, CourseTitle: @course.CourseTitle, EndTime1: @course.EndTime1, Instructor1Name: @course.Instructor1Name, MeetsOn1: @course.MeetsOn1, Room1: @course.Room1, StartTime1: @course.StartTime1 }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
