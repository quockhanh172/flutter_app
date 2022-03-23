package ebook.test.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import ebook.test.models.Ebook;
import ebook.test.repository.CategoryRepository;
import ebook.test.repository.EbookRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EbookService {
	private final EbookRepository ebookRepository;
	private final CategoryRepository categoryRepository;
	String userDirectory = System.getProperty("user.dir");
	public List<Ebook> getAllbook(){
		return ebookRepository.findAll();
	}
	 
	public void deleteEbook(int id) throws IOException {
		Ebook e = ebookRepository.findById(id);
		Path path = null;
		try {
			path = Paths.get(userDirectory + "/src/main/resources/templates/"+e.getImage());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Files.deleteIfExists(path);
		ebookRepository.deleteById(id);
	}
	
	public Ebook addNewBook(DataResponse dataResponse,MultipartFile image)throws IOException, ParseException {
		Ebook newEbook = new Ebook();
		newEbook.setTitle(dataResponse.getTitle());
		newEbook.setAuthor(dataResponse.getAuthor());
		newEbook.setCategory(categoryRepository.findById(dataResponse.getCategoryId()));
		newEbook.setDescription(dataResponse.getDescription());
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		newEbook.setDate(df.parse(dataResponse.date));
		if(image!=null) {
			if (image.getOriginalFilename() != null) {
				
				newEbook.setImage("image/"+dataResponse.getTitle()+"."+"jpg");
				savefile(image,dataResponse);
			}
		}
		Ebook ebook = ebookRepository.save(newEbook);
		return ebook;
	}
	
	public Ebook updateEbook(DataResponse dataResponse,MultipartFile image)throws IOException, ParseException {
		Ebook newEbook = ebookRepository.findById(dataResponse.id);
		newEbook.setTitle(dataResponse.getTitle());
		newEbook.setAuthor(dataResponse.getAuthor());
		newEbook.setCategory(categoryRepository.findById(dataResponse.getCategoryId()));
		newEbook.setDescription(dataResponse.getDescription());
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		newEbook.setDate(df.parse(dataResponse.date));
		if(image!=null) {
			if (image.getOriginalFilename() != null) {
				
				newEbook.setImage("image/"+dataResponse.getTitle()+"."+"jpg");
				savefile(image,dataResponse);
			}
		}
		Ebook ebook = ebookRepository.save(newEbook);
		return ebook;
	}
	
	
	public void savefile(MultipartFile file,DataResponse data) throws IOException {
		if (file != null) {
			String userDirectory = System.getProperty("user.dir");
			Path path = Paths.get(userDirectory+ "/src/main/resources/templates/image/"+data.getTitle()+"."+"jpg");
			if (Files.exists(path)) {
				Files.deleteIfExists(path);
			}
			File convertFile = new File(userDirectory+ "/src/main/resources/templates/image/",
					data.getTitle()+"."+"jpg");
			convertFile.createNewFile();
			try (FileOutputStream fout = new FileOutputStream(convertFile)) {
				fout.write(file.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
