Factory.define :document do |document|
  document.name "value for name"
  document.description "value for description"
  document.data_file_name "value for data_file_name"
  document.data_content_type "value for data_content_type"
  document.data_size "value for data_size"
  document.data_update_at Time.now
  document.user_id 1
end