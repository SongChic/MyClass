package com.myClass.Common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUpload {
	
	private String dir;
	private String oldFileName;
	private MultipartHttpServletRequest request;
	
	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}
	
	public String getOldFileName() {
		return oldFileName;
	}

	public void setOldFileName(String oldFileName) {
		this.oldFileName = oldFileName;
	}

	public MultipartHttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(MultipartHttpServletRequest request) {
		this.request = request;
	}
	
	public FileUpload () {
		
	}
	public FileUpload (String dir, MultipartHttpServletRequest request) {
		this.dir = dir;
		this.request = request;
	}

	public String upload() {
		
		Iterator<String> iterator = request.getFileNames();
		
		if ( iterator.hasNext() ) { 
			MultipartFile multipartFile = request.getFile(iterator.next());
		
		
			HttpServletRequest httpServletRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			
			try {
				
				/* 파일이름 정의 (projectName_yyyyMMdd_HHmmss) */
				String projectName = MyclassCommon.enAppName;
				SimpleDateFormat fileSuffix = new SimpleDateFormat("_yyyyMMdd_HHmmss");
				
				String originFileName = multipartFile.getOriginalFilename();
				String fileName = projectName + fileSuffix.format( new Date() ) + originFileName.substring(originFileName.indexOf("."), originFileName.length());
				
				File directory = new File( httpServletRequest.getSession().getServletContext().getRealPath(dir)  + "/data/" );
				
				/* 폴더 존재 여부 및 생성 */
				if ( !directory.exists() ) {
					directory.mkdirs();
				}
				
				/* 이전 파일이 존재하면 삭제 */
				if ( oldFileName != null ) {
					File deleteFile = new File ( httpServletRequest.getSession().getServletContext().getRealPath(dir) + "/data/" + oldFileName );
					
					if ( deleteFile.isFile() ) {
						deleteFile.delete();
					}
				}
				
				
				/* 파일 저장 */
				File file = new File( directory.getAbsolutePath() + "\\" + fileName );
				byte[] bytes = multipartFile.getBytes();
				
				BufferedOutputStream stream = new BufferedOutputStream( new FileOutputStream( file ) );
				stream.write(bytes);
				stream.close();
				
				System.out.println("fileUpload file Name : " + fileName);
				
				return fileName;
				
			} catch ( Exception e ) {
				e.printStackTrace();
			}
		}
		
		return "";
	}
	
}
