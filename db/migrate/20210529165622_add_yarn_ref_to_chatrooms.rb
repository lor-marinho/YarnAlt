class AddYarnRefToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :yarn, foreign_key: true
  end
end
