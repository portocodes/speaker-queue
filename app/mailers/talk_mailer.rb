class TalkMailer < ActionMailer::Base
  default from: "speakerqueue@porto.codes"

  def talk_created(talk)
    @talk = talk

    mail(
      to: User.admins.pluck(:email),
      subject: "[speakerqueue] #{talk.user.name} proposed a talk"
    )
  end
end
