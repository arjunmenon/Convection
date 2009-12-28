require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'digest'
require 'fileutils'

describe Document do
  before(:each) do
    @file = File.new(File.join(File.dirname(__FILE__),
                               "..",
                               "fixtures",
                               "5k.png"), 'rb')

    @valid_attributes = {
      :name => "a_file",
      :description => "value for description",
      :data => @file,
      :user_id => "1"
    }
  end

  after do
    @file.close
  end

  it "should create a new instance given valid attributes" do
    doc = Document.create!(@valid_attributes)

    source_sum = Digest::SHA512::file(@file.path)
    dest_sum = nil
    proc do
      dest_sum = Digest::SHA512::file("#{RAILS_ROOT}/file-storage/datas/#{doc.id}/original/5k.png")
    end.should_not raise_error

    dest_sum.should == source_sum
  end

  after(:all) do
    FileUtils::rm_rf("#{RAILS_ROOT}/file-storage/datas")
    
  end
end