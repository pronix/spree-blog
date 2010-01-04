require File.dirname(__FILE__) + '/../spec_helper'

describe BlogEntriesHelper do
  
  # needed to add this for spec to pass...
  include BlogEntriesHelper
  
  #Delete this example and add some real ones or delete this file
  it "should include the BlogEntriesHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(BlogEntriesHelper)
  end
  
end
