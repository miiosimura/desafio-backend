class CongressmenController < ApplicationController
  def index
    @congressmen = Congressman.all.includes(:yearly_spends)
  end

  def show
    @congressman = Congressman.find(params[:id])
    @spends = @congressman.spends
      .where("strftime('%Y', document_emission_date) = ?", params[:year])

    @max_value = @spends.maximum(:liquid_value)
  end
end