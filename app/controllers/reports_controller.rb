require "prawn"

class ReportsController < ApplicationController
	def initialize
		@sediments = []
	end

	def generate
		
	end

	def create
		conv_date = "15/12/2016".to_date
		@sediments = Sediment.where("data_created >= ? AND data_created <= ?", params[:initial_date], params[:final_date])
		send_data generate_pdf(@sediments),
              filename: "sediments.pdf",
              type: "application/pdf"
	end

	def generate_pdf(sediments)
		Prawn::Document.new do
			text "MTR – MANIFESTO PARA TRANSPORTE DE RESÍDUO PERIGOSO			N."
			bounding_box([0, cursor], :width => 540) do
				 move_down 3
				 text "1.   GERADOR", :indent_paragraphs => 3
				 text "Razão Social: Universidade Federal de Pernambuco", :indent_paragraphs => 3
				 text "Endereço: Avenida Professor Moraes Rego, nº 1235 - Cidade Universitária - Recife - PE", :indent_paragraphs => 3
				 text "Tel.: (81) 2126-8076", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([0, cursor], :width => 540) do
				 move_down 3
				 text "2. DESCRIÇÃO DOS RESÍDUOS", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			savedCursor = cursor
			bounding_box([0, cursor], :width => 180) do
				 move_down 3
				 text "Fonte / Origem", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([180, savedCursor], :width => 180) do
				 move_down 3
				 text "Composição", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([360, savedCursor], :width => 180) do
				 move_down 3
				 text "Peso", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			sediments.each do |sed|
				if (cursor < 85)
					start_new_page
				end
				savedCursor = cursor
				bounding_box([0, cursor], :width => 180, :height => 45) do
					 move_down 3
					 text sed.local, :indent_paragraphs => 3
					 transparent(0.5) { stroke_bounds }
				end
				bounding_box([180, savedCursor], :width => 180, :height => 45) do
					 move_down 3
					 text sed.composition, :indent_paragraphs => 3
					 transparent(0.5) { stroke_bounds }
				end
				bounding_box([360, savedCursor], :width => 180, :height => 45) do
					 move_down 3
					 text sed.weight.to_s, :indent_paragraphs => 3
					 transparent(0.5) { stroke_bounds }
				end
			end
			bounding_box([0, cursor], :width => 540) do
				 move_down 3
				 text "3. TRANSPORTADOR", :indent_paragraphs => 3
				 text "Razão Social: Transportadora Rocha Ltda.", :indent_paragraphs => 3
				 text "Endereço: Rua Gurupí, 204 - Torrões", :indent_paragraphs => 3
				 text "Município: Recife, PE", :indent_paragraphs => 3
				 text "Tel.: (81) 3228-4420", :indent_paragraphs => 3
				 text "Tel.: Tipo de equipamento de transporte: caminhão", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			bounding_box([0, cursor], :width => 540) do
				 move_down 3
				 text "4. STTADE DESTINATÁRIO (STTADE = Sistema que trata, transfere, armazena ou dispõe os resíduos)", :indent_paragraphs => 3
				 text "Razão Social: Saniplan Engenharia e Serviços Ambientais Ltda.", :indent_paragraphs => 3
				 text "Número da Licença: 045/2014 SMMAAA", :indent_paragraphs => 3
				 text "Endereço: Av. Mascarenhas de Morais, 2409", :indent_paragraphs => 3
				 text "Município: Duque de Caxias, RJ", :indent_paragraphs => 3
				 text "OBS" + "."*153, :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			bounding_box([0, cursor], :width => 540, :height => 45) do
				 move_down 3
				 text "5. Descrições adicionais dos resíduos listados acima:", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			bounding_box([0, cursor], :width => 540, :height => 60) do
				 move_down 3
				 text "6. Instruções especiais de manuseio e informações adicionais (em caso de não entrega do resíduo especificar o no do MTR anterior)", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			bounding_box([0, cursor], :width => 540) do
				 move_down 3
				 text "7. Certificação do gerador: Eu, por meio deste manifesto, declaro que os resíduos acima estão integralmente descritos pelo nome, classificados, embalados e rotulados seguindo as normas vigentes e estão sob os aspectos em condições adequadas para transporte de acordo com os regulamentos nacionais e internacionais vigentes.", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			savedCursor = cursor
			bounding_box([0, cursor], :width => 180, :height => 45) do
				 move_down 3
				 text "8.  a) Gerador", :indent_paragraphs => 3
				 text "NOME", :indent_paragraphs => 3
				 text "UFPE", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([180, savedCursor], :width => 180, :height => 45) do
				 move_down 3
				 text "ASSINATURA", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([360, savedCursor], :width => 180, :height => 45) do
				 move_down 3
				 text "DATA", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			savedCursor = cursor
			bounding_box([0, cursor], :width => 180, :height => 45) do
				 move_down 3
				 text "    b) Transportador", :indent_paragraphs => 3
				 text "NOME", :indent_paragraphs => 3
				 text "Transportadora Rocha", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([180, savedCursor], :width => 180, :height => 45) do
				 move_down 3
				 text "ASSINATURA", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([360, savedCursor], :width => 180, :height => 45) do
				 move_down 3
				 text "DATA", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			savedCursor = cursor
			bounding_box([0, cursor], :width => 180, :height => 45) do
				 move_down 3
				 text "    c) Instalação Receptora", :indent_paragraphs => 3
				 text "NOME", :indent_paragraphs => 3
				 text "SANIPLAN", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([180, savedCursor], :width => 180, :height => 45) do
				 move_down 3
				 text "ASSINATURA", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			bounding_box([360, savedCursor], :width => 180, :height => 45) do
				 move_down 3
				 text "DATA", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			bounding_box([0, cursor], :width => 540, :height => 45) do
				 move_down 3
				 text "9. Instruções em caso de discrepância das indicações descritas deste manifesto:", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
			if (cursor < 85)
				start_new_page
			end
			bounding_box([0, cursor], :width => 540) do
				 move_down 3
				 text "10. Instalação receptora: Certificação de recebimento do material perigoso descrito neste manifesto, exceto quando ocorre o especificado no item 9.", :indent_paragraphs => 3
				 text " "
				 text " "
				 text "_"*80, :indent_paragraphs => 3
				 text " "*15 + "NOME" + " "*40 + "ASSINATURA" + " "*40 + "DATA", :indent_paragraphs => 3
				 text "OBS.: Preencher em 5 vias – 1a STTADE – 2a TRANSPORTADOR – 3a GERADOR – 4a ÓRGÃO CONTROLE AMBIENTAL – 5a CONTROLE GERADOR", :indent_paragraphs => 3
				 transparent(0.5) { stroke_bounds }
			end
		end.render
	end
end
