# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_menu_tree menu
  case menu
  when Array
    menu.map{ |m| create_menu_tree(m) }
  when Hash
    c = menu.delete(:children)
    m = Menu.create(menu)
    m.children += create_menu_tree(c) unless c.nil?
    m.save
    m
  end
end

create_menu_tree(
  title: "ROOT",
  slug: "root",
  active: false,
  children: [
  { title: "Sabia Mais", slug: "more", children: [
    { title: "Missão", slug: "mission" },
    { title: "Valores", slug: "values" },
    { title: "Membros", slug: "members" }] },
  { title: "O Evento", slug: "the-event", children: [
    { title: "O que é", slug: "what-is" },
    { title: "Integração 2013", slug: "2013", children: [
      { title: "Programação", slug: "schedule" },
      { title: "Empresas Participantes", slug: "companies" },
      { title: "Palestrantes Magnos", slug: "special-guest" }] },
    { title: "Eventos Anteriores", slug: "previous" }] },
  { title: "Empresa", slug: "the-company", children: [
    { title: "Veja Quem Já Participou", slug: "all-participants" },
    { title: "Porque Participar", slug: "why-participate" },
    { title: "Participe", slug: "participate" }] },
  { title: "Fotos e Vídeos", slug: "media" },
  { title: "Contato", slug: "contact" }
])
