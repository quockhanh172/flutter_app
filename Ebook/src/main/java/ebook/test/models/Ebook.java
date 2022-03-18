package ebook.test.models;


import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "book")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ebook {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@Column(name= "title")
	String title;
	@Column(name= "author")
	String author;
	@Column(name= "date")
	Date date;
	@Column(name= "summary")
	String description;
	@Column(name= "image")
	String image;
	@ManyToOne(fetch = FetchType.EAGER, 
			cascade = {CascadeType.DETACH,
					   CascadeType.MERGE,
					   CascadeType.PERSIST,
					   CascadeType.PERSIST})
	@JoinColumn(name="id_category")
	@JsonIgnore(true)
	Category category;
	
	
	public String getCategoryName() {
		if(this.category.getNameCategory()!="") {
			return this.category.getNameCategory();
		}
		else{
			return "";
		}
	}
	
	@JsonProperty("categoryId")
	public int getCategoryId() {
		if(this.category.getNameCategory()!="") {
			return this.category.getId();
		}
		else{
			return 0;
		}
	}
}
