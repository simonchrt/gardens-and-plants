class PlantTagsController < ApplicationController
  def new

    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end

  def create

    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
    @plant_tag.plant = @plant

    Tag.where(id: params[:plant_tag][:tag]).each do |tag|
      PlantTag.create(plant: @plant, tag: tag)
    end

    redirect_to garden_path(@plant.garden)

  end

  private

  # def plant_tags_params
  #   params.require(:plant_tag).permit(:tag_id)
  # end
end
