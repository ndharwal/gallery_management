class UserDecorator < Draper::Decorator
  delegate_all
  
  def full_name
    try(:fname).to_s + " " + try(:lname).to_s  
  end
end
