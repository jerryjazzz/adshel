class StopTime < ActiveRecord::Base
  belongs_to :trip, primary_key: :trip_id
end
