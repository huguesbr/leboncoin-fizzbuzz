class CreateRequestEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :request_entries do |t|
      t.string :request_method
      t.string :path
      t.json :params
      t.string :params_hash

      t.timestamps
    end
  end
end
