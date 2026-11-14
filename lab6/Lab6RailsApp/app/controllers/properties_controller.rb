class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def buy
    @properties = Property.where(category: "Купівля")
  end

  def rent
    @properties = Property.where(category: "Оренда")
  end

  def daily
    @properties = Property.where(category: "Добово")
  end

  def about
  end

  def index
    @properties = Property.all

    if params[:min_price].present?
      @properties = @properties.where("price >= ?", params[:min_price])
    end

    if params[:max_price].present?
      @properties = @properties.where("price <= ?", params[:max_price])
    end
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: "Об'єкт нерухомості успішно створено."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Об'єкт нерухомості успішно оновлено."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "Об'єкт нерухомості видалено."
  end

  def destroy_all
    Property.destroy_all
    redirect_to properties_path, notice: "Усі об'єкти нерухомості видалено."
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :description, :price, :category)
  end
end