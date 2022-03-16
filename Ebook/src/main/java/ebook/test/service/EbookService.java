package ebook.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ebook.test.models.Ebook;
import ebook.test.repository.EbookRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EbookService {
	private final EbookRepository ebookRepository;
	
	public List<Ebook> getAllbook(){
		return ebookRepository.findAll();
	}
}
