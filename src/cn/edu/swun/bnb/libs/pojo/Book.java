package cn.edu.swun.bnb.libs.pojo;

import java.io.Serializable;

public class Book implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String isbn;
	private String name;
	private String author;
	private String publisher;
	private int typeId;
	private int totalNum;
	private int availableNum;
	private int price;
	private boolean withPic;
	private String picUrl;
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getAvailableNum() {
		return availableNum;
	}
	public void setAvailableNum(int availableNum) {
		this.availableNum = availableNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean isWithPic() {
		return withPic;
	}
	public void setWithPic(boolean withPic) {
		this.withPic = withPic;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
