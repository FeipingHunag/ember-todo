class Project < ActiveRecord::Base
  has_many :tasks

  validates :name, :description, presence: true
end
