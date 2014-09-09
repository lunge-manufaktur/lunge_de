class ContactForm < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :name, validate: true
  attribute :message

  def headers
    {
      subject: "Anfrage via lunge.de",
      to: "info@lunge.com",
      from: "#{name} <#{email}>",
      reply_to: email
    }
  end
end