# StudentsController inherits from ApplicationController
# so any settings defined there will apply to this controller.
class StudentsController < ApplicationController
  # GET '/'
  # get '/' do
  #   # Homepage action to display the student index.
  #   # Load all the students into an instance variable.
  #   # We use the ::all method on the Student class, provided by Sequel
  #   @students = Student.all
  #   erb :'students/index' # render the index.erb within app/views/students
  # end

  # Build the rest of the routes here.

  # GET '/students/new'
  # POST '/students'
  # GET '/students/avi-flombaum'
  # GET '/students/avi-flombaum/edit'
  # POST '/students/avi-flombaum'


  get '/students/:slug' do
    @student          = Student.find_by(slug: params[:slug])
    @name             = @student.name
    @profile_image    = @student.profile_image
    @background_image = @student.background_image
    @twitter          = @student.twitter
    @linkedin         = @student.linkedin
    @github           = @student.github
    @quote            = @student.quote
    @bio              = @student.bio
    @work             = @student.work
    @work_title       = @student.work_title
    @education        = @student.education
    erb :"students/show_student.html"
  end






end
