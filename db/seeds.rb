# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@names = ['Марина','Сережа','Оля','Максим','Ксения','Злата','Саша','Настя','Ева']

@titles = ['Очень здорово','Вот это да','Новость века','Шикарный продукт','Кто напишет код?']

@startups = ['Киоски с конфетами','Искусственная радуга','Цирк из людей','Школа для носорогов','Прогерский коворкинг']

@tags_collections = ['IT','Экономика','Финансы','Дизайн','Искусственный интеллект','Бизнес-аналитика','Анализ данных','Менеджмент']

@tags = ['Котики','Собака','Велосипед','Трактор','Адреналин','Галоши','Вестибюль','Волшебство','Небо','Арматура','Нагеттсы','Чашка','Абрикос','Дантист','Пломба','Инкубация','Учеба','Мечта','Стихотворение','Поставьте нам 9 пожалуйста']

def seed
  reset_db
  create_users(10)
  create_chat(2...5)
  create_message(2...8)
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
      post = startup.posts.create!(title: @titles.sample, startup: startup, user: startup.user, tags: create_tags, public: get_random_bool)
      puts "Post with title #{post.title} and tags #{post.tags} just created"
    end
  end
end

def create_startup(quantity)
  User.all.each do |user|
    quantity.to_a.sample.times do
      startup = user.startups.create!(name:  @startups.sample, user: user, tags: create_tags, public: get_random_bool)
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
      message = chat.messages.create!(text: "Текст сообщения номер #{i}", user: chat.user)
      i += 1
      puts "Message with text #{message.text} just build for chat #{message.chat.name} just created"
    end
  end
end

def create_comment(quantity)
  Post.all.each do |post|
    i = 1

    quantity.to_a.sample.times do
      comment = post.comments.create!(text: "Текст комментария номер #{i}", author_name: post.user.email, user: post.user)
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