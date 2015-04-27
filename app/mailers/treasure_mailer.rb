class TreasureMailer < ApplicationMailer

  def inform_user(email, nth)
    @nth = nth
    mail(to: email, subject: 'Hey, you’ve found a treasure, congratulations!')
  end
end
