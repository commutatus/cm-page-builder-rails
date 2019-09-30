module CmPageBuilder::Rails
  class PageComponent < ApplicationRecord
    belongs_to :page

    has_one_attached :component_attachment

    default_scope { order(position: :asc) }

    def duplicate
      dupl = self.dup
      dupl.component_attachment.attach(self.component_attachment.blob) if self.component_attachment.attachment
      dupl
    end

  end
end
