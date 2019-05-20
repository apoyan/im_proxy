class Message < ApplicationRecord
  validates :user_id, uniqueness: { scope: [:messenger, :body] }

  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique => e
    self.errors.add(:base, e.message)
    false
  end
end
