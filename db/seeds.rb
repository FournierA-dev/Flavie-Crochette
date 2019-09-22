Article.destroy_all
Attendance.destroy_all
Comment.destroy_all
Event.destroy_all
SubArticle.destroy_all
Tag.destroy_all
Tutorial.destroy_all
User.destroy_all

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# AVANT DE SEEDER il faut :
#     - supprimer l'envoi des e-mails sinon un peu pourri et en plus current_user n'est pas défini
#     - supprimer la propriété confirmable des users
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  u=User.new(
    alias: "Fée Crochette" ,
    address: "3 rue kruger 33600 pessac France",
    age: "35",
    first_name: "Flavie", 
    last_name: "Collette", 
    description: "Je suis un gros gueek et je sais pas si j'aime ca !",
    email: "flavie.collette@live.fr",
    password: '654321'
  )
  u.save!
puts "My user seed Ok"

#Populate User DB
20.times do
  u=User.new(
    alias: "user"+ rand(12..1000).to_s ,
    address:Faker::Address.full_address,
    age: rand(5..80),
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    description: Faker::Movies::Lebowski.quote,
    email: Faker::Internet.email,
    password: rand(111111..222222)
  )
  u.save!
end
puts "Other Users seed Ok"


#Populate Event DB
admin = User.find_by(email:"flavie.collette@live.fr")
  20.times do
    Event.create!(
      start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 365),
      duration: (rand(1..40) * 5).to_s,
      title: ["Rendez-vous crochet chez ","Rencontre thématique au "].sample + Faker::Restaurant.name,
      description: Faker::Lorem.paragraph(sentence_count: rand(5..10)),
      price: rand(1..1000).to_s,
      location: "Bordeaux",
      owner: admin 
    )
  end
puts "Events seed Ok"

#Populate Attendance DB
Event.all.each do |event|
  rand(1..5).times do
    event.attendees << User.where.not(id: event.attendee_ids).sample
  end
end
puts "Attendance seed Ok"


#Populate Tag DB
20.times do
  @hash_tag = []
  @hash_tag << "#" + Faker::Lorem.unique.word
end
puts "Tags seed Ok"


#Populate Tutorial DB
10.times do |n|
  t = Tutorial.create!(
    description: Faker::Lorem.paragraph(sentence_count: rand(5..10)),
    creation_date:Faker::Time.between(from: Date.today-260, to: Date.today),
    name: "Tutoriel #" + n.to_s
  )
  nb_tag = rand(2..5)
  begin
    actual_tags =[]
    t.tags.each {|tag| actual_tags << tag.content }
    new_tag = @hash_tag.sample
    t.tags.create(new_tag) if actual_tags.include?(new_tag)
  end while t.tags.count == nb_tag
end
puts "Tutorials seed Ok"

#Populate Article DB
20.times do
  a = Article.create!(
    name: Faker::Creature::Animal.unique.name,
    article_type: ["Poupée tissu","Poupée crocher","Accessoire enfant","Accessoire adulte"].sample,
    short_description: Faker::Quote.famous_last_words,
    description: Faker::Lorem.paragraph(sentence_count: rand(5..10)),
    creation_date: Faker::Time.between(from: Date.today-365, to: Date.today),
    price: rand(1..1000)
  )
  nb_tag = rand(2..5)
  begin
    actual_tags =[]
    a.tags.each {|tag| actual_tags << tag.content }
    new_tag = @hash_tag.sample
    a.tags.create(new_tag) if actual_tags.include?(new_tag)
  end while a.tags.count == nb_tag
end
puts "Article seed Ok"

#Populate SubArticle DB
Article.all.each do |article|
  article.sub_articles.create!(creation_date: Faker::Time.between(from: article.creation_date, to: Date.today), price: rand(5.0..7.0), sub_article_type: "Modèles") if [true,false].sample

  article.sub_articles.create!(creation_date: Faker::Time.between(from: article.creation_date, to: Date.today), price: rand(5.0..20.0), sub_article_type: "Kits") if [true,false].sample
end
puts "SubArticle seed Ok"

#Populate Article comments DB
Article.all.each do |commentable|
  rand(0..5).times do
    commentable.comments.create!(content: Faker::Hipster.paragraph(sentence_count: rand(2..5)), user: User.all.sample)
  end
end
#Populate Article comments DB
SubArticle.all.each do |commentable|
  rand(0..5).times do
    commentable.comments.create!(content: Faker::Hipster.paragraph(sentence_count: rand(2..5)), user: User.all.sample)
  end
end
#Populate Article comments DB
Tutorial.all.each do |commentable|
  rand(0..5).times do
    commentable.comments.create!(content: Faker::Hipster.paragraph(sentence_count: rand(2..5)), user: User.all.sample)
  end
end
puts "Comments seed Ok"







