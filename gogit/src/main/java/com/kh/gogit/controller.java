package com.kh.gogit;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.service.GitHubAuthService;

@Controller
public class controller {

	@RequestMapping("main")
	public String main() {
		return "main";
	}
	
	@GetMapping("/zoom/callback")
	public void zoomCallback(@RequestParam("code") String code, HttpSession session) {
		System.out.println(code);
		
		String accessTokenUrl = "https://zoom.us/oauth/token";
		String clientId = "XOgW7jAmRtiAvKC4QUqTlQ";
		String clientSecret = "58FEoHlgcmO4wlgzeUemmMl6Qx1N8vpN";
		
		RestTemplate restTemplate1 = new RestTemplate();
		
		HttpHeaders headers1 = new HttpHeaders();
		headers1.setBasicAuth(new Base64().encodeBase64String((clientId + ":" + clientSecret).getBytes()));
		
		MultiValueMap<String, String> body1 = new LinkedMultiValueMap<String, String>();
		body1.add("grant_type", "authorization_code");
		body1.add("code", code);
		body1.add("redirect_uri", "http://localhost:8052/gogit/zoom/callback");
		
		HttpEntity<MultiValueMap<String, String>> request1 = new HttpEntity<MultiValueMap<String,String>>(body1, headers1);
		
		ResponseEntity<String> response1 = restTemplate1.postForEntity(accessTokenUrl, request1, String.class);
		
		System.out.println(response1.getBody());
		
		JsonObject responseBody = JsonParser.parseString(response1.getBody()).getAsJsonObject();
		
		String accessToken = responseBody.get("access_token").getAsString();
		
		System.out.println(accessToken);
		
//		=========================================================================================
		
		String requestUrl = "https://api.zoom.us/v2/users/works.jhnam@gmail.com/meetings";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(accessToken);
		headers.add("content-type", "application/json");
		
		Map<String, String> body = new HashMap<String, String>();
		body.put("agenda", "test-meeting");
		
//		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
//		body.add("agenda", "test-meeting");
		
		HttpEntity<Map<String, String>> request = new HttpEntity<>(body, headers);
		
		ResponseEntity<String> response = restTemplate.exchange(requestUrl, HttpMethod.POST, request, String.class);
		
		System.out.println(response.getBody());
		
	}
	
}
