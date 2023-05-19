user = User.new("noro", "noro@example.com")
puts user.name_with_label
puts user.email_with_label
user = User.new("taro", "taro@example.com")
puts user.name_with_label
puts user.email_with_label

book = Book.new("RubyBook", "matz")
puts book.title_and_author
book = Book.new("RailsBook", "DHH")
puts book.title_and_author