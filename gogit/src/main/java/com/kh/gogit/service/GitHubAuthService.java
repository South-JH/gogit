package com.kh.gogit.service;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class GitHubAuthService {
	
	public String getGitHubAccessToken(String code) {
		
		System.out.println("githubAuthService");
		
        String accessTokenUrl = "https://github.com/login/oauth/access_token";
        String clientId = "71855b2ce527504bb9cf";
        String clientSecret = "6156f1b3157995ef400a9f3442104e92908d6d5d";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap();
        body.add("client_id", clientId);
        body.add("client_secret", clientSecret);
        body.add("code", code);
        

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(body, headers);

        ResponseEntity<String> response = restTemplate.postForEntity(accessTokenUrl, request, String.class);
        
		/*
		String responseBody = response.getBody();
		String accessToken = responseBody.split("&")[0].split("=")[1];
		
		System.out.println("responseBody : " + responseBody);
		System.out.println("accessToken : " + accessToken);
		*/

		if (response.getStatusCode() == HttpStatus.OK) {
		    String responseBody = response.getBody();
		    String accessToken = responseBody.split("&")[0].split("=")[1];
		    
		    System.out.println(accessToken);
		    return accessToken;
		} else {
		    // Handle error
		    return null;
		}
		
    }

    public String getGitHubUserInfo(String accessToken) {
        String userInfoUrl = "https://api.github.com/user";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(accessToken);

        HttpEntity<String> request = new HttpEntity<String>(headers);

        ResponseEntity<String> response = restTemplate.exchange(userInfoUrl, HttpMethod.GET, request, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
        	System.out.println(1);
        	System.out.println(response.getBody());
            return response.getBody();
        } else {
        	System.out.println(2);
            // Handle error
            return null;
        }
    }

}
