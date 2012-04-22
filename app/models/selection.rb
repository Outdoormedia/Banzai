class Selection < ActiveRecord::Base
  # attr_accessible :title, :body

  HIDDEN_POSITION = 999888777

  acts_as_tree

  def to_s
    name.to_s
  end
end
