/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.adio.career.Dao;

import java.io.File;

/**
 *
 * @author aojinadu
 */
public class ApplicantDao {
	private String Firstname;
	private String Surname;
	private String PhoneNumber;
	private String EmailAddress;
	private String CoverLetter;
	private File passprt;
	private File resume;

	public String getFirstname() {
		return Firstname;
	}

	public void setFirstname(String Firstname) {
		this.Firstname = Firstname;
	}

	public String getSurname() {
		return Surname;
	}

	public void setSurname(String Surname) {
		this.Surname = Surname;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String PhoneNumber) {
		this.PhoneNumber = PhoneNumber;
	}

	public String getEmailAddress() {
		return EmailAddress;
	}

	public void setEmailAddress(String EmailAddress) {
		this.EmailAddress = EmailAddress;
	}

	public String getCoverLetter() {
		return CoverLetter;
	}

	public void setCoverLetter(String CoverLetter) {
		this.CoverLetter = CoverLetter;
	}

	public File getPassprt() {
		return passprt;
	}

	public void setPassprt(File passprt) {
		this.passprt = passprt;
	}

	public File getResume() {
		return resume;
	}

	public void setResume(File resume) {
		this.resume = resume;
	}
}
