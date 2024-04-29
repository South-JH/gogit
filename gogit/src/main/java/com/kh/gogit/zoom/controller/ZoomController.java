package com.kh.gogit.zoom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class ZoomController {

	@RequestMapping("zoom.me")
	public String zoomCreate() {
		return "project/zoomCreate";
	}

	@GetMapping("zoomCreate")
	public String zoomCreate(String code, Model model) {
		model.addAttribute("code", code);
		return "zoom/zoomCreate";
	}

	@ResponseBody
	@RequestMapping("zoomTest.zo")
	public String zoomCallback(String code) {

		String accessTokenUrl = "https://zoom.us/oauth/token";
		String clientId = "qpGjOpDZQ5OWjpuP4j8IQ";
		String clientSecret = "z7V1AQM3bhDCfetwNYperroOAoIOI4gn";

		RestTemplate restTemplate1 = new RestTemplate();

		HttpHeaders headers1 = new HttpHeaders();
		headers1.setBasicAuth(new Base64().encodeBase64String((clientId + ":" + clientSecret).getBytes()));

		MultiValueMap<String, String> body1 = new LinkedMultiValueMap<String, String>();
		body1.add("grant_type", "authorization_code");
		body1.add("code", code);
		body1.add("redirect_uri", "http://192.168.20.38:8052/gogit/zoomCreate");

		HttpEntity<MultiValueMap<String, String>> request1 = new HttpEntity<MultiValueMap<String, String>>(body1,
				headers1);

		ResponseEntity<String> response1 = restTemplate1.postForEntity(accessTokenUrl, request1, String.class);

		JsonObject responseBody = JsonParser.parseString(response1.getBody()).getAsJsonObject();

		String accessToken = responseBody.get("access_token").getAsString();

		
		return accessToken;
		 
	}
	
	@ResponseBody
	@RequestMapping(value="zoomMeeting.zo",produces="application/json; charset=utf-8")
	public ResponseEntity<String> zoomMeeting(String accessToken,String email,String title,String password) {
		  String requestUrl = "https://api.zoom.us/v2/users/"+email+"/meetings";
				 
		  RestTemplate restTemplate = new RestTemplate();
				 
		  HttpHeaders headers = new HttpHeaders(); headers.setBearerAuth(accessToken);
		  headers.add("content-type", "application/json");
				 
		  Map<String, String> body = new HashMap<String, String>();
		  body.put("agenda",title);
		  body.put("password", password);
				  
				 //MultiValueMap<String, String> body = new LinkedMultiValueMap<String,
				 //String>(); // body.add("agenda", "test-meeting");
				 
		  HttpEntity<Map<String, String>> request = new HttpEntity<Map<String,
		  String>>(body, headers);
				 
		  ResponseEntity<String> response = restTemplate.exchange(requestUrl,
		  HttpMethod.POST, request, String.class);
		
		  return response;
		  
	}
}
