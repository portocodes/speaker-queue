class UserMailer < ActionMailer::Base
  def login(email)
    @access_code_url = login_token_url(token: LoginToken.generate(email))

    mail(
      to: email,
      subject: "Login speakerqueue access code",
    )
  end
end
