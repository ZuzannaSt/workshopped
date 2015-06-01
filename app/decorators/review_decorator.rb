class ReviewDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def author
     "#{user.firstname} #{user.lastname}"
  end

  def rating
    content_tag(:span) do
      stars
      halfstar
    end

  end

  def stars
    model.rating.times do
      concat content_tag(:i, "", class: "fa fa-star")
    end
  end

  def halfstar
    if model.rating % 1 == 0.5
      concat content_tag(:i, "", class: "fa fa-star-half-full")
    end
  end

  def link_to_author
    link_to content_tag(:em, author), model.user
  end

  def rating_with_author
    rating + link_to_author
  end
end
