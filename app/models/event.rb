# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  comment       :text
#  custom_status :string
#  ends_at       :datetime
#  manager       :boolean          default(FALSE)
#  pause         :time
#  sick          :boolean          default(FALSE)
#  starts_at     :datetime
#  vacation      :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :bigint
#  store_id      :bigint
#
# Indexes
#
#  index_events_on_employee_id  (employee_id)
#  index_events_on_store_id     (store_id)
#

class Event < ActiveRecord::Base	
	# associations
  belongs_to :user
  belongs_to :store
  belongs_to :employee

  # methods
  def status
  	if store_id
  		self.store.name
  	else
  		custom_status
  	end
  end

  def working_hours
  	Time.at(ends_at - starts_at - pause.to_f).utc.strftime("%H:%M")
  end


end
