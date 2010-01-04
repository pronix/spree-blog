# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class BlogExtension < Spree::Extension
  version "1.0"
  description "Simple blog facility"
  url "git://github.com/paulcc/spree-blog.git"
  
  def activate
    # admin.tabs.add "Blog", "/admin/blog", :after => "Layouts", :visibility => [:all]

    # Add a link to the blog administration page on the configuration page
    Admin::BaseController.class_eval do
      before_filter :add_blog_links#, :only => :index
      def add_blog_links
        #@extension_links << {:link => admin_blog_entries_path, :link_text => t('blog_management'), :description => t('blog_management_description')}
        @extension_tabs << [:blog, {:route => :admin_blog_entries, :match_path => '/blog'}]#{:link => admin_blog_entries_path, :link_text => t('blog_management'), :description => t('blog_management_description')}
      end
    end
    
    # Add blog mention access functionality to the product model
    Product.class_eval do
      has_many :blog_entries
    end
  end
  
  def deactivate
    admin.tabs.remove "Blog"
  end
  
end