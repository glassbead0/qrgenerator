class CreateQrcodes < ActiveRecord::Migration
  def change
    create_table :qrcodes do |t|
      t.string :text_to_encode
      t.integer :size
      t.string :level

      t.timestamps
    end
  end
end
