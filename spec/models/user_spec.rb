require 'rails_helper'

RSpec.describe User, type: :model do
  #:todo it { should have_many(:todos) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:password_digest) }
end
