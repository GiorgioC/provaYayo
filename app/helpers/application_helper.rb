module ApplicationHelper
  # app/helpers/application_helper.rb
  def add_this(options)
    # add google analytics tracking
    url = request.fullpath
    url += url.include?('?') ? '&' : '?'
    url += 'utm_source=add_this&utm_medium=%{provider}'

    StaticAddthis.icons(options.reverse_merge(
      :title => @page_title,
      :url => request.fullpath,
      :username => '',
      :uid => ''
    ))
  end
end
