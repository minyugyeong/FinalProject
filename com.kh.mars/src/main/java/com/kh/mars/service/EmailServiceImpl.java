package com.kh.mars.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.CertDto;
import com.kh.mars.repository.CertDao;

@Repository
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private CertDao certDao;
	
	private Random r = new Random();
	private Format f = new DecimalFormat("000000");

	@Override
	public void sendCert(String memberEmail) {
		int certNumber = r.nextInt(1000000);
 		String certString = f.format(certNumber);
 		
 		String title = "[MARS] 회원가입 인증번호";
 		String content = "인증번호 : " + certString;
 		
 		SimpleMailMessage message = new SimpleMailMessage();
 		message.setTo(memberEmail);
 		message.setSubject(title);
 		message.setText(content);

 		mailSender.send(message);
 		
 		certDao.insert(CertDto.builder()
 							.memberEmail(memberEmail)
 							.certNumber(certString)
 							.build());
	}

}
