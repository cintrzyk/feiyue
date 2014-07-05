class Spree::UserMailer < ActionMailer::Base
  # FEIYUE_EMAIL = "Feiyue Solar <info@feiyuesolar.nl>"
  FEIYUE_EMAIL = "Feiyue Solar <wjm@feiyuesolar.nl>"

  default from: FEIYUE_EMAIL

  def confirm_contact(contact)
    @contact = contact
    mail to: @contact.email, subject: "Feiyue Solar Contact"
  end

  def remind_contact(contact)
    @contact = contact
    mail to: FEIYUE_EMAIL, subject: "Feiyue Solar new contact #{@contact.name} at #{@contact.created_at}"
  end

  def send_request_price(email, product, amount)
    @email = email
    @product = product
    @amount = amount
    mail to: FEIYUE_EMAIL, subject: "Feiyue Solar #{email} vragen over de prijs #{@product.name}"
  end
end
