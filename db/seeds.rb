# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.delete_all

m_id = Milestone.first.id

p1 = Project.new(
  milestone_id: m_id,
  title: "TotoWiz API",
  description: "An external Todo API with authentication.",
  role: "I was responsible for: - one - two - three",
  client: "Bootcamp project - Bloc, Inc.",
  published_on: 30.days.ago,
  link_live: "",
  link_source: "https://github.com/karimmtarek/todo-wiz"
  )

p2 = Project.new(
  milestone_id: m_id,
  title: "Blocmetrics",
  description: "Basic API Tracking Service and Reporting Tool.",
  role: "I did, this and that.",
  client: "Bootcamp project - Bloc, Inc.",
  published_on: 60.days.ago,
  link_live: "https://blocmetricz.herokuapp.com/",
  link_source: "https://github.com/karimmtarek/blocmetrics"
  )

p3 = Project.new(
  milestone_id: m_id,
  title: "Todermonator",
  description:
   "Todermonator does one thing, one thing only! it helps you manage your todo lists, and if you can't manage them it'll terminate them one by one for you, for free. You are welcome.",
  role:
   "Todermonator aims to keep to-do lists manageable by automatically deleting to-do items that have not been completed after seven days. The hypothesis is that if the to-do item is not important enough to be completed in seven days, it doesn't belong on your to-do list.",
  client: "Bootcamp project - Bloc, Inc.",
  published_on: 90.days.ago,
  link_live: "http://toderminator.herokuapp.com/",
  link_source: "https://github.com/karimmtarek/toderminator"
  )

p4 = Project.new(
  milestone_id: m_id,
  title: "Bloccit",
  description: "A Reddit clone to teach the fundamentals of web development and Rails 4.",
  role:
   "- Duis id sem ornare, dictum augue mattis, auctor libero.\r\n- Integer id urna eleifend, faucibus orci sit amet, tristique lectus.\r\n- Pellentesque aliquet felis vitae ante congue, sit amet sagittis elit lacinia.\r\n- Etiam eu ante commodo, euismod sapien vel, finibus turpis.\r\n- Nunc rutrum sapien a ullamcorper facilisis.",
  client: "Bootcamp project - Bloc, Inc.",
  published_on: 120.days.ago,
  link_live: "http://bloccit-by-kt.herokuapp.com/",
  link_source: "https://github.com/karimmtarek/bloccit"
  )

p1.save
p2.save
p3.save
p4.save