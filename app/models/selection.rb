class Selection < ActiveRecord::Base
  # attr_accessible :title, :body

  HIDDEN_POSITION = 999888777

  acts_as_tree

  def to_s
    name.to_s
  end

  def leaves
    Selection.where(parent_id: self.children.map(&:id))
  end

  def self.method_missing lookup_code, *options
    if (scope = Selection.where(:system_code => lookup_code.to_s)) && scope.exists?
      scope.first
    elsif (scope = Selection.where(:system_code => lookup_code.to_s.singularize)) && scope.exists?
      scope.first.children
    else
      super
    end
  end
end
