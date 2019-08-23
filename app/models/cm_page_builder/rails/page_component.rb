module CmPageBuilder::Rails
  class PageComponent < ApplicationRecord
    belongs_to :page    

    has_one_attached :component_attachment
  end
end
