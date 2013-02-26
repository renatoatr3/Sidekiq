class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.integer :language_id
      t.text :source_code

      t.timestamps
    end
  end
end
