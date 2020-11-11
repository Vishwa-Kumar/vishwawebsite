package com.vishwa.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vishwa.model.ClientDetails;
import com.vishwa.model.Result;
import com.vishwa.service.EmailService;
import com.vishwa.service.VisitorService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FrontController {

	public String uname = "";
	public String password = "";

	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "/sendmail", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Result sendmail(@RequestBody ClientDetails clientDetails,
			HttpServletResponse httpServletResponse) {

		ObjectMapper Obj = new ObjectMapper();
		VisitorService visitorService = new VisitorService();
		Result res = null;
		String json = null;
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println("send mail called " + clientDetails.toString());
		try {
			emailService.sendMail("viskumdee@gmail.com", "visitor of vishwakumardeepak.com",
					Obj.writeValueAsString(clientDetails));

			res = visitorService.saveVisitorDetails(clientDetails);
			json = objectMapper.writeValueAsString(res);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			System.out.println("not able to save visitor details to db" + e.getLocalizedMessage());

		} catch (Exception e) {
			System.out.println("sendMail failed" + e.getLocalizedMessage());

		}

		return res;
	}

	@RequestMapping("/")
	String login(Model model) {
		System.out.println("index method");

		return "index";
	}

	@RequestMapping("/p")
	String welcome(Model model) {

		System.out.println();
		return "proposal";
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
