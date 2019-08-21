require 'test_helper'

module CmPageBuilder::Rails
  class PageComponentsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @page_component = cm_page_builder_rails_page_components(:one)
    end

    test "should get index" do
      get page_components_url
      assert_response :success
    end

    test "should get new" do
      get new_page_component_url
      assert_response :success
    end

    test "should create page_component" do
      assert_difference('PageComponent.count') do
        post page_components_url, params: { page_component: { component_type: @page_component.component_type, content: @page_component.content, id: @page_component.id, page_id: @page_component.page_id, position: @page_component.position } }
      end

      assert_redirected_to page_component_url(PageComponent.last)
    end

    test "should show page_component" do
      get page_component_url(@page_component)
      assert_response :success
    end

    test "should get edit" do
      get edit_page_component_url(@page_component)
      assert_response :success
    end

    test "should update page_component" do
      patch page_component_url(@page_component), params: { page_component: { component_type: @page_component.component_type, content: @page_component.content, id: @page_component.id, page_id: @page_component.page_id, position: @page_component.position } }
      assert_redirected_to page_component_url(@page_component)
    end

    test "should destroy page_component" do
      assert_difference('PageComponent.count', -1) do
        delete page_component_url(@page_component)
      end

      assert_redirected_to page_components_url
    end
  end
end
