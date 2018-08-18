/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.adio.career.processor;

/**
 *
 * @author aajibade
 */
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadFile extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final String uploadPath = "AdioConsultancyCareer\\web\\Uploads";

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		// process only if its multipart content
		if (isMultipart) {
			System.out.println("got herea");
			// Create a factory for disk-based file items
			FileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				// Parse the request
				List<FileItem> multiparts = upload.parseRequest(request);

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						try {
							System.out.println("item.isFormField() yes");
							String fileName = new File(item.getName()).getName();
							String filePath = uploadPath + File.separator + fileName;
							System.out.println("pth " + filePath);
							// String filePath = "C:/testupload/" + fileName;
							System.out.println("filePath<<>> " + filePath);
							File storeFile = new File(filePath);

							// saves the file on disk
							item.write(storeFile);
							
							session.setAttribute("passport", storeFile);
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				System.out.println("File upload failed");
			}
		}
	}
}
