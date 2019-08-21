module CmPageBuilder::Rails
  class PageComponent < ApplicationRecord
    belongs_to :page
  end
end
