class UserDecorator < Draper::Decorator
  delegate_all

  def fullname
     "#{user.firstname} #{user.lastname}"
  end
end
