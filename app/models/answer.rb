class Answer < ApplicationRecord
  after_create :send_notification

  private

  def send_notification
    AnswerMailer.confirmation(self).deliver_now
  end
end
