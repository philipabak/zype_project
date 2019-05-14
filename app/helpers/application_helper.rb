module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info alert-dismissible"
      when 'success' then "alert alert-success alert-dismissible"
      when 'error' then "alert alert-danger alert-dismissible"
      when 'alert' then "alert alert-warning alert-dismissible"
    end
  end
end
