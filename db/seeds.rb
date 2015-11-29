# Para carregar esse arquivo, no terminal digite rake db:seed

# Create profiles
Profile.create(name: "Membro")
Profile.create(name: "Administrador")

# Create sectors
Sector.create(short_name: "NUT", name: "Núcleo de Talentos", description: "Núcleo de Talentos")
Sector.create(short_name: "NDP", name: "Núcleo de Desenvolvimento e Pesquisa", description: "Núcleo de Desenvolvimento e Pesquisa")
Sector.create(short_name: "NAM", name: "Nucleo de Atendimento e Marketing", description: "Nucleo de Atendimento e Marketing")
Sector.create(short_name: "NOE", name: "Núcleo de Organização Empresarial", description: "Núcleo de Organização Empresarial")
Sector.create(short_name: "PRES", name: "Presidência", description: "Presidência")

# Create areas
Area.create(name: "Integração")
Area.create(name: "Inovação")
Area.create(name: "Financeiro")
Area.create(name: "Projetos")
Area.create(name: "Suporte")
Area.create(name: "Negócios")
Area.create(name: "Marketing")

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
User.create(name: "Gabriel", last_name: "Almeida", email: "gabrielalmeida@cjr.org.br", password: "almeida123", user_status_id: 1, job_id: 5, sector_id: 1, area_id: 1, profile_id: 2)
User.create(name: "Bruno", last_name: "Oliveira", email: "brunooliveira@cjr.org.br", password: "oliveira123", user_status_id: 1, job_id: 5, sector_id: 2, area_id: 2, profile_id: 2)
User.create(name: "Rafael", last_name: "Fernandes", email: "rafaelalves@cjr.org.br", password: "fernandes123", user_status_id: 1, job_id: 5, sector_id: 3, area_id: 6, profile_id: 2)
User.create(name: "Anne", last_name: "Carolina", email: "annecarolina@cjr.org.br", password: "carolina123", user_status_id: 1, job_id: 5, sector_id: 4, area_id: 3, profile_id: 2)
User.create(name: "Gabriel", last_name: "Mesquita", email: "gabrielmesquita@cjr.org.br", password: "mesquita123", user_status_id: 1, job_id: 5, sector_id: 5, area_id: 5, profile_id: 2)

# Create knowledge levels
KnowledgeLevel.create(level: "Baixo", description: "Baixo")
KnowledgeLevel.create(level: "Médio", description: "Médio")
KnowledgeLevel.create(level: "Alto", description: "Alto")

# Create project status
ProjectStatus.create(status: "Não iniciado")
ProjectStatus.create(status: "Em desenvolvimento")
ProjectStatus.create(status: "Em atraso")
ProjectStatus.create(status: "Finalizado")

# Create technologies
Technology.create(name: "Ruby", description: "Linguagem de programação")
Technology.create(name: "C++", description: "Linguagem de programação")
Technology.create(name: "Python", description: "Linguagem de programação")
Technology.create(name: "AngularJS", description: "Framework web")
Technology.create(name: "Rails", description: "Framework web")
Technology.create(name: "Bootstrap", description: "Framework CSS")