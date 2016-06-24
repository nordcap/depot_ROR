# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Product.create!(
           title: 'Ноутбук DELL',
           description: "<p> Замечательный рабочий ноутбук который вам послужит хорошую службу </p>",
           image_url: 'notebook.png',
           price: 30000
)

Product.create!(
    title: 'Монитор SAMSUNG',
    description: "<p>Самый лучший монитор с большим сроком гарантии</p>",
    image_url: 'monitor.png',
    price: 10000
)
Product.create!(
    title: 'Роутер D-LINK',
    description: "<p>Роутер с скоростью 100 мб/с</p>",
    image_url: 'router.png',
    price: 2000
)