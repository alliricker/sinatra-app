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
                @book = current_user.books.build(title: params[:title], author: params[:author], summary: params[:summary])
                if @book.save
                    redirect to "/books/#{@book.id}"
                else
                    redirect to "/books/new"
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/books/:id' do 
        if logged_in?
            @book = Book.find_by_id(params[:id])
            erb :'books/show_book'
        else
            redirect to '/login'
        end
    end

end