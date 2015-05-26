# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ApiKey < ActiveRecord::Base
  # Callbacks
  before_create :generate_key

  # Associations
  belongs_to :user

  # Methods



  private

  def generate_key
    begin
      self.key = SecureRandom.hex
    end while self.class.exists?(key: key)
  end
  
end
