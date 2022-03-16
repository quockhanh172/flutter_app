package ebook.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ebook.test.models.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	Category findById(int id);
}
