class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def self.deleted_account(user)
    @user = user
    mail(to: user.email) do |format|
      format.html { render 'user_email' }
      format.text { render text 'user_email' }
  end

end
