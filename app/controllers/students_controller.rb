# StudentsController inherits from ApplicationController
# so any settings defined there will apply to this controller.
class StudentsController < ApplicationController
  # GET '/'
  get '/' do
    redirect to '/students'
  end

  get '/students' do
    @students = Student.all
    erb :'students/index' # render the index.erb within app/views/students
  end

  get '/students/new' do
    erb :'students/new'
  end

  post '/students' do 
    @student = Student.create(params["student"]) if params["student"]

    redirect to "/students/#{@student.slug}"
  end

  get '/students/:slug/edit' do
    @student = Student.find_by(:slug => params["slug"])

    erb :'students/edit'
  end

  put '/students/:slug' do
    @student = Student.find_by(:slug => params["slug"])
    binding.pry
    @student.update_attributes(params["student"])
    binding.pry

    redirect to "/students/#{@student.slug}"
  end
 

  # Build the rest of the routes here.

  # GET '/students/new'
  # POST '/students'
  # GET '/students/avi-flombaum'
  # GET '/students/avi-flombaum/edit'
  # POST '/students/avi-flombaum'


  get '/students/:slug' do
    @student = Student.find_by(:slug => params["slug"])
    erb :"students/show"
  end
end
