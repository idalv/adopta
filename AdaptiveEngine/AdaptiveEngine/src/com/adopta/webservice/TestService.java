package com.adopta.webservice;

import javax.ejb.Stateless;
import javax.jws.WebService;

@WebService
@Stateless
public class TestService {
	public void test(String name) {
		System.out.println("hello " + name);
	}
}
