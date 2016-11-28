class WikiPolicy < ApplicationPolicy

  def update?
    user.admin? or record.user_id == user.id
    #user.present?
  end

  def destroy?
    user.admin? or record.user_id == user.id
    #user.present?
  end
end
