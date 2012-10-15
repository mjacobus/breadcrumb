module Breadcrumb
  def breadcrumb
    @breadcrumb_helper ||= Breadcrumb::Helper.new
  end
end

ActionController::Base.send :include, Breadcrumb
