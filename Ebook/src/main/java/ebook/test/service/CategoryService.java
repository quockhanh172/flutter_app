package ebook.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ebook.test.models.Category;
import ebook.test.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CategoryService {
	private final CategoryRepository categoryRepository; 
	
	public Category findCategoryById(int id) {
		return categoryRepository.findById(id);
	}
	
	public List<Category> getAllCategory(){
		return categoryRepository.findAll();
	}
}
