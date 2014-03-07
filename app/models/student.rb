class Student < ActiveRecord::Base

  def name=(name)
    super(name)
    self.slug=slugify
  end

  def slugify
    self.name.gsub(/\s/, "-").downcase
  end

end