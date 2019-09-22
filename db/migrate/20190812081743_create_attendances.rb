class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.references :attendee, index:true
      t.belongs_to :attended_event, index: true
    end
  end
end
