require 'java'

java_package 'com.theplainprogrammer.examples'

class Hello
  java_signature 'String helloHandler(String)'
  def helloHandler(name)
    "Hello, #{name}!"
  end
end
