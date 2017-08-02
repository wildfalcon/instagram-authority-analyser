class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.references :user, foreign_key: true
      t.string :bio
      t.string :name
      t.string :uid
      t.string :image
      t.string :nickname
      t.string :website
      t.string :access_token

      t.timestamps
    end
  end
end
