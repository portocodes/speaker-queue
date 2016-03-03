class TalkMailer < ActionMailer::Base

  def talk_created(user)
    mail(
      to: user.email,
      from: "someone@gmail.com", #using GMAIL this line isnt read. with other providers this is considered,
      subject: "New Talk Created",
      body: "This is the body from my first mailer"
    )
  end

end
