class ProductDecorator < Draper::Decorator
  delegate_all

  def owner
    model.user.decorate.fullname
  end

  def title
    model.title.humanize
  end

  def average_rating
    model.average_rating.round(2)
  end

  def category_name
    model.category.name
  end
end
