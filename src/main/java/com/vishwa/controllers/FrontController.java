package com.vishwa.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vishwa.service.EmailService;

@Controller
public class FrontController {

	public String uname = "";
	public String password = "";
	
	
	@Autowired
    private EmailService emailService;

	@RequestMapping("/sendmail")
    public String sendmail() {
		System.out.println("send mail called");
        emailService.sendMail("viskumdee@gmail.com", "Test Subject", "Test mail");

        return "emailsent";
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
