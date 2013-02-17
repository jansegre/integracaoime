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
    p = menu.delete(:page)
    m = Menu.create(menu)
    m.children += create_menu_tree(c) unless c.nil?
    unless p.nil?
      p.name = "#{m.title} 1"
      p.save
      m.page = p
    end
    m.save
    m
  end
end

def lorem_page
  Page.create content: <<-eos
    <h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h1>
    <h2>Donec porta eleifend metus vitae varius.</h2>
    <p class="lead">Vivamus faucibus, orci vitae lacinia pulvinar, diam lorem vehicula nibh, nec sollicitudin sem lacus eget mi.
    Praesent vitae lorem lectus.
    Maecenas arcu justo, consequat vitae volutpat eget, ultrices tincidunt justo.
    Mauris eget est vitae libero blandit malesuada a ac sem.</p>
    <p>Maecenas <b>quam lorem</b>, dapibus id euismod vitae, tempus vel metus.
    In sodales elementum tempor.
    Donec mollis nisl mollis augue cursus non sagittis libero congue.
    Suspendisse ligula nisl, tristique non tincidunt in, mattis in velit.</p>
    <p>In non ante at sem condimentum euismod luctus eu risus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
    Fusce ut pellentesque ipsum.
    In hac habitasse platea dictumst.</p>
    <p>Duis fermentum dolor vitae justo aliquet blandit. Sed ultrices molestie sapien a tincidunt.</p>
  eos
end

create_menu_tree(
  title: "__ROOT__",
  slug: "__root__",
  active: false,
  children: [
  { title: "Sabia Mais", slug: "more", children: [
    { title: "Missão", slug: "mission", page: lorem_page },
    { title: "Valores", slug: "values", page: lorem_page },
    { title: "Membros", slug: "members", page: lorem_page }] },
  { title: "O Evento", slug: "the-event", children: [
    { title: "O que é", slug: "what-is", page: lorem_page },
    { title: "Integração 2013", slug: "2013", children: [
      { title: "Programação", slug: "schedule", page: lorem_page },
      { title: "Empresas Participantes", slug: "companies", page: lorem_page },
      { title: "Palestrantes Magnos", slug: "special-guest", page: lorem_page }] },
    { title: "Eventos Anteriores", slug: "previous", page: lorem_page }] },
  { title: "Empresa", slug: "the-company", children: [
    { title: "Veja Quem Já Participou", slug: "all-participants", page: lorem_page },
    { title: "Porque Participar", slug: "why-participate", page: lorem_page },
    { title: "Participe", slug: "participate", page: lorem_page }] },
  { title: "Fotos e Vídeos", slug: "media", page: lorem_page },
  { title: "Contato", slug: "contact", page: lorem_page }
])
