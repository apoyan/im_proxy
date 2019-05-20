class MessageEntity
  def self.build(message)
    {
      user_id: message.user_id,
      messenger: message.messenger,
      status: message.valid? ? 'passed' : 'failed',
      error: message.errors.first
    }
  end
end
