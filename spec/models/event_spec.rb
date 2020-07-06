# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  employee_id   :bigint
#  store_id      :bigint
#  starts_at     :datetime
#  ends_at       :datetime
#  pause         :time
#  vacation      :boolean          default(FALSE)
#  sick          :boolean          default(FALSE)
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  custom_status :string
#  manager       :boolean          default(FALSE)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
