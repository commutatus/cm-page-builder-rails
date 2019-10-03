require 'rails_helper'

module CmPageBuilder::Rails

  COMPONENTS = <<~JSON

      [
        {
          "id": "abcdef",
          "uuid": "abcdef",
          "position": 2,
          "content": "here is some content",
          "componentType": "Text"
        }
      ]

  JSON

  RSpec.describe Page, type: :model do
    it 'can be initialized' do
      test_container = TestContainer.create(name: "Tester")
      page = Page.create!(container: test_container)
      page.save_content COMPONENTS

      expect(page.page_components.size).to eq(1)
    end

    it 'can be duplicated' do
      test_container = TestContainer.create(name: "Tester")
      page = Page.create!(container: test_container)
      page.save_content COMPONENTS

      dup_page = page.duplicate
      dup_page.save!
      expect(Page.all.size).to eq(2)
      expect(dup_page.page_components.size).to eq(1)
      expect(dup_page.page_components.first.content).to eq("here is some content")
    end

    it 'can handle images' do
      test_container = TestContainer.create(name: "Tester")
      page = Page.create!(container: test_container)
      page.save_content COMPONENTS

      # page.page_components.first.component_attachment.attach(io: file_fixture("commutatus_logo.png"), filename: "commutatus_logo.png")
      # pp page.page_components.first.component_attachment.metadata
    end
  end

end
