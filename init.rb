Redmine::Plugin.register :issues_link do
  name 'Issues Link plugin'
  author 'Pavel S. Khmelinsky'
  description 'Adding issues link to the top menu'
  version '0.0.1'
  url 'http://it-clever.ru/';
  author_url 'http://it-clever.ru/'

	menu :top_menu, :issues , {:controller => 'issues', :action => 'index', :project_id => nil}, :caption => 'Issues', :if => Proc.new {
		User.current.logged? 
	}
end

class RedmineIssuesLinkHookListener < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context)
      stylesheet_link_tag 'issues_link', :plugin => :issues_link
  end
end
