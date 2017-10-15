class SedimentsCollectsController < ApplicationController
  def create
  	@laboratory = Laboratory.find(params[:laboratory_id])
    sediments = Sediment.where(sediments_collect_id: nil, laboratory: @laboratory)
    sediments_collect = SedimentsCollect.new(sediments: sediments, laboratory: @laboratory)
    if sediments_collect.save
    	create_doc(sediments_collect)
      redirect_to laboratory_sediments_path(@laboratory), notice: 'Solicitação criada com sucesso'
    else
      redirect_to laboratory_sediments_path(@laboratory), notice: 'Não existe residuo para ser coletado nesse laboratório'
    end
  end
  private
  	def create_doc(sediments_collect)
  		sediments = sediments_collect.sediments
  		docx = Caracal::Document.new('manifesto.docx')
			table = [sediments.first.attributes.map {|k,v|  t("content.sediments.index.#{k}")}]
			s.each do |a|
				table << a.attributes.map do |k,v|
					if(k == 'user_id')
						a.user.name
					elsif k=='laboratory_id'
						a.laboratory.name
					elsif k=='sediments_collect_id'
						v.blank? ? 'Não coletado' : 'Coletado'
					else
						v.to_s
					end
				end
			end
			docx.table table do
			  border_color   '666666'   # sets the border color. defaults to 'auto'.
			  border_line    :single    # sets the border style. defaults to :single. see OOXML docs for details.
			  border_size    4          # sets the border width. defaults to 0. units in twips.
			  border_spacing 4          # sets the spacing around the border. defaults to 0. units in twips.
			end
			send_data docx.render.string, filename: 'manifesto.docx'
  	end
end
