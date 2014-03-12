class Student < ActiveRecord::Base
  before_save :slugify!

  def slugify!
    self.slug = self.name.downcase.gsub(/\s/, "-")
  end
end