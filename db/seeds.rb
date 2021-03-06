# Para carregar esse arquivo, no terminal digite rake db:seed

# Create profiles
Profile.create(name: "Membro")
Profile.create(name: "Moderador")
Profile.create(name: "Administrador")

# Create sectors
Sector.create(short_name: "NUT", name: "Núcleo de Talentos", description: "Núcleo de Talentos")
Sector.create(short_name: "NDP", name: "Núcleo de Desenvolvimento e Pesquisa", description: "Núcleo de Desenvolvimento e Pesquisa")
Sector.create(short_name: "NAM", name: "Nucleo de Atendimento e Marketing", description: "Nucleo de Atendimento e Marketing")
Sector.create(short_name: "NOE", name: "Núcleo de Organização Empresarial", description: "Núcleo de Organização Empresarial")
Sector.create(short_name: "PRES", name: "Presidência", description: "Presidência")

# Create areas
Area.create(name: "Capacitação", sector_id: 1)
Area.create(name: "Acompanhamento", sector_id: 1)
Area.create(name: "Integração", sector_id: 1)
Area.create(name: "Seleção", sector_id: 1)

Area.create(name: "Inovação", sector_id: 2)
Area.create(name: "Suporte", sector_id: 2)
Area.create(name: "Tecnologia da Informação", sector_id: 2)
Area.create(name: "Projetos", sector_id: 2)

Area.create(name: "Negócios", sector_id: 3)
Area.create(name: "Marketing", sector_id: 3)

Area.create(name: "Financeiro", sector_id: 4)
Area.create(name: "Administrativo", sector_id: 4)
Area.create(name: "Gestão Organizacional", sector_id: 4)

Area.create(name: "Liderança NUT", sector_id: 1)
Area.create(name: "Liderança NDP", sector_id: 2)
Area.create(name: "Liderança NAM", sector_id: 3)
Area.create(name: "Liderança NOE", sector_id: 4)
Area.create(name: "Presidência", sector_id: 5)

# Create jobs
Job.create(name: "Presidente")
Job.create(name: "Líder")
Job.create(name: "Gerente")
Job.create(name: "Consultor")
Job.create(name: "Trainee")

# Create user status
UserStatus.create(status: "Ativo")
UserStatus.create(status: "Inativo")

# Create users
User.create(name: "Gabriel", last_name: "Almeida", email: "gabrielalmeida@cjr.org.br", password: "almeida123", user_status_id: 1, job_id: 5, sector_id: 1, area_id: 1, profile_id: 3)
User.create(name: "Bruno", last_name: "Oliveira", email: "brunooliveira@cjr.org.br", password: "oliveira123", user_status_id: 1, job_id: 5, sector_id: 2, area_id: 2, profile_id: 3)
User.create(name: "Rafael", last_name: "Fernandes", email: "rafaelalves@cjr.org.br", password: "fernandes123", user_status_id: 1, job_id: 5, sector_id: 3, area_id: 6, profile_id: 3)
User.create(name: "Anne", last_name: "Carolina", email: "annecarolina@cjr.org.br", password: "carolina123", user_status_id: 1, job_id: 5, sector_id: 4, area_id: 3, profile_id: 3)
User.create(name: "Gabriel", last_name: "Mesquita", email: "gabrielmesquita@cjr.org.br", password: "mesquita123", user_status_id: 1, job_id: 5, sector_id: 5, area_id: 5, profile_id: 3)
User.create(name: "Rafael", last_name: "Dias", email: "rafaeldias@cjr.org.br", password: "rafaeldias123", user_status_id: 1, job_id: 2, sector_id: 3, area_id: 16, profile_id: 2)
User.create(name: "Rodrigo", last_name: "Chaves", email: "rodrigochaves@cjr.org.br", password: "chaves123", user_status_id: 1, job_id: 1, sector_id: 2, area_id: 15, profile_id: 3)
User.create(name: "Vitor", last_name: "Pontes", email: "vitorpontes@cjr.org.br", password: "pontes123", user_status_id: 1, job_id: 1, sector_id: 4, area_id: 17, profile_id: 2)
User.create(name: "Renan", last_name: "Reboredo", email: "renanreboredo@cjr.org.br", password: "reboredo123", user_status_id: 1, job_id: 1, sector_id: 5, area_id: 18, profile_id: 2)

# Create knowledge levels
KnowledgeLevel.create(level: "Baixo", description: "Baixo")
KnowledgeLevel.create(level: "Médio", description: "Médio")
KnowledgeLevel.create(level: "Alto", description: "Alto")
KnowledgeLevel.create(level: "N/A", description: "Não se aplica")

# Create project status
ProjectStatus.create(status: "Não iniciado")
ProjectStatus.create(status: "Em desenvolvimento")
ProjectStatus.create(status: "Em atraso")
ProjectStatus.create(status: "Finalizado")

