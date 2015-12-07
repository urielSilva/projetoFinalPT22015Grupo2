class KnowledgeRequestMailer < ApplicationMailer
  
  default from: 'no.reply.cjr@gmail.com'

  layout 'request_email'

  def request_email(requerente, requisicao)
    @admin = User.find(3)
    @requerente = requerente
    @requisicao = requisicao
    mail(to: @admin.email, subject:'[SAP] Requisição de Conhecimento')
  end

end