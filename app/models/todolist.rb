class Todolist < ApplicationRecord
  validates_presence_of :title, :description, :date
end
