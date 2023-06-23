# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

imagen = File.open(Rails.root.join('app/assets/images/foto_inicio/Admin.png'))
admin_user = AdminUser.new(
    email: 'admin@example.com', 
    password: 'password', 
    password_confirmation: 'password', 
    nombre: "admin", 
    descripcion: "Admin Original", 
    telefono: "999999999",
    admin: true
)

admin_user.imagen.attach(io: imagen, filename: 'Admin.png')
admin_user.save!
imagen.close

imagen = File.open(Rails.root.join('app/assets/images/foto_inicio/Admin.png'))
user = User.new(
    email: 'admin@example.com', 
    password: 'password', 
    password_confirmation: 'password', 
    name: "admin", 
    descripcion: "Admin Original", 
    telefono: "999999999",
    admin: true
)
user.imagen.attach(io: imagen, filename: 'Admin.png')
user.save!

imagen.close