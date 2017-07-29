class Sediment < ApplicationRecord
  belongs_to :user
  belongs_to :laboratory

  validates :weight, presence: true
  validates :composition, presence: true
  validates :res_type, presence: true
  validates :recipient_type, presence:true
  validates :stock_location, presence: true

  SEDIMENT_TYPES = ["Sólido Orgânico", "Sólido Inorgânico", "Líquido Inorgânico",
  "Líquido Inflamável", "Líquido Orgânico", "Outros (Risco ao Meio Ambiente)",
  "Não Identificado"]

  RECIPIENT_TYPES = ["Plástico", "Vidro", "Caixa de Papelão"]
end
