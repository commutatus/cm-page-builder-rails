require_dependency "cm_page_builder/rails/application_controller"

module CmPageBuilder::Rails
  class PageComponentsController < ApplicationController
    before_action :set_page_component, only: [:show, :edit, :update, :destroy]

    # GET /page_components
    def index
      @page_components = PageComponent.all
    end

    # GET /page_components/1
    def show
    end

    # GET /page_components/new
    def new
      @page_component = PageComponent.new
    end

    # GET /page_components/1/edit
    def edit
    end

    # POST /page_components
    def create
      @page_component = PageComponent.new(page_component_params)

      if @page_component.save
        redirect_to @page_component, notice: 'Page component was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /page_components/1
    def update
      if @page_component.update(page_component_params)
        redirect_to @page_component, notice: 'Page component was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /page_components/1
    def destroy
      @page_component.destroy
      redirect_to page_components_url, notice: 'Page component was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page_component
        @page_component = PageComponent.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_component_params
        params.require(:page_component).permit(:page_id, :content, :position, :component_type, :id)
      end
  end
end
