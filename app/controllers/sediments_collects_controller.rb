class SedimentsCollectsController < ApplicationController
  def create
  	@department = Department.find(params[:department_id])
    sediments = @department.sediments_without_collect
    sediments_collect = SedimentsCollect.new(sediments: sediments, department: @department)

    if sediments_collect.save
    	create_doc(sediments_collect)
    else
      redirect_to laboratory_sediments_path(@laboratory), notice: 'Não existe residuo para ser coletado nesse laboratório'
    end
  end
  private
  	def create_doc(sediments_collect)
  		sediments = sediments_collect.sediments
  		docx = Caracal::Document.new('manifesto.docx')
			table = [['Departamento', 'Tipo do residuo', 'Peso total por tipo de residuo']]

			Sediment::SEDIMENT_TYPES.each do |type|
        table <<[
          sediments_collect.department.name,
          type,
          sediments.select {|x| x.res_type == type}.map{|x| x.weight}.reduce(0, :+).to_s
        ]
      end

			docx.table table.map { |row| row.reject { |cell| cell.blank? }} do
			  border_color   '666666'   # sets the border color. defaults to 'auto'.
			  border_line    :single    # sets the border style. defaults to :single. see OOXML docs for details.
			  border_size    4          # sets the border width. defaults to 0. units in twips.
			  border_spacing 4          # sets the spacing around the border. defaults to 0. units in twips.
			end
			send_data docx.render.string, filename: 'manifesto.docx', disposition: 'attachment'
  	end
end
