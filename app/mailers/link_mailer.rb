class LinkMailer < ApplicationMailer
  def expiry_link_email
    @link = params[:link]

    mail to: @user.email, subject: "Link About to Expire!"
  end
end
