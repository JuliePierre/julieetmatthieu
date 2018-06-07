class AnswerMailer < ApplicationMailer

  def confirmation(answer)
    @answer = answer

    mail(to: "julieetmatthieu.mariage@gmail.com", subject: 'Vous avez reçu une nouvelle réponse')
    # This will render a view in `app/views/answer_mailer`!
  end
end
