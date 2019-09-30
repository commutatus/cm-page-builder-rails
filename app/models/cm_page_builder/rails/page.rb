module CmPageBuilder::Rails
  class Page < ApplicationRecord
    belongs_to :container, polymorphic: true
    has_many :page_components, dependent: :destroy

    accepts_nested_attributes_for :page_components, allow_destroy: true

    def get_components
      self.page_components.with_attached_component_attachment.select(:id, :uuid, :component_type, :position, :content).map do |component|
        json_component = component.as_json.transform_keys! {|key| key.camelize(:lower)}
        attachment = component.component_attachment.attachment
        json_component["id"] = component[:uuid]
        json_component["component_attachment"] = if attachment
          attachment_data = {
            filename: attachment.filename.to_s,
            url: attachment.service_url
          }
          dimensions = attachment.blob.metadata
          dimensions['orientation'] = if dimensions['width'] > dimensions['height']
            'landscape'
          else
            'portrait'
          end
          attachment_data["dimensions"] = dimensions
          attachment_data
        end
        json_component
      end
    end

    def duplicate
      dupl = self.dup
      dupl.page_components = self.page_components.map do |pc|
        pc.duplicate
      end
      dupl
    end

    def save_content(component_json)
      components = JSON.parse component_json
      deleted_components = self.page_components.where.not(
        uuid: components.map {|c| c["id"] } )
      deleted_components.delete_all
      components.each do |component|
        page_component = self.page_components.find_or_initialize_by(uuid: component["id"])
        signed_id = component.dig("component_attachment", "signed_id")
        component_data = {
          content: component["content"],
          position: component["position"],
          component_type: component["componentType"]
        }
        component_data[:component_attachment] = signed_id if signed_id
        page_component.update!(component_data)
      end

    end
  end
end