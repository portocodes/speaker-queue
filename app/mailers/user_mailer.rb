class UserMailer < ActionMailer::Base
  default from: "speakerqueue@porto.codes"

  def login(email)
    @access_code_url = login_session_url(token: LoginToken.generate(email))

    mail(
      to: email,
      subject: "Login speakerqueue access code",
    )
  end
end
