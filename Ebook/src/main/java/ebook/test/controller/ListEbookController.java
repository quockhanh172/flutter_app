package ebook.test.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ebook.test.models.Category;
import ebook.test.models.Ebook;
import ebook.test.service.EbookService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("ebook")
@RequiredArgsConstructor
public class ListEbookController {
	private final EbookService ebookService;
	@GetMapping("/list")
	public ResponseEntity<List<Ebook>> getAllBook(){
		List<Ebook> ebooks=  ebookService.getAllbook();
		return new ResponseEntity<>(ebooks, HttpStatus.OK);
	}
	
}
