package com.extr.file.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 上传文件
 * @author scar
 *
 */
public class FileUploadUtil {

	private static Log log = LogFactory.getLog(FileUploadUtil.class);
	public static List<String> uploadFile(HttpServletRequest request, 
			HttpServletResponse response, String username) throws FileNotFoundException{
		List<String> filePathList = new ArrayList<String>();
		
		String strPath = ",webapps,files,question," + username + ",tmp";
		
		String filepath = System.getProperty("catalina.base") + strPath.replace(',', File.separatorChar);
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		String fileName = null;
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {

			MultipartFile mf = entity.getValue();
			fileName = mf.getOriginalFilename();
			String newfilepath;
			newfilepath = filepath + File.separatorChar + fileName;

			System.out.println("newfilepath=" + newfilepath);
			File dest = new File(filepath);
			if(!dest.exists()){
				dest.mkdirs();
			}
			File uploadFile = new File(newfilepath);
			if(uploadFile.exists()){
				uploadFile.delete();
			}
			try {

				log.info("start upload file: " + fileName);
				FileCopyUtils.copy(mf.getBytes(), uploadFile);
			} catch (IOException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
				log.info("upload failed. filename: " + fileName + e.getMessage());
				return null;
			}
			filePathList.add(newfilepath);
		}
		
		return filePathList;
	}
	
	public static List<String> uploadImg(HttpServletRequest request, 
			HttpServletResponse response, String username) throws Exception{
		List<String> filePathList = new ArrayList<String>();

		String strPath = ",webapps,files,question," + username;
		
		String filepath = System.getProperty("catalina.base") + strPath.replace(',', File.separatorChar);
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		String fileName = null;
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {

			MultipartFile mf = entity.getValue();
			fileName = mf.getOriginalFilename();
			String file_type = fileName.substring(fileName.indexOf('.'));
			if(!".jpg".equals(file_type.toLowerCase()) && !".png".equals(file_type.toLowerCase()))
				throw new Exception("文件类型错误");
			fileName = System.currentTimeMillis() + file_type;
			String newfilepath;
			newfilepath = filepath + File.separatorChar + fileName;
			String filepathUrl = "files" + File.separatorChar + "question" + File.separatorChar + username + File.separatorChar + fileName;

			System.out.println("newfilepath=" + newfilepath);
			File dest = new File(filepath);
			if(!dest.exists()){
				dest.mkdirs();
			}
			File uploadFile = new File(newfilepath);
			if(uploadFile.exists()){
				uploadFile.delete();
			}
			try {

				log.info("start upload file: " + fileName);
				FileCopyUtils.copy(mf.getBytes(), uploadFile);
			} catch (IOException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
				log.info("upload failed. filename: " + fileName + e.getMessage());
				return null;
			}
			filePathList.add(filepathUrl);
			
		}
		
		return filePathList;
	}
	
}
