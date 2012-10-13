# encoding: UTF-8

class Breadcrumb::Helper
  def parts
    @parts ||= []
  end
  
  def add(label, url = nil, params = {})
    parts << [label, url, params]
    self  
  end
  
  def separator
    @separator ||= '<span class="separator"> » </span>'
  end
  
  def <<(label, url = nil, params = {})
    add(label, url = nil, params = {})
  end
  
  def to_s
    html = []
    parts.each do |part|
      if part == parts.last
        html << "<span>#{part[0]}</span>"
      else
        html << "<a href=\"#{part[1]}\">#{part[0]}</a>"
      end
    end
    
    html.length > 1 ? "<div class=\"breadcrumb\">#{html.join(separator)}</div>" : ""
  end
  
  def titleize
  end
end

