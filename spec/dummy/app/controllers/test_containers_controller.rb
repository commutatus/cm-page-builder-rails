class TestContainersController < ApplicationController
  before_action :set_test_container, only: [:show, :edit, :update, :destroy]
  def index
    @test_containers = TestContainer.all
  end

  def show
  end

  def new
    @test_container = TestContainer.new
  end

  def edit
  end

  def create
    @test_container = test_container.new(test_container_params)
    if @test_container.save
      @test_container.save_content(components)
      redirect_to @test_container, notice: 'test_container was successfully created.'
    else
      render :new
    end
  end

  def update
    if @test_container.save_content(components)
      redirect_to @test_container, notice: 'test_container was successfully updated.'
    else
      render :edit
    end
  end

  def set_test_container
    @test_container = TestContainer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def test_container_params
    params.require(:test_container).permit
  end
end
