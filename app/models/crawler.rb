class Crawler < ActiveRecord::Base
  validates_presence_of :name, :description, :input_params, :classname
  serialize :input_params, Hash
end
