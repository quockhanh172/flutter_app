package ebook.test.controller;

import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.List;

import org.hibernate.annotations.Parameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import ebook.test.models.Ebook;
import ebook.test.service.DataResponse;
import ebook.test.service.EbookService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("ebook")
@RequiredArgsConstructor
public class EbookController {
	private final EbookService ebookService;
	@GetMapping("/list")
	public ResponseEntity<List<Ebook>> getAllBook(){
		List<Ebook> ebooks=  ebookService.getAllbook();
		return new ResponseEntity<>(ebooks, HttpStatus.OK);
	}
	
	@PostMapping(value ="/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<Ebook> createNewBook(@RequestParam("title") String title,
											   @RequestParam("author") String author,
											   @RequestParam("date") String date,
											   @RequestParam("description") String description,
											   @RequestParam("categoryId") int categoryId,
											   @RequestParam(value="image", required = false)MultipartFile image)throws IOException, ParseException{
		DataResponse data = new DataResponse();
		data.setTitle(title);
		data.setAuthor(author);
		data.setCategoryId(categoryId);
		data.setDate(date);
		data.setDescription(description);
		Ebook ebook=  ebookService.addNewBook(data,image);
		return new ResponseEntity<>(ebook, HttpStatus.OK);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Integer> deleteBook(@PathVariable int id) throws IOException{
		ebookService.deleteEbook(id);
		return new ResponseEntity<>(id, HttpStatus.OK);
	}
	
	
	@GetMapping(path = "/image/{fileName}", produces = IMAGE_JPEG_VALUE)
    public byte[] getProfileImage(@PathVariable("fileName") String fileName)
            throws IOException {
		String userDirectory = System.getProperty("user.dir");
        // /user/ray/springAngularEcommerce2/users/
        return Files.readAllBytes(Paths.get(userDirectory + "/src/main/resources/templates/image"+ "/" + fileName));
    }
}
