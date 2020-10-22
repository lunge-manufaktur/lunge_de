# == Schema Information
#
# Table name: api_keys
#
#  id         :bigint           not null, primary key
#  key        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_api_keys_on_user_id  (user_id)
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
