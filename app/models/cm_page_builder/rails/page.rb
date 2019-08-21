module CmPageBuilder::Rails
  class Page < ApplicationRecord
    belongs_to :container, polymorphic: true
    has_many :page_components, dependent: :destroy

    accepts_nested_attributes_for :page_components, allow_destroy: true

    def save_content(component_json)
      components = JSON.parse component_json
      deleted_components = self.page_components.where.not(
        id: components.map {|c| c["id"] } )
      deleted_components.delete_all
      components.each do |component|
        self.page_components
          .find_or_initialize_by(id: component["id"])
          .update!(
            content: component["content"],
            position: component["position"],
            component_type: component["componentType"]
          )
      end

    end
  end
end
