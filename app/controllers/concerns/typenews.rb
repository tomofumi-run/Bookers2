module Typenews
extend ActiveSupport::Concern

def set_news
  @new_book = Book.new
end

end