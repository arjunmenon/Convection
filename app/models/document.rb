# == Schema Information
#
# Table name: documents
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  description       :text
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer(4)
#  data_updated_at   :datetime
#  user_id           :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

class Document < ActiveRecord::Base       
  has_attached_file :data, :path => ":rails_root/file-storage/:attachment/:id/:style/:filename", :url => "/documents/:id/download/:style" #TODO add :style - route needs fixing
  belongs_to :user                     
  validates_attachment_presence :data
  
  def change_hash
    returning Hash.new do |to_ret|
      to_ret = {:name => self.name, :description => self.description, :id => self.id}
      to_ret.merge!(self.user.change_hash) if self.user
    end
  end  
end
