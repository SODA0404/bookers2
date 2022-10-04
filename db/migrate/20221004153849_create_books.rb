class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.text :string
      t.body :text
      t.user_id :integer

      t.timestamps
    end
  end
end
