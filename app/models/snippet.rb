class Snippet < ActiveRecord::Base
  attr_accessible :language_id, :source_code
  belongs_to :language
end
