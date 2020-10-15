package com.vishwa.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vishwa.dao.DocDbDao;
import com.vishwa.model.ClientDetails;
import com.vishwa.service.EmailService;

@Controller
public class FrontController {

	public String uname = "";
	public String password = "";

	@Autowired
	private EmailService emailService;

	private DocDbDao docDbDao = new DocDbDao();

	@RequestMapping(value = "/sendmail", method = RequestMethod.POST, consumes = "application/json")

	public String sendmail(@RequestBody ClientDetails clientDetails) {

		ObjectMapper Obj = new ObjectMapper();
		System.out.println("send mail called " + clientDetails.toString());
		try {
			emailService.sendMail("viskumdee@gmail.com", "visitor of vishwakumardeepak.com",
					Obj.writeValueAsString(clientDetails));
			try {
				docDbDao.createTodoItem(clientDetails);
			} catch (Exception e1) {
				System.out.println("not able to save to db" + e1.getLocalizedMessage());
			}
		}

		catch (Exception e) {
			System.out.println("sendMail failed" + e.getLocalizedMessage());

		}
		return "true";
	}

	@RequestMapping("/")
	String login(Model model) {
		System.out.println("index method");

		return "index";
	}

	@RequestMapping("/hi")
	String welcome(@RequestParam String username, @RequestParam String pass) {

		return "home";
	}

	@RequestMapping("/logout")
	String logout() {
		System.out.println("logout called method");
		uname = "";
		password = "";
		return "login";
	}

	@RequestMapping(value = "/ValidateLogin", method = RequestMethod.POST)
	public String method(HttpServletResponse httpServletResponse) {
		httpServletResponse.setHeader("Location", "http://localhost:8080/p");
		httpServletResponse.setStatus(302);
		return "true";
	}

}
