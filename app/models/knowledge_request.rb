class KnowledgeRequest < ActiveRecord::Base

  include ActionView::Helpers::TagHelper
  include ActionView::Context

  validates_presence_of :knowledge, :user, :request_status

  belongs_to :knowledge
  belongs_to :user
  belongs_to :request_status
  
  has_many :request_histories

  # Passar os métodos abaixo para helpers e importar

  def em_analise?
    self.request_status.status == "Em análise"
  end

  def label_request_status
    if self.request_status.status == "Deferido"
      content_tag(:span, "Deferido", class:["label label-success label-center"])
    elsif self.request_status.status == "Indeferido"
      content_tag(:span, "Indeferido", class:["label label-danger label-center"])
    else
      content_tag(:span, "Em análise", class:["label label-info label-center"])
    end
  end

end