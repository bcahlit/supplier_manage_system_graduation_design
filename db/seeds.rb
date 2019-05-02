# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sentence = [
  '苟利国家生死以，岂因祸福避趋之。',
  '天涯存知己，海内若比邻',
  '人的一切痛苦，本质上都是对自己的无能的愤怒。',
  '当我跨过沉沦的一切，向着永恒开战的时候，你是我的军旗。',
  '深思熟虑的结果往往就是说不清楚。',
  '一个人只有今生今世是不够的,他还应当有诗意的世界。',
  '哪里会有人喜欢孤独，不过是不喜欢失望罢了。',
  '总之岁月漫长，然而值得等待',
  '不要同情自己，同情自己是卑劣懦夫干的勾当。',
  '从小我就懂得保护自己，我知道要想不被人拒绝，最好的办法就是先拒绝别人。',
  '人的烦恼就是记性太好，如果可以把所有事都忘掉，以后每一日都是个新开始，你说多好。',
  '知不知道饮酒和饮水有什么区别？酒越饮越暖，水越喝越寒。',
  '人生若无悔，那该多无趣啊！',
  '人生有两个悲剧，第一是想得到的得不到，第二是想得到的得到了。',
  '做你自己，因为别人都有人做了。',
  '一个人总是可以善待他毫不在意的人。',
  '人真正的完美不在于他拥有什么，而在于他是什么。',
  '我们继续奋力向前，逆水行舟，被不断地向后推，直至回到往昔岁月。',
  '生活就是不断的死亡和复活。',
  '做一个世界的水手，奔赴所有的码头。',
  '我家门前有两棵树，一棵是枣树，另一棵也是枣树。',
]
address = [
  '滨城区',
  '惠民县',
  '阳信县',
  '沾化区',
  '阳信县',
  '博兴县',
  '邹平县'
]
user = User.create({user_name: "admin", phone: "18766653491", password: "admin", password_confirmation: "admin"})

# 创建便笺 便于分页
50.times do
  user.notes.create!(title: Faker::Lorem.word, context: sentence[rand(0..(sentence.size-1))])
end
# 创建日程
20.times do
  user.schedule.create!(date: rand(1555948800..1559232000),
                        detail: sentence[rand(0..(sentence.size-1))], degree: rand(0..2))
end

def createProduct(name, classify)
  Product.create!({
    name: name,
    total: number(5..200),
    number: rand(100000..999999).to_s
    classify: classify
  })
end
# def createSupplier(name){

# }
["面包","饮料","米饭"].each do |name|
  createProduct(name,"食品")
end
["空乘服饰","环卫服饰", "安保服饰", "销售服饰"].each do |name|
  createProduct(name,"服饰")
end
["键盘","打印机","打印纸"].each do |name|
  createProduct(name, "办公设备")
end
["金属探测仪","小推车"].each do |name|
  createProduct(name, "机械设备")
end
["安检扫描仪","空调","服务器"].each do |name|
  createProduct(name, "基础设备")
end
["插座", "风扇", "照明灯具"].each do |name|
  createProduct(name,"建筑设备")
end
["苹果","橘子","李子","火龙果","芒果"].each do |name|
  createProduct(name, "水果")
end

createProduct("系统维护服务", "服务")

[
  "食品公司1",
  "食品公司2",
  "水果公司1",
  "水果公司2",
  "机械公司1",
  "机械公司2",
  "设备公司1",
  "设备公司2",
  "软件公司1",
  "软件公司2"
].each do |name|
  supplier = Supplier.create!({
    phone: rand(18000000000..18999999999).to_s,
    name: name,
    address: address[rand(0..(address.size-1))],
    concat: Faker::Name.name,
    email: Faker::Internet.email
  })
end


# 20.times do
#   OrderForm.find(rand(1..99)).order_details.create!({
#     product: Product.find(rand(1..39)),
#     number: 1,
#     price: rand(60..400),
#     origin_price: rand(80..500),
#   })
# end