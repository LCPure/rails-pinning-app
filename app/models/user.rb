class User < ActiveRecord::Base

  def self.authenticate(email, password)
     	 
	 @user = User.find_by_email(email)
	 if !@user.nil?
	    return @user
	 else
	    return nil
	 end
  end	 
  
end
