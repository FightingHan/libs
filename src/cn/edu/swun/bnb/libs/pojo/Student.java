package cn.edu.swun.bnb.libs.pojo;

import java.io.Serializable;

public class Student implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
   	String studId;
    String studName;
    Long insId;
    String insName;
    String majorName;
	Long majorId;
    
    public String getInsName() {
		return insName;
	}
	public void setInsName(String insName) {
		this.insName = insName;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getStudId() {
		return studId;
	}
	public void setStudId(String studId) {
		this.studId = studId;
	}
	public String getStudName() {
		return studName;
	}
	public void setStudName(String studName) {
		this.studName = studName;
	}
	public Long getInsId() {
		return insId;
	}
	public void setInsId(Long insId) {
		this.insId = insId;
	}
	public Long getMajorId() {
		return majorId;
	}
	public void setMajorId(Long majorId) {
		this.majorId = majorId;
	}
     

}
