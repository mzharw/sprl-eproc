class RegionsController < ApplicationController
  include Filterable

  def country
    regions = selectable(Region.where(region_type: 'COUNTRY'), :code, :name)
    json = paginate_json(regions)
    respond_to do |format|
      format.json { render json: }
    end
  end

  def province
    regions = selectable(Region.where(region_type: 'PROVINCE'), :code, :name)
    json = paginate_json(regions)
    respond_to do |format|
      format.json { render json: }
    end
  end

  def city
    parent_id = params[:province_id]
    region = Region.where(region_type: 'DISTRICT')
    region = region.where(parent_id:) if parent_id

    regions = selectable(region, :code, :name)
    json = paginate_json(regions)
    respond_to do |format|
      format.json { render json: }
    end
  end

  def subdistrict
    parent_id = params[:city_id]
    region = Region.where(region_type: 'SUB_DISTRICT')
    region = region.where(parent_id:) if parent_id

    regions = selectable(region, :code, :name)
    json = paginate_json(regions)
    respond_to do |format|
      format.json { render json: }
    end
  end

  def postalcode
    regions = selectable(Region.where(region_type: 'POSTAL_CODE'), :code, :name)
    json = paginate_json(regions)
    respond_to do |format|
      format.json { render json: }
    end
  end
end
