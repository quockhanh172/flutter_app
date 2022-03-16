package ebook.test.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "category")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	@Column(name="name")
	String nameCategory;
	
	@OneToMany(mappedBy = "category",
			   fetch = FetchType.LAZY,
			   cascade = {CascadeType.DETACH,
					      CascadeType.MERGE,
					      CascadeType.PERSIST,
					      CascadeType.REFRESH},
			   orphanRemoval = true)
	List<Ebook> ebooks;
}
