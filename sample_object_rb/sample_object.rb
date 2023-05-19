class User
    attr_writer :name, :email
    def initialize(name, email)
      @name, @email = name, email
    end
    def name_with_label
      "name: #{@name}"
    end
    def email_with_label
      "name: #{@email}"
    end
  end
  
  class Book
    attr_writer :title, :author
    def initialize(title, author)
      @title, @author = title, author
    end
    def title_and_author
      "#{@title} - #{@author}"
    end
  end
  
  user = User.new("noro", "noro@example.com")
  puts user.name_with_label
  puts user.email_with_label
  
  book = Book.new("RubyBook", "matz")
  puts book.title_and_author