# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   coding: utf-8
Genre.create!( name: 'ジャンル１')
Genre.create!( name: 'ジャンル')

Product.create!(genre_id: 1, name: 'ケーキ1', describe: 'ケーキ概要1', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ2', describe: 'ケーキ概要2', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ3', describe: 'ケーキ概要3', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ4', describe: 'ケーキ概要4', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ5', describe: 'ケーキ概要5', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ6', describe: 'ケーキ概要6', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ7', describe: 'ケーキ概要7', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ8', describe: 'ケーキ概要8', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ9', describe: 'ケーキ概要9', price: 500, is_active: true)
Product.create!(genre_id: 1, name: 'ケーキ10', describe: 'ケーキ概要10', price: 500, is_active: true)