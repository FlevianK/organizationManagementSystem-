# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
user = User.create!({name: ENV['NAME'], email: ENV['EMAIL'], password: ENV['PASSWORD'], password_confirmation: ENV['PASSWORD']})
