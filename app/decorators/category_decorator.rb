class CategoryDecorator < Draper::Decorator
  delegate_all
  decorates_association :products

  def name_upcase
    model.name.upcase
  end

end
