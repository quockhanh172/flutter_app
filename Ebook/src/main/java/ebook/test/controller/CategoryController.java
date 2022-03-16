package ebook.test.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ebook.test.models.Category;
import ebook.test.service.CategoryService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/category")
@RequiredArgsConstructor
public class CategoryController {
	private final CategoryService categoryService;
	@GetMapping("/list")
	public ResponseEntity<List<Category>> getAllBook(){
		List<Category> categories=  categoryService.getAllCategory();
		return new ResponseEntity<>(categories, HttpStatus.OK);
	}
	
	@GetMapping("/find/id")
	public ResponseEntity<Category> getAllBook(@PathVariable int id){
		Category category=  categoryService.findCategoryById(id);
		return new ResponseEntity<>(category, HttpStatus.OK);
	}
}
