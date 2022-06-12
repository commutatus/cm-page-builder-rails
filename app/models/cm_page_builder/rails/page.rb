module CmPageBuilder::Rails
  class Page < ApplicationRecord
    belongs_to :container, polymorphic: true
    has_many :page_components, dependent: :destroy

    accepts_nested_attributes_for :page_components, allow_destroy: true

    def components(**args)
      page_components.with_attached_component_attachment.select(:id, :uuid, :component_type, :position, :content).map do |component|
        json_component = component.as_json.transform_keys! { |key| key.camelize(:lower) }
        json_component["id"] = component[:uuid]
        json_component["component_attachment"] = _get_attachment(component, args[:max_width])
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
      deleted_components = page_components.where.not(
        uuid: components.map { |component| component["id"] }
      )
      deleted_components.delete_all
      components.each do |component|
        _save_component(component)
      end
    end

    private

      def _get_attachment(component, max_width=nil)
        attachment = component.component_attachment.attachment
        return unless attachment

        blob = attachment.blob
        attachment_data = {
          filename: attachment.filename.to_s,
          filesize: blob.byte_size,
          url: attachment.service_url
        }
        if blob.variable?
          dimensions = blob.metadata
          dimensions['orientation'] =
            if dimensions['width'].nil? || dimensions['height'].nil?
              'portrait'
            elsif dimensions['width'] > dimensions['height']
              'landscape'
            else
              'portrait'
            end
          attachment_data[:dimensions] = dimensions
          attachment_data[:url] = attachment.variant(resize_to_limit: [max_width, nil]).processed.service_url if max_width
        end
        attachment_data
      end

      def _save_component(component)
        page_component = page_components.find_or_initialize_by(uuid: component["id"])
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
