package com.tra.bookapi.controllers;

import com.tra.bookapi.models.Book;
import com.tra.bookapi.repositories.AuthorRepository;
import com.tra.bookapi.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @GetMapping("/getByAuthorID/{authorID}")
    public String getBooksByAuthorID(ModelMap modelMap,
                                     @PathVariable String authorID) {
        var books = bookRepository.findBooksByAuthorID(authorID);
        modelMap.addAttribute("books", books);
        modelMap.addAttribute("book", new Book());
        modelMap.addAttribute("authorName", authorRepository.findAuthorByAuthorID(authorID).getAuthorName());
        return "getBooksByAuthorID";
    }

    @GetMapping("/insertBook")
    public String insertBook(ModelMap modelMap) {
        modelMap.addAttribute("book", new Book());
        modelMap.addAttribute("authors", authorRepository.findAll());
        return "insertBook";
    }

    @PostMapping("/insertBook")
    public String insertBook(@Valid @ModelAttribute("book") Book book,
                             BindingResult bindingResult,
                             ModelMap modelMap) {
        if (bindingResult.hasErrors()) {
            modelMap.addAttribute("authors", authorRepository.findAll());
            return "insertBook";
        }

        bookRepository.save(book);
        return "redirect:/books/getByAuthorID/" + book.getAuthorID();
    }

    @GetMapping("/updateBook/{bookID}")
    public String updateBook(ModelMap modelMap,
                             @PathVariable String bookID) {
        modelMap.addAttribute("foundBook", bookRepository.findById(bookID).get());
        modelMap.addAttribute("authors", authorRepository.findAll());
        modelMap.addAttribute("book", new Book());
        return "updateBook";
    }

    @PostMapping("/updateBook/{bookID}")
    public String updateBook(@ModelAttribute("book") Book book,
                             ModelMap modelMap,
                             @PathVariable String bookID) {

        var foundBook = bookRepository.findById(bookID).get();
        if (book.getPrice() > 0) {
            foundBook.setPrice(book.getPrice());
            bookRepository.save(foundBook);
        }

        return "redirect:/books/getByAuthorID/" + foundBook.getAuthorID();
    }

    @PostMapping("/deleteBook/{bookID}")
    public String deleteBook(ModelMap modelMap,
                             @PathVariable String bookID) {
        String authorID = bookRepository.findById(bookID).get().getAuthorID();
        bookRepository.deleteById(bookID);
        return "redirect:/books/getByAuthorID/" + authorID;
    }
}
