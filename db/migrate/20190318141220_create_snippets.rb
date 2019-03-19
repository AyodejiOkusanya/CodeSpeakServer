class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.string :codesnippet
      t.integer :user_id
      t.timestamps
    end
  end
end
