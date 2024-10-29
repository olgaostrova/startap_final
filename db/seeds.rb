# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@names = ['Марина','Сережа','Оля','Максим','Ксения','Злата','Саша','Настя','Ева']

@titles = [
  "Какой самый странный совет вам давали по поводу стартапа?",
  "Если бы ваш стартап был животным, то каким?",
  "Как вы справляетесь с неудачами: танцами или шоколадом?",
  "Какой самый нелепый бизнес-план вы когда-либо слышали?",
  "Сколько чашек кофе нужно, чтобы запустить успешный стартап?",
  "Как вы объясняете своей бабушке, чем занимаетесь?",
  "Какой ваш любимый способ убивать время вместо работы?",
  "Если бы ваши идеи могли говорить, что бы они сказали?",
  "Какой самый смешной провал у вас был на стартапе?",
  "Какой ваш секрет успеха: удача или магия?",
  "Какой самый странный вопрос вам задавали инвесторы?",
  "Что вы делаете, когда вдохновение уходит в отпуск?",
  "Какой ваш стартап мог бы стать сюжетом для комедийного фильма?",
  "Какой самый глупый способ вы пытались привлечь клиентов?",
  "Какой самый неожиданный источник вдохновения у вас был?",
  "Как бы вы описали свой стартап в одном предложении — с юмором?",
  "Какой совет вы бы дали себе в начале пути, если бы могли?",
  "Какой ваш любимый способ справляться со стрессом?",
  "Что вы делаете, когда ваш бизнес-план идет не по плану?",
  "Какой ваш любимый мем о стартапах?"]

@startups = ['Киоски с конфетами','Искусственная радуга','Цирк из людей','Школа для носорогов','Прогерский коворкинг',  "Кофе и Котики",
"Сонный Бизнес",
"Стартапы на Диване",
"Креативные Неудачи",
"Проблемы с Кофе",
"Гениальные Провалы",
"Бюрократия 2.0",
"Мечты на Завтрак",
"Деньги из Ничего",
"Стартап для Лентяев",
"Зомби-Бизнес",
"Кофейные Идеи",
"Успех на Шутках",
"Неудачный Гений",
"Стартапы с Хаосом",
"Рецепт Успеха",
"Оптимистичный Провал",
"Стартапы для Мечтателей",
"Бизнес на Кофе",
"Смешные Идеи",
"Волшебные рогоносцы",
"Балалаечный аттракцион",
"Memwolf",
"Удивительный рубильник",
"Аукс или все же ауф?",
"Всемогущий день"]

@tags_collections = ['IT','Экономика','Финансы','Дизайн','Искусственный интеллект','Бизнес-аналитика','Анализ данных','Менеджмент']

@tags = ['Котики','Собака','Велосипед','Трактор','Адреналин','Галоши','Вестибюль','Волшебство','Небо','Арматура','Нагеттсы','Чашка','Абрикос','Дантист','Пломба','Инкубация','Учеба','Мечта','Стихотворение','Поставьте нам 9 пожалуйста']

@raw_text = 'Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий.'

@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')


def seed
  reset_db
  create_users(10)
  create_chat(2...5)
  create_message(10...20)
  create_startup(1...3)
  create_post(2...8)
  create_comment(2...8)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def get_random_bool
  [true, false].sample
end

def get_random_number
  (5..100).to_a.sample
end

def create_sentence
  sentence_words = []

  (10..20).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def create_users(quantity)
  i = 1

  quantity.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    if i == 1
      user_data[:admin] = true
    end

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
  end
end

def create_post(quantity)
  Startup.all.each do |startup|
    quantity.to_a.sample.times do
      post = startup.posts.create!(title: @titles.sample, startup: startup, user: startup.user, tags: create_tags, text: create_sentence, likes: get_random_number, dislikes: get_random_number, taps: get_random_number, public: get_random_bool)
      puts "Post with title #{post.title} and tags #{post.tags} just created"
    end
  end
end

def create_startup(quantity)
  User.all.each do |user|
    quantity.to_a.sample.times do
      startup = user.startups.create!(name:  @startups.sample, user: user, tags: create_tags, description: create_sentence, public: get_random_bool)
      puts "Startup with title #{startup.name} and tags #{startup.tags} just created"
    end
  end
end

def create_chat(quantity)
  User.all.each do |user|
    i = 1

    quantity.to_a.sample.times do
      if user.present?
        chat = user.chats.create!(name: "Чат #{i}", user: user)
        puts "Chat number #{i} just build for user #{chat.user.email} just created"
        i += 1
      end
    end
  end
end

def create_message(quantity)
  Chat.all.each do |chat|
    i = 1

    quantity.to_a.sample.times do
      user = User.all.sample
      message = chat.messages.create!(text: create_sentence, author_name: user.email, user: user)
      i += 1
      puts "Message with text #{message.text} just build for chat #{message.chat.name} just created"
    end
  end
end

def create_comment(quantity)
  Post.all.each do |post|
    i = 1

    quantity.to_a.sample.times do
      user = User.all.sample
      comment = post.comments.create!(text: "Текст комментария номер #{i}", author_name: user.email, user: user, text: create_sentence, likes: get_random_number, dislikes: get_random_number, taps: get_random_number)
      i += 1
      puts "Comment with text #{comment.text} just build for post #{comment.post.title} just created"
    end
  end
end

def create_tags
  tags_arr = []
  2..5.times do
    tags_arr << @tags.sample
  end
  tags_arr.join(", ")
end


seed