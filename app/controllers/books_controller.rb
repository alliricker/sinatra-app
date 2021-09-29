class BooksController < ApplicationController

    get '/books' do 
        if logged_in?
            @books = Book.all
            erb :'books/index'
        else 
            redirect to '/login'
        end
    end

    post '/books' do
        erb :'books/index'
    end

end