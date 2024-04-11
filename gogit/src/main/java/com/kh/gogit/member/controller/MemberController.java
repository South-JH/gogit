package com.kh.gogit.member.controller;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.kohsuke.github.GitHubRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {
	


	@RequestMapping("/callback")
	public String loginMember(String code,HttpSession session) throws IOException {
		
		

	
	
		return "main";
	}
	

}
