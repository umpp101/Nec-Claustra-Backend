class AddTranslatedContentToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :translated_content, :text
  end
end
