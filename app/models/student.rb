class Student < ActiveRecord::Base
  before_save :slugify!

  #slugify!
  def slugify!
    self.slug = self.name.downcase.split(" ").join("-")
  end
end