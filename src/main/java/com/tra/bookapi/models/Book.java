package com.tra.bookapi.models;

import com.sun.istack.NotNull;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.*;

@Entity
@Table(name = "Books")
public class Book {
    @Id
    @NotBlank(message = "Book's ID can not be blank!")
    private String bookID;
    private String authorID;
    @NotBlank(message = "Book's title can not be blank!")
    private String title;
    @Min(0)
    private int totalPages;
    @Min(0)
    private int price;

    public Book () {};

    public Book(String bookID, String authorID, String title, int totalPages, int price) {
        this.bookID = bookID;
        this.authorID = authorID;
        this.title = title;
        this.totalPages = totalPages;
        this.price = price;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getAuthorID() {
        return authorID;
    }

    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookID='" + bookID + '\'' +
                ", authorID='" + authorID + '\'' +
                ", title='" + title + '\'' +
                ", totalPages=" + totalPages +
                ", price=" + price +
                '}';
    }
}
