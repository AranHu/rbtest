class CreateIcomments < ActiveRecord::Migration
  def change
    create_table :icomments do |t|
      t.text :content
      t.string :username
      t.string :email
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
