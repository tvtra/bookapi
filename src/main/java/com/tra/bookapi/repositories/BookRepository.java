package com.tra.bookapi.repositories;

import com.tra.bookapi.models.Book;
import org.springframework.data.repository.CrudRepository;

public interface BookRepository extends CrudRepository<Book, String> {
    public Iterable<Book> findBooksByAuthorID(String authorID);
}
