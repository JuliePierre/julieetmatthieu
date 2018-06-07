class Answer < ApplicationRecord
  validates :name, :email, presence: true

  after_create :send_notification

  private

  def send_notification
    AnswerMailer.confirmation(self).deliver_now
  end
end
