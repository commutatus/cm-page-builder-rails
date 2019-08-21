require "application_system_test_case"

module CmPageBuilder::Rails
  class PageComponentsTest < ApplicationSystemTestCase
    setup do
      @page_component = cm_page_builder_rails_page_components(:one)
    end

    test "visiting the index" do
      visit page_components_url
      assert_selector "h1", text: "Page Components"
    end

    test "creating a Page component" do
      visit page_components_url
      click_on "New Page Component"

      fill_in "Component type", with: @page_component.component_type
      fill_in "Content", with: @page_component.content
      fill_in "Id", with: @page_component.id
      fill_in "Page", with: @page_component.page_id
      fill_in "Position", with: @page_component.position
      click_on "Create Page component"

      assert_text "Page component was successfully created"
      click_on "Back"
    end

    test "updating a Page component" do
      visit page_components_url
      click_on "Edit", match: :first

      fill_in "Component type", with: @page_component.component_type
      fill_in "Content", with: @page_component.content
      fill_in "Id", with: @page_component.id
      fill_in "Page", with: @page_component.page_id
      fill_in "Position", with: @page_component.position
      click_on "Update Page component"

      assert_text "Page component was successfully updated"
      click_on "Back"
    end

    test "destroying a Page component" do
      visit page_components_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Page component was successfully destroyed"
    end
  end
end
