class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :collaborator_users, through: :collaborators, source: :user

  default_scope { order('created_at DESC') }
  scope :visible_wiki, -> (user) { user.admin? ? all : user.premium? ? where('private = 0 OR user_id = ?', user.id) : where('private = 0') }
  scope :private_wiki, -> (user) { where('private = 1 AND user_id = ?', user.id)}

end
