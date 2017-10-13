require "prawn"

class ReportsController < ApplicationController

	def create_doc

		@sediments_doc = Sediment.where("data_registered >= ? AND data_registered <= ?", params[:initial_date], params[:final_date])
		Caracal::Document.save '/public/manifesto.docx' do |docx|
			docx.style do
				id 'Body'
				name 'body'
				font 'Times New Roman'
				size 20
			end

      docx.h2 'MTR – MANIFESTO PARA TRANSPORTE DE RESÍDUO PERIGOSO N.'
			docx.h1 ' '
      docx.h3 'Descrição de Resíduos por Laboratório:'
			docx.h1 ' '

			centers = Center.all

			centers.each do |center|
				center.get_departments.each do |department|
					department.get_laboratories.each do |laboratory|
						Sediment::SEDIMENT_TYPES.each do |res_type|
							amount = center.amount_sediments(params[:initial_date], params[:final_date], res_type)
							if amount != 0
								array = [center.name, laboratory.name, res_type.to_s, amount.to_s]
								docx.table [['Centro', 'Laboratório' ,'Tipo', 'Peso (kg)'],
														array] do
									border_color   '666666'   # sets the border color. defaults to 'auto'.
									border_line    :single    # sets the border style. defaults to :single. see OOXML docs for details.
									border_size    4          # sets the border width. defaults to 0. units in twips.
									border_spacing 4          # sets the spacing around the border. defaults to 0. units in twips.
									cell_style cols[3], width: 1000
									cell_style cols[2], width: 2400
								end
							end
						end
					end
				end
			end




		end

		path = File.join(Rails.root, "public")
		send_file(File.join(path, "manifesto.docx"))
	end

	def create
		@sediments = Sediment.where("data_registered >= ? AND data_registered <= ?", params[:initial_date], params[:final_date])
		send_data generate_pdf(@sediments, params[:initial_date], params[:final_date]),
          filename: "sediments.pdf",
          type: "application/pdf"
	end

	def generate_pdf(sediments, initial_date, final_date)
		pdf = Prawn::Document.new
		generateFirstPartPdf(pdf)
		generateSecondPartPdf(pdf, sediments, initial_date, final_date)
		generateThirdPartPdf(pdf)
		generateFourthPartPdf(pdf)
		generateFifthPartPdf(pdf)
		generateSixthPartPdf(pdf)
		generateSeventhPartPdf(pdf)
		generateOctavePartPdf(pdf)
		generateNinthPartPdf(pdf)
		generateTenthPartPdf(pdf)
		pdf.render
	end

	# There's a method for each pdf's part, in case something change on a single part
	def generateFirstPartPdf(pdf)
		pdf.text "MTR – MANIFESTO PARA TRANSPORTE DE RESÍDUO PERIGOSO			N."
		pdf.bounding_box([0, pdf.cursor], :width => 540) do
			 pdf.move_down 3
			 pdf.text "1.   GERADOR", :indent_paragraphs => 3
			 pdf.text "Razão Social: Universidade Federal de Pernambuco", :indent_paragraphs => 3
			 pdf.text "Endereço: Avenida Professor Moraes Rego, nº 1235 - Cidade Universitária - Recife - PE", :indent_paragraphs => 3
			 pdf.text "Tel.: (81) 2126-8076", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateSecondPartPdf(pdf, sediments, initial_date, final_date)
		pdf.bounding_box([0, pdf.cursor], :width => 540) do
			 pdf.move_down 3
			 pdf.text "2. DESCRIÇÃO DOS RESÍDUOS", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end

		savedCursor = pdf.cursor
		pdf.bounding_box([0, pdf.cursor], :width => 180) do
			 pdf.move_down 3
			 pdf.text "Centro", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([180, savedCursor], :width => 180) do
			 pdf.move_down 3
			 pdf.text "Tipo dos resíduos", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([360, savedCursor], :width => 180) do
			 pdf.move_down 3
			 pdf.text "Quantidade total (Kg)", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end

		centers = Center.all

		centers.each do |center|
			Sediment::SEDIMENT_TYPES.each do |res_type|
				amount = center.amount_sediments(initial_date, final_date, res_type)
				if amount != 0
					checkingForNewPage(pdf)
					savedCursor = pdf.cursor
					pdf.bounding_box([0, pdf.cursor], :width => 180, :height => 50) do
						 pdf.move_down 3
						 pdf.text center.name, :indent_paragraphs => 3
						 pdf.transparent(0.5) { pdf.stroke_bounds }
					end
					pdf.bounding_box([180, savedCursor], :width => 180, :height => 50) do
						 pdf.move_down 3
						 pdf.text res_type, :indent_paragraphs => 3
						 pdf.transparent(0.5) { pdf.stroke_bounds }
					end
					pdf.bounding_box([360, savedCursor], :width => 180, :height => 50) do
						 pdf.move_down 3
						 pdf.text amount.to_s, :indent_paragraphs => 3
						 pdf.transparent(0.5) { pdf.stroke_bounds }
				end
			end
		end
	end
	end

	def generateThirdPartPdf(pdf)
		checkingForNewPage(pdf)
		pdf.bounding_box([0, pdf.cursor], :width => 540) do
			 pdf.move_down 3
			 pdf.text "3. TRANSPORTADOR", :indent_paragraphs => 3
			 pdf.text "Razão Social: Transportadora Rocha Ltda.", :indent_paragraphs => 3
			 pdf.text "Endereço: Rua Gurupí, 204 - Torrões", :indent_paragraphs => 3
			 pdf.text "Município: Recife, PE", :indent_paragraphs => 3
			 pdf.text "Tel.: (81) 3228-4420", :indent_paragraphs => 3
			 pdf.text "Tel.: Tipo de equipamento de transporte: caminhão", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateFourthPartPdf(pdf)
		checkingForNewPage(pdf)
		pdf.bounding_box([0, pdf.cursor], :width => 540) do
			 pdf.move_down 3
			 pdf.text "4. STTADE DESTINATÁRIO (STTADE = Sistema que trata, transfere, armazena ou dispõe os resíduos)", :indent_paragraphs => 3
			 pdf.text "Razão Social: Saniplan Engenharia e Serviços Ambientais Ltda.", :indent_paragraphs => 3
			 pdf.text "Número da Licença: 050/2014 SMMAAA", :indent_paragraphs => 3
			 pdf.text "Endereço: Av. Mascarenhas de Morais, 2409", :indent_paragraphs => 3
			 pdf.text "Município: Duque de Caxias, RJ", :indent_paragraphs => 3
			 pdf.text "OBS" + "."*153, :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateFifthPartPdf(pdf)
		checkingForNewPage(pdf)
		pdf.bounding_box([0, pdf.cursor], :width => 540, :height => 50) do
			 pdf.move_down 3
			 pdf.text "5. Descrições adicionais dos resíduos listados acima:", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateSixthPartPdf(pdf)
		checkingForNewPage(pdf)
		pdf.bounding_box([0, pdf.cursor], :width => 540, :height => 60) do
			 pdf.move_down 3
			 pdf.text "6. Instruções especiais de manuseio e informações adicionais (em caso de não entrega do resíduo especificar o no do MTR anterior)", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateSeventhPartPdf(pdf)
		checkingForNewPage(pdf)
		pdf.bounding_box([0, pdf.cursor], :width => 540) do
			 pdf.move_down 3
			 pdf.text "7. Certificação do gerador: Eu, por meio deste manifesto, declaro que os resíduos acima estão integralmente descritos pelo nome, classificados, embalados e rotulados seguindo as normas vigentes e estão sob os aspectos em condições adequadas para transporte de acordo com os regulamentos nacionais e internacionais vigentes.", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateOctavePartPdf(pdf)
		checkingForNewPage(pdf)
		savedCursor = pdf.cursor
		pdf.bounding_box([0, pdf.cursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "8.  a) Gerador", :indent_paragraphs => 3
			 pdf.text "NOME", :indent_paragraphs => 3
			 pdf.text "UFPE", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([180, savedCursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "ASSINATURA", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([360, savedCursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "DATA", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		checkingForNewPage(pdf)
		savedCursor = pdf.cursor
		pdf.bounding_box([0, pdf.cursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "    b) Transportador", :indent_paragraphs => 3
			 pdf.text "NOME", :indent_paragraphs => 3
			 pdf.text "Transportadora Rocha", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([180, savedCursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "ASSINATURA", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([360, savedCursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "DATA", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		checkingForNewPage(pdf)
		savedCursor = pdf.cursor
		pdf.bounding_box([0, pdf.cursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "    c) Instalação Receptora", :indent_paragraphs => 3
			 pdf.text "NOME", :indent_paragraphs => 3
			 pdf.text "SANIPLAN", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([180, savedCursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "ASSINATURA", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
		pdf.bounding_box([360, savedCursor], :width => 180, :height => 50) do
			 pdf.move_down 3
			 pdf.text "DATA", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateNinthPartPdf(pdf)
		checkingForNewPage(pdf)
		pdf.bounding_box([0, pdf.cursor], :width => 540, :height => 50) do
			 pdf.move_down 3
			 pdf.text "9. Instruções em caso de discrepância das indicações descritas deste manifesto:", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	def generateTenthPartPdf(pdf)
		checkingForNewPage(pdf)
		pdf.bounding_box([0, pdf.cursor], :width => 540) do
			 pdf.move_down 3
			 pdf.text "10. Instalação receptora: Certificação de recebimento do material perigoso descrito neste manifesto, exceto quando ocorre o especificado no item 9.", :indent_paragraphs => 3
			 pdf.text " "
			 pdf.text " "
			 pdf.text "_"*80, :indent_paragraphs => 3
			 pdf.text " "*15 + "NOME" + " "*53 + "ASSINATURA" + " "*53 + "DATA", :indent_paragraphs => 3
			 pdf.text "OBS.: Preencher em 5 vias – 1a STTADE – 2a TRANSPORTADOR – 3a GERADOR – 4a ÓRGÃO CONTROLE AMBIENTAL – 5a CONTROLE GERADOR", :indent_paragraphs => 3
			 pdf.transparent(0.5) { pdf.stroke_bounds }
		end
	end

	# In case of the pdf's cursor is near the bottom of the page, we create another page
	def checkingForNewPage(pdf)
		if (pdf.cursor < 85)
			pdf.start_new_page
		end
	end
end
