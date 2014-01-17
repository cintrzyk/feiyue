module ApplicationHelper
  def backbone_view
    [controller_name, action_name].map(&:camelcase).join
  end
end
