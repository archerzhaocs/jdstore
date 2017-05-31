# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize Admin User

if User.find_by(email: "admin@xstore.com").nil?
  u = User.new
  u.email = "admin@xstore.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Initialize Product

Product.create!(title: "少儿常见病险",
  description: "儿童常见疾病手足口病、荨麻疹、急性肠胃炎医疗保障",
  price: 80,
  quantity: 100,
  image: open("http://chaoshi.pingan.com/img/00759026_SUB11.jpg")
  )

Product.create!(title: "全球旅游险（境外）",
  description: "0-80周岁，因旅游、商务、探亲而出国的人群",
  price: 450,
  quantity: 10,
  image: open("http://chaoshi.pingan.com/img/00580088_SUB11.jpg")
  )

Product.create!(title: "中老年人综合医疗保险",
  description: "工作、旅游日常意外全覆盖。十三项保障多方位呵护！",
  price: 200,
  quantity: 1000,
  image: open("http://chaoshi.pingan.com/img/00741250_SUB11.jpg")
  )

  Product.create!(title: "运动卫士",
    description: "不限社保目录，自费药/进口药均可报； 坚持运动，最高可获335元健康奖励！",
    price: 58,
    quantity: 1000,
    image: open("http://chaoshi.pingan.com/img/00559605_SUB11.jpg")
    )
