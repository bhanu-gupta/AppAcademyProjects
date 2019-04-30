# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all
CatRentalRequest.destroy_all
cat1 = Cat.create!(birth_date: '2015/01/20', color: 'Black', name: 'Gizmo', sex: 'M', description:'Lazy and Fat')
cat2 = Cat.create!(birth_date: '2000/03/10', color: 'Brown', name: 'ButterCub', sex: 'F', description:'Old and Fat')

CatRentalRequest.create!(cat_id: cat1.id, start_date: '2016/01/20', end_date:'2017/01/20', status:'APPROVED')
CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/01/21', end_date:'2018/01/20', status:'DENIED')
CatRentalRequest.create!(cat_id: cat1.id, start_date: '2018/01/20', end_date:'2019/01/20', status:'PENDING')