# Create technologies
Technology.create(name: "HTML", description: "Linguagem de Marcação de Hipertexto")
Technology.create(name: "CSS", description: "Linguagem de Estilo em Cascata")
Technology.create(name: "PHP", description: "Linguagem de Programação")
Technology.create(name: "CodeIgniter", description: "Framework WEB")
Technology.create(name: "Ruby", description: "Linguagem de Programação")
Technology.create(name: "Rails", description: "Framework WEB")
Technology.create(name: "Javascript", description: "Linguagem de Programação")
Technology.create(name: "JQuery", description: "Biblioteca Javascript")
Technology.create(name: "SASS", description: "Linguagem de Estilo em Cascata")
Technology.create(name: "AngularJS", description: "Framework WEB")
Technology.create(name: "Git", description: "Sistema de Gerenciamento de Código Fonte")

# Create knowledges
Knowledge.create(description: "Conhecimentos Básicos", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Conhecimentos Básicos", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Conhecimentos Básicos", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Metadata do Documento", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Metadata do Documento", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Metadata do Documento", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Seções de Conteúdo", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Seções de Conteúdo", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Seções de Conteúdo", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Conteúdo de Texto", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Conteúdo de Texto", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Conteúdo de Texto", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Semântica de Texto em Linha", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Semântica de Texto em Linha", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Semântica de Texto em Linha", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Imagem e Multimídia", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Imagem e Multimídia", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Imagem e Multimídia", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Conteúdo Incorporado", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Conteúdo Incorporado", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Conteúdo Incorporado", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Scripting", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Scripting", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Scripting", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Edição de Demarcação", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Edição de Demarcação", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Edição de Demarcação", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Conteúdo de Tabelas", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Conteúdo de Tabelas", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Conteúdo de Tabelas", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Formulários", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Formulários", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Formulários", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Elementos Interativos", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Elementos Interativos", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Elementos Interativos", knowledge_level_id: 3, technology_id: 1)
Knowledge.create(description: "Conteúdo WEB", knowledge_level_id: 1, technology_id: 1)
Knowledge.create(description: "Conteúdo WEB", knowledge_level_id: 2, technology_id: 1)
Knowledge.create(description: "Conteúdo WEB", knowledge_level_id: 3, technology_id: 1)

Knowledge.create(description: "Seletores, Propriedades e Valores", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Seletores, Propriedades e Valores", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Seletores, Propriedades e Valores", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Cores e Texto", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Cores e Texto", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Cores e Texto", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Margem e Preenchimento", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Margem e Preenchimento", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Margem e Preenchimento", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Bordas e Imagens", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Bordas e Imagens", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Bordas e Imagens", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Classes e Seletores de ID", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Classes e Seletores de ID", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Classes e Seletores de ID", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Agrupamento e Ninho", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Agrupamento e Ninho", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Agrupamento e Ninho", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Display e Pseudo-Elementos", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Display e Pseudo-Elementos", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Display e Pseudo-Elementos", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Layout de Página", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Layout de Página", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Layout de Página", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Bordas Arredondadas", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Bordas Arredondadas", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Bordas Arredondadas", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Sombras", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Sombras", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Sombras", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Seletores Inteligentes", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Seletores Inteligentes", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Seletores Inteligentes", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Transições", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Transições", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Transições", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Transformações", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Transformações", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Transformações", knowledge_level_id: 3, technology_id: 2)
Knowledge.create(description: "Consultas de Mídia", knowledge_level_id: 1, technology_id: 2)
Knowledge.create(description: "Consultas de Mídia", knowledge_level_id: 2, technology_id: 2)
Knowledge.create(description: "Consultas de Mídia", knowledge_level_id: 3, technology_id: 2)

# Create request statuses
RequestStatus.create(status: "Em análise")
RequestStatus.create(status: "Deferido")
RequestStatus.create(status: "Indeferido")

# Create activity type
ActivityType.create(description: "Matéria UnB")

# Create activity
Activity.create(description: "Cálculo 1", credit_numbers: 6, activity_type_id: 1)
Activity.create(description: "Cálculo 2", credit_numbers: 6, activity_type_id: 1)
Activity.create(description: "Cálculo Numérico", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Fundamentos Teóricos da Computação", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Introdução à Álgebra Linear", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Álgebra 1", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Probabilidade e Estatística", credit_numbers: 6, activity_type_id: 1)
Activity.create(description: "Algoritmos e Programação de Computadores", credit_numbers: 6, activity_type_id: 1)
Activity.create(description: "Estruturas de Dados", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Técnicas de Programação 1", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Técnicas de Programação 2", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Linguagens de Programação", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Banco de Dados", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Informática e Sociedade", credit_numbers: 2, activity_type_id: 1)
Activity.create(description: "Introdução aos Sistemas Computacionais", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Circuitos Digitais", credit_numbers: 6, activity_type_id: 1)
Activity.create(description: "Organização e Arquitetura de Computadores", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Lógica Computacional 1", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Organização de Arquivos", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Teoria e Aplicação de Grafos", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Redes de Computadores", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Programação Concorrente", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Engenharia de Software", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Introdução a Inteligência Artificial", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Sistemas Operacionais", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Autômatos e Computabilidade", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Sistemas de Informação", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Software Básico", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Computação Experimental", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Compiladores", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Segurança Computacional", credit_numbers: 4, activity_type_id: 1)
Activity.create(description: "Metodologia Científica", credit_numbers: 2, activity_type_id: 1)

# Create project roles
ProjectRole.create(role: "Gerente")
ProjectRole.create(role: "Função 2")
ProjectRole.create(role: "Função 3")
ProjectRole.create(role: "Função 4")