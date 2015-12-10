class Knowledge < ActiveRecord::Base

  validates_presence_of :description

  belongs_to :knowledge_level
  belongs_to :technology
  has_many :knowledge_requests

  # Colocar os métodos abaixo num helper

  # Método que retorna a descrição do conhecimento com seu nível
  def complete_knowledge
    "#{self.description} (#{self.knowledge_level.level})"
  end

end
