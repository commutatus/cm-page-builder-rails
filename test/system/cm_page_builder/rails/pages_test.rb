require "application_system_test_case"

module CmPageBuilder::Rails
  class PagesTest < ApplicationSystemTestCase
    setup do
      @page = cm_page_builder_rails_pages(:one)
    end

    test "visiting the index" do
      visit pages_url
      assert_selector "h1", text: "Pages"
    end

    test "creating a Page" do
      visit pages_url
      click_on "New Page"

      fill_in "Container", with: @page.container_id
      fill_in "Container type", with: @page.container_type
      click_on "Create Page"

      assert_text "Page was successfully created"
      click_on "Back"
    end

    test "updating a Page" do
      visit pages_url
      click_on "Edit", match: :first

      fill_in "Container", with: @page.container_id
      fill_in "Container type", with: @page.container_type
      click_on "Update Page"

      assert_text "Page was successfully updated"
      click_on "Back"
    end

    test "destroying a Page" do
      visit pages_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Page was successfully destroyed"
    end
  end
end
