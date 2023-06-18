package com.tra.bookapi.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "Authors")
public class Author {
    @Id
    @NotBlank(message = "Author's ID can not be blank!")
    private String authorID;
    @NotBlank(message = "Author's name can not be blank!")
    private String authorName;

    public Author() {};

    public Author(String authorID, String authorName) {
        this.authorID = authorID;
        this.authorName = authorName;
    }

    public String getAuthorID() {
        return authorID;
    }

    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    @Override
    public String toString() {
        return "Author{" +
                "authorID='" + authorID + '\'' +
                ", authorName='" + authorName + '\'' +
                '}';
    }
}
