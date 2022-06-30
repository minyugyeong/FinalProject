package com.kh.mars.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/file")
public class FileController {
	
	
	@GetMapping("/download/{fileName}")
	@ResponseBody//여기서 반환되는 데이터는 뷰가 아닙니다
	public ResponseEntity<ByteArrayResource> download(
														@PathVariable int fileName) throws IOException	{
		
		// 1. 파일 객체를 준비
				File dir = new File(System.getProperty("user.home") + "/upload");
				File target = new File(dir, String.valueOf(fileName));
				if(!target.exists()) return ResponseEntity.notFound().build();//사용자에게 직접 404를 반환//throw new Exception()으로 처리하는 방법도 있음 @ControllerAdvice로 전송
		// 2. 응답 객체를 만들어서 반환
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(target.length())
				.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
				//.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=reply.png")
				.header(HttpHeaders.CONTENT_DISPOSITION, 
						ContentDisposition.attachment()
						.filename("reply.png", StandardCharsets.UTF_8)
						.build()
						.toString()
				)
				.body(resource);
	}

}
