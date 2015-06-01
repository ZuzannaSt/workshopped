class UserDecorator < Draper::Decorator
  delegate_all

  def fullname
     "#{user.firstname} #{user.lastname}"
  end


  def online?
    updated_at > 5.minutes.ago
  end

  def joined
    model.created_at.to_formatted_s(:pretty_date)
  end

  def last_active
    model.last_sign_in_at.to_formatted_s(:pretty_date)
  end

  def last_reviews
    model.reviews.last(5).reverse
  end

  def count_reviews
    model.reviews.count
  end
end
