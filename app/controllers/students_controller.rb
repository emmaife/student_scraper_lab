# StudentsController inherits from ApplicationController
# so any settings defined there will apply to this controller.
class StudentsController < ApplicationController

  get '/' do
    # Homepage action to display the student index.
    # Load all the students into an instance variable.
    # We use the ::all method on the Student class, provided by Sequel
    @students = Student.all
    erb :'students/index.html' # render the index.erb within app/views/students

  end

  get '/students/new' do
    params[:student] ||= {}
    params[:student][:education] ||= ""
    @student = Student.new(params[:student])
    erb :"students/edit.html"
  end

  post '/students' do
    params[:student][:education].gsub!(/\n/, ",")
    student = Student.create(params[:student])
    redirect "/students/#{student.slug}", 303
  end


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

  
  get '/students/:slug/edit' do
    @student = Student.find_by(slug: params[:slug])
    erb :"students/edit.html"
  end

  post '/students/:slug' do
    student = Student.find(params[:slug])
    params[:students][:education].gsub!(/\n/, ",")
    redirect "/students/#{student.slug}", 303
  end


end
