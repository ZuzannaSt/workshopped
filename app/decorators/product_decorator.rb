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

  def short_description
    h.truncate(model.description, length: 680)
  end

end
