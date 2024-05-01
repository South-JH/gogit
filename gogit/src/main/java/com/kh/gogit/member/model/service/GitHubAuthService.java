package com.kh.gogit.member.model.service;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class GitHubAuthService {
	
	public String getGitHubAccessToken(String code) {
		
        String accessTokenUrl = "https://github.com/login/oauth/access_token";
        String clientId = "4f2d7f7f95a1e0e30876";
        String clientSecret = "ccf988e5f3d6789af646557a3ff3bd94343bce88";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
        body.add("client_id", clientId);
        body.add("client_secret", clientSecret);
        body.add("code", code);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(body, headers);

        ResponseEntity<String> response = restTemplate.postForEntity(accessTokenUrl, request, String.class);

		if (response.getStatusCode() == HttpStatus.OK) {
		    String responseBody = response.getBody();
		    String accessToken = responseBody.split("&")[0].split("=")[1];
		    
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
            return response.getBody();
        } else {
            // Handle error
            return null;
        }
    }

}
