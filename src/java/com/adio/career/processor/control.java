/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.adio.career.processor;

import com.adio.career.Dao.ApplicantDao;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author aojinadu
 */
public class control implements Serializable{
	public String WriteToFile(List<ApplicantDao> app){
		String resp = "";
		
		try {
			FileOutputStream f = new FileOutputStream(new File("C:\\Users\\aojinadu\\Documents\\NetBeansProjects\\AdioConsultancyCareer\\web\\Uploads\\Applicants.txt.txt"));
			ObjectOutputStream o = new ObjectOutputStream(f);

			// Write objects to file
			o.writeObject(app);

			o.close();
			f.close();
			
		} catch (FileNotFoundException e) {
			System.out.println("File not found");
		} catch (IOException e) {
			System.out.println("Error initializing stream");
		} 
		return resp;
	}
	
	public List<ApplicantDao> ReadFiles(){
		List<ApplicantDao> lst = new ArrayList<>();
		try {
			FileInputStream fi = new FileInputStream(new File("C:\\Users\\aojinadu\\Documents\\NetBeansProjects\\AdioConsultancyCareer\\web\\Uploads\\Applicants.txt.txt"));
			ObjectInputStream oi = new ObjectInputStream(fi);

			// Read objects
			List<ApplicantDao> pr1 = (List<ApplicantDao>) oi.readObject();

			System.out.println(pr1.toString());

			oi.close();
			fi.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lst;
	}
}
