# frozen_string_literal: true

# :nodoc
class AddColumnfromActiveStorageAttachments < ActiveRecord::Migration[7.1]
  def change
    add_column :active_storage_attachments, :cover, :boolean, default: false
  end
end
