package com.tra.bookapi.controllers;

import com.tra.bookapi.models.Author;
import com.tra.bookapi.repositories.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("authors")
public class AuthorController {
    @Autowired
    private AuthorRepository authorRepository;

    @GetMapping("")
    public String getAllAuthors(ModelMap modelMap) {
        modelMap.addAttribute("authors", authorRepository.findAll());
        modelMap.addAttribute("author", new Author());
        return "authors";
    }

    @GetMapping("/insertAuthor")
    public String insertAuthor(ModelMap modelMap) {
        Author author = new Author();
        modelMap.addAttribute("author", author);
        return "insertAuthor";
    }

    @PostMapping("/insertAuthor")
    public String insertAuthor(@Valid @ModelAttribute("author") Author author,
                               BindingResult bindingResult,
                               ModelMap modelMap) {
        if (bindingResult.hasErrors()) {
            return "insertAuthor";
        }
        authorRepository.save(author);
        modelMap.addAttribute("authors", authorRepository.findAll());
        return "redirect:/authors";
    }

    @PostMapping("")
    public String deleteAuthor(ModelMap modelMap,
                               @ModelAttribute("author") Author author) {
        if (authorRepository.existsById(author.getAuthorID())) {
            authorRepository.deleteById(author.getAuthorID());
        }
        modelMap.addAttribute("authors", authorRepository.findAll());
        return "redirect:/authors";
    }
}
