class TalkMailer < ActionMailer::Base

  def talk_created(user)
    @user = user
    #last talk created is the new talk for the current user
    @talk = @user.talks.last
    mail(
      to: user.email,
      from: "someone@somedomain.com", #if using GMAIL this line isn't read. with other providers this is considered.
      subject: "New Talk Created"
    )
  end
end
