require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_uniqueness_of(:user_id).scoped_to(:messenger, :body) }
end
