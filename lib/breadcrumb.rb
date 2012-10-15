module Breadcrumb
  def breadcrumb
    @breadcrumb_helper ||= Breadcrumb::Helper.new
  end
end

ActionView::Base.send :include, Breadcrumb
