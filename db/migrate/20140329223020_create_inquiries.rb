class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :ip_address
      t.string :current_zip
      t.string :future_zip
      t.string :date

      t.timestamps
    end
  end
end
