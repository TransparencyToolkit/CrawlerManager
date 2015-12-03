class Crawler < ActiveRecord::Base
  validates_presence_of :name, :description, :input_params, :classname, :output_fields
  serialize :input_params, Hash
  serialize :output_fields, Array
end
