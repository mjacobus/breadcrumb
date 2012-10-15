# encoding: UTF-8

class Breadcrumb::Helper
  
  # get parts
  def parts
    @parts ||= []
  end
  
  # add breadcrumb
  def add(label, url = nil)
    parts << [label, url]
    self  
  end
  
  # prepend elements to the breadcrumb
  def prepend(label, url = nil)
    parts.prepend([label, url])
    self
  end
  
  # set title separator
  def separator=(separator)
    @separator = separator
    self
  end
  
  def separator
    @separator ||= '<span class="separator"> » </span>'
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
  
  # Given
  #   add 'Home','/'
  #   add 'News','/news'
  #   add 'The Last News','news/the-last-news'
  #
  #   titleize 'Home :: News :: The Last News'
  #
  # with block given
  # when block returns not nil, not false, uses return as title part
  #
  #   titleize {|part| Example.com if part == 'Home'}  'Example.com :: News :: The Last News'
  #
  # when returns nil, uses default title part
  # when returns false, skips part
  #   titleize {|part, order| false if order == 0 }  'News :: The Last News'
  def titleize(&block)
    title_parts = []
    order = 0
    parts.each do |part|
      
      if block_given?
        response = yield(part.first,order)
        if response != false
          if response == nil
            title_parts << part.first
          else
            title_parts << response
          end
        end
      else
        title_parts << part.first
      end
      order += 1
    end
    title_parts.join(title_separator)
  end
  
  # set title separator
  def title_separator=(separator)
    @title_separator = separator
    self
  end
  
  def title_separator
    @title_separator ||= ' :: '
  end
end

