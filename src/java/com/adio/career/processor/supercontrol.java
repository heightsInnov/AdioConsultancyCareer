/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.adio.career.processor;

import com.adio.career.Dao.ApplicantDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

/**
 *
 * @author aojinadu
 */
public class supercontrol extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private final String uploadPath = "C:\\Users\\aojinadu\\Documents\\NetBeansProjects\\AdioConsultancyCareer\\web\\Uploads";

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ApplicantDao app = new ApplicantDao();
		try {
			File passport = (File) session.getAttribute("passport");
			if (passport != null) {
				app.setPassprt(passport);
			}
			String fname = "", sname = "", phone = "", email = "", cletter = "";

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

								app.setResume(storeFile);

							} catch (Exception ex) {
								ex.printStackTrace();
							}
						} else if (item.isFormField()) {

							try {
								String name = item.getFieldName();
								String value = item.getString();
								System.out.println("<<<>>>>>name: " + name + " <<>>value: " + value);
								if (name.equalsIgnoreCase("fname")) {
									fname = value;
								}
								if (name.equalsIgnoreCase("sname")) {
									sname = value;
								}
								if (name.equalsIgnoreCase("phone")) {
									phone = value;
								}
								if (name.equalsIgnoreCase("email")) {
									email = value;
								}
								if (name.equalsIgnoreCase("cletter")) {
									cletter = value;
								}
							} catch (Exception e) {
								e.printStackTrace();
							}

						}
					}
					app.setFirstname(fname);
					app.setSurname(sname);
					app.setPhoneNumber(phone);
					app.setEmailAddress(email);
					app.setCoverLetter(cletter);
				} catch (Exception e) {
					System.out.println("File upload failed");
				}
			}
			List<ApplicantDao> lst = new ArrayList<ApplicantDao>();
			lst.add(app);
			session.setAttribute("Applicants", lst);
			control c = new control();
			
			c.WriteToFile(lst);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
