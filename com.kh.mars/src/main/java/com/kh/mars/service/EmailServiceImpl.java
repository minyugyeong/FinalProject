package com.kh.mars.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.mars.entity.CertDto;
import com.kh.mars.repository.CertDao;

@Service
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

	@Override
	public void sendPasswordResetMail(String memberEmail) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		helper.setTo(memberEmail);
		helper.setSubject("[MARS] 비밀번호 재설정 메일입니다");
		
		int certNumber = r.nextInt(1000000);
		String certString = f.format(certNumber);
		
		String returnUri = ServletUriComponentsBuilder
												.fromCurrentContextPath()
												.path("/member/reset")
												.queryParam("memberId", memberEmail)
												.queryParam("cert", certString)
												.toUriString();
		String content = 
				"<a href='"+returnUri+"'>"
					+ "비밀번호를 재설정하시려면 여기를 누르세요"
			+ "</a>";
		helper.setText(content, true);
		
		mailSender.send(message);
		
		certDao.insert(CertDto.builder()
									.memberEmail(memberEmail)
									.certNumber(certString)
									.build());
	}
	
}