class Crawler < ActiveRecord::Base
  validates_presence_of :name, :icon, :description, :input_params, :classname, :output_fields, :id_fields
  serialize :id_fields, Hash
  serialize :input_params, Hash
  serialize :output_fields, Array
end
