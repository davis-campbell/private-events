class RenameEventIdInEventAttendings < ActiveRecord::Migration
  def change
    rename_column :event_attendings, :event_id, :attended_event_id
  end
end
