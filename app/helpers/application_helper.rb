module ApplicationHelper

  def form_validation_errors(object, field_name) 
    if object.errors.any?
      if !object.errors[field_name].blank?
        object.errors.messages[field_name].join(", ")
      end
    end
  end
end
