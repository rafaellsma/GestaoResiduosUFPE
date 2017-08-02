class SedimentsCollectsController < ApplicationController
  def create
    sediments = Sediment.where(sediments_collect_id: nil)
    collect = SedimentsCollect.new(sediments: sediments)
    if collect.save
      redirect_to sediments_path, notice: 'Solicitação criada com sucesso'
    else
      redirect_to sediments_path, notice: 'Houve um erro na solicitação'
    end
  end
end
