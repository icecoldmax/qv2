class CreateAdmin < ActiveRecord::Migration
  def up
    User.create(name: "admin", email: "admin@admin.com", password: "foobar", password_confirmation: "foobar", admin: true)
  end
end
