class DatasetsController < ApplicationController
  def import
    ImportCsv.call(params[:file])
    redirect_to congressmen_path, notice: "Upload concluído com sucesso!"
  end
end