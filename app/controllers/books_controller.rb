class BooksController < ApplicationController

    get '/books' do 
        if logged_in?
            @books = Book.all
            erb :'books/index'
        else 
            redirect to '/login'
        end
    end

    get '/books/new' do 
        if logged_in?
            erb :'books/new'
        else
            redirect to '/login'
        end
    end


    post '/books' do 
        if logged_in?
            if params[:title] == ""
                redirect to "/books/new"
            else
                @books = current_user.books.build(title: params[:title])
                if @book.save
                    redirect to "/books/#{@book.title}"
                else
                    redirect to "/books/new"
                end
            end
        else
            redirect to '/login'
        end
    end

end