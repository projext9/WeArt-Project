package we.are.travelers.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.TestDao;

@Service
public class TestService {
	
	private TestDao testDao;
	
	@Autowired
	public TestService(TestDao testDao) {
		this.testDao = testDao;
	}
	
	public HashMap<String, String> testlogin(HashMap<String, String> map) {
		return testDao.testlogin(map);
	}
	
	public HashMap<String, String> testlogincompany(HashMap<String, String> map) {
		return testDao.testlogincompany(map);
	}
	
}
