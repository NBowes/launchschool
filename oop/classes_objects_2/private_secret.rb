class Person
  attr_writer :secret

  def shared_secret
    puts secret
  end

  private

  attr_reader :secret
end

person = Person.new
person.secret = "Shh.. it's a secret"
person.shared_secret
