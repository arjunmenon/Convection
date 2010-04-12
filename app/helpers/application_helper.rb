# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper      
                             
                
  # pass { :nolabel => true } to replace the label with a spacer   
  # pass { :required => true } to dispay as a required field  
  # pass { :text => "foo" } to override the label text
  # def labeled_input(form, field, options = {}) 
  #   options[:text] = "&nbsp;" if options[:nolabel]
  #   options.reverse_merge!(:text => nil, :size => 30, :required => false, :nolabel => false)
  #   options.merge!(:form => form, :field => field)     
  #   
  #   cssclass = "labeled_input"
  #   cssclass += " required" if options[:required]
  # 
  #   # debugger
  #   
  #   unless input = options[:input]
  #     input = form.text_field field, :size => options[:size]
  #   end
  #   
  #   label = form.label field, options[:text]      
  #   comment = options[:comment] ? content_tag( :span, { :class => 'comment' } ) { options[:comment] }  : ""
  #                                           
  #   # debugger
  #   content_tag :div, { :class => cssclass } do
  #     label + input + comment 
  #   end              
  # end
                  
  # same function as application_controller.rb's logged_in? method
  def logged_in?
    !current_user.nil?
  end                
  
  def delete_widget(object, options = {})
    link_to image_tag('delete.png'), (options[:path] || object), :confirm => 'Are you sure?', :method => :delete, :title => "Delete #{object.class}"       
  end
  
  def edit_widget(object, options = {})
    link_to image_tag('edit.png'), (options[:path] || edit_polymorphic_path(object)), :title => "Edit #{object.class}"        
  end
  
  # returns a hash showing the changes between the before/after states
  # of two activerecord objects.  If both before and after are specified,
  # it should return a hash formatted like "object.changes", otherwise,
  # it should just return the attribute hash of whichever one wasn't nil
  def loggable_details(before, after)
    map = {}
    if (!before.nil? && !after.nil?)
      merged_keys = before.attributes.merge(after.attributes).keys
      merged_keys.each do |key| 
        if (before[key] != after[key])
          map.merge!({ key => [before[key], after[key]]})     
        end 
      end
    elsif(before || after) 
      item = before || after
      item.attributes.each do |key, val| 
        # only include non-nil attributes
        map.merge!({ key => item[key]}) if !val.nil?
      end
    end            
    map
    
  end  

                                 
end
