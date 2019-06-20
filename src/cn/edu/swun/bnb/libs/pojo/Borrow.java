package cn.edu.swun.bnb.libs.pojo;

import java.io.Serializable;
import java.util.Date;

public class Borrow implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String studId;
	private String ISBN;
	private Date borrowDay;
	private Date shouldReturn;
	private Date actualReturn;
	private boolean renew;
	private float fine;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudId() {
		return studId;
	}
	public void setStudId(String studId) {
		this.studId = studId;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public Date getBorrowDay() {
		return borrowDay;
	}
	public void setBorrowDay(Date borrowDay) {
		this.borrowDay = borrowDay;
	}
	public Date getShouldReturn() {
		return shouldReturn;
	}
	public void setShouldReturn(Date shouldReturn) {
		this.shouldReturn = shouldReturn;
	}
	public Date getActualReturn() {
		return actualReturn;
	}
	public void setActualReturn(Date actualReturn) {
		this.actualReturn = actualReturn;
	}
	public boolean isRenew() {
		return renew;
	}
	public void setRenew(boolean renew) {
		this.renew = renew;
	}
	public float getFine() {
		return fine;
	}
	public void setFine(float fine) {
		this.fine = fine;
	}

}
