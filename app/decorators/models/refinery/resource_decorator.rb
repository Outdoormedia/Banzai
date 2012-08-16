require 'acts-as-taggable-on'

Refinery::Resource.class_eval do
  acts_as_taggable
  attr_accessible :tag_list
end
