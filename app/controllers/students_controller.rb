# StudentsController inherits from ApplicationController
# so any settings defined there will apply to this controller.
class StudentsController < ApplicationController
  # GET '/'
  get '/' do
    # Homepage action to display the student index.
    # Load all the students into an instance variable.
    # We use the ::all method on the Student class, provided by Sequel
    @students = Student.all
    erb :'students/index' # render the index.erb within app/views/students
  end

  # Build the rest of the routes here.

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
  # GET '/students/avi-flombaum'
  # GET '/students/avi-flombaum/edit'
  # POST '/students/avi-flombaum'
  
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
