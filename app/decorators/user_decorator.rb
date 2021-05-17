class UserDecorator < Draper::Decorator
  delegate_all

  def greeting
    return "Hi #{first_name} #{last_name}" if first_name? && last_name?

    "Hi #{email}"
  end
end
