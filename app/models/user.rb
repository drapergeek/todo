class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  
  def set_logged_in
    update_attribute(:last_login_at, Time.now)
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def to_s
    full_name
  end
end
