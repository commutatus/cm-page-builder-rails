module CmPageBuilder::Rails
  class Page < ApplicationRecord
    belongs_to :container, polymorphic: true
    has_many :page_components, dependent: :destroy

    accepts_nested_attributes_for :page_components, allow_destroy: true

    def get_components
      self.page_components.select(:id, :component_type, :position, :content).map do |component|
        json_component = component.as_json.transform_keys! {|key| key.camelize(:lower)}
        attachment = component.component_attachment.attachment
        pp attachment
        json_component["component_attachment"] = if attachment
           {
            filename: attachment.filename.to_s,
            url: attachment.service_url
          }
        end
        json_component
      end
    end

    def save_content(component_json)
      components = JSON.parse component_json
      deleted_components = self.page_components.where.not(
        id: components.map {|c| c["id"] } )
      deleted_components.delete_all
      components.each do |component|
        page_component = self.page_components.find_or_initialize_by(id: component["id"])
        page_component.update!(
            content: component["content"],
            position: component["position"],
            component_type: component["componentType"]
          )
        signed_id = component.dig("component_attachment", "signed_id")
        page_component.component_attachment = signed_id if signed_id
        page_component.save!
      end

    end
  end
end
