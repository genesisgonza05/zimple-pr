module JournalistsHelper

  def button_name(action)
    action == "new" ? "Create" : "Update"
  end
end
