# Preview all emails at http://localhost:3000/rails/mailers/link_mailer
class LinkMailerPreview < ActionMailer::Preview
  def expiry_link_email
    # Set up a temporary order for the preview
    link = Link.new(original_url: "https://google.com")
    
    LinkMailer.with(link: link).expiry_link_email
  end
end
