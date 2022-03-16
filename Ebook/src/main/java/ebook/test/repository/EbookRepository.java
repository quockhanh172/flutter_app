package ebook.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ebook.test.models.Ebook;

public interface EbookRepository extends JpaRepository<Ebook, Integer> {
	Ebook findById(int id);
}
