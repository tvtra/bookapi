package com.tra.bookapi.repositories;

import com.tra.bookapi.models.Author;
import org.springframework.data.repository.CrudRepository;

public interface AuthorRepository extends CrudRepository<Author, String> {
    public Author findAuthorByAuthorID(String authorID);
}
