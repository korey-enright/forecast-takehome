class CreateCurrentWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :current_weathers do |t|
      t.references :forecast, null: false, foreign_key: true
      t.string :temp_f
      t.string :temp_c

      t.timestamps
    end
  end
end
