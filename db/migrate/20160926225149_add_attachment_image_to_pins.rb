class AddAttachmentImageToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :Image
    end
  end

  def self.down
    remove_attachment :pins, :Image
  end
end
