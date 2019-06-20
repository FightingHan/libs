package cn.edu.swun.bnb.libs.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadFileController {
	
	Logger log = LoggerFactory.getLogger(UploadFileController.class);
	
	@RequestMapping(value="/shangchuan",method = RequestMethod.GET)
	public String shangchuan() {
		return "shangchuan";
	}
	@RequestMapping(value="/shangchuan",method = RequestMethod.POST)
	public String shangchuan(HttpServletRequest request,MultipartFile file) {
		log.debug("filename is {}",file.getOriginalFilename());
		return "shangchuan";
	}

}
