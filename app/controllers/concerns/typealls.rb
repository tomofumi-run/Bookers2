module Typealls
extend ActiveSupport::Concern

def set_alls
  @books = Book.all
end

end