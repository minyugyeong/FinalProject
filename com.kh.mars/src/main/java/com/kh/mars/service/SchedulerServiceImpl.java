package com.kh.mars.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.mars.repository.CertDao;

@Service
public class SchedulerServiceImpl implements SchedulerService{
	
	@Autowired
	CertDao certDao;

	@Scheduled(cron = "0 0 * * * *")
	@Override
	public void clearCertData() {
		certDao.clear();
	}

}
