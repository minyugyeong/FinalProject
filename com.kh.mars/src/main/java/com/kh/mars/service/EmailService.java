package com.kh.mars.service;

import javax.mail.MessagingException;

public interface EmailService {

	void sendCert(String memberEmail);

	void sendPasswordResetMail(String memberEmail) throws MessagingException;

}
