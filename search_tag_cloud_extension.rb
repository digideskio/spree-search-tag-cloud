# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SearchTagCloudExtension < Spree::Extension
  version "1.0"
  description "Search Tag Cloud to report search statistics and generate tag cloud"
  url "http://www.endpoint.com/"

  def activate
    Spree::ProductsController.send(:include, Spree::SearchTagCloud::ProductsController)
  end
end
