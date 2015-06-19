class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def fullname
     "#{user.firstname} #{user.lastname}"
  end

  def online?
    if updated_at && updated_at > 5.minutes.ago
      is_online
    else
      is_offline
    end
  end

  def is_online
    content_tag(:small) do
      concat content_tag(:i, "", class: "fa fa-circle")
      concat " online"
    end
  end

  def is_offline
    content_tag(:small, "offline")
  end

  def joined
    model.created_at.to_formatted_s(:pretty_date)
  end

  def last_active
    if model.last_sign_in_at.nil?
      "Not active"
    else
      model.last_sign_in_at.to_formatted_s(:pretty_date)
    end
  end

  def last_reviews
    model.reviews.limit(5)
  end

  def count_reviews
    model.reviews.count
  end

  def counted_reviews
    if count_reviews == 1
      "1 product"
    else
      "#{count_reviews} products"
    end
  end
end
