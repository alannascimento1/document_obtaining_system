# frozen_string_literal: true

class Hello < Actor
  input :name

  def call
    puts "Olá, #{name}!"
  end
end
