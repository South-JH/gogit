package com.kh.gogit.repository.model.service;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;

@Service
public class RepositoryServiceImpl implements RepositoryService {

	public String repositoryList(Member m) {
		
		String url = "https://api.github.com/user/repos?sort=created&direction=desc";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		//MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		//body.add("direction", "desc");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		//HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(body, headers);
		
		//ResponseEntity<String> response = restTemplate.postForEntity(url, headers, String.class);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String repoList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			repoList = response.getBody();
		} else {
			System.out.println("api 실패");
		}
		
		return repoList;
		
	}
	
	public String createRepo(Member m, String repoName, String repoDesc, String visibility, String readme) {
		
		boolean readmeBo, visibilityBo;
		String url = "https://api.github.com/user/repos";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		Map<String, Object> map = new HashMap<>();
        map.put("name", repoName); 
        map.put("description", repoDesc); 
		visibilityBo = visibility.equals("true") ? true : false;
        map.put("private", visibilityBo); 
        readmeBo = readme.equals("true") ? true : false;
        map.put("auto_init", readmeBo);
        
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(map, headers);
        
        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
        
        String createRepo = "";
        
        if (response.getStatusCode() == HttpStatus.CREATED) {
	   		 System.out.println("여기타냐?"); 
	   		 createRepo = response.getBody();
	   		 return createRepo; 
   		} else {
	   		 System.out.println("생성 실패"); 
	   		 return null; 
   		}
		
	}
	
	public String createGitignore(Member m, String repoName, String git) {
		
  		String url = "https://api.github.com/repos/" + m.getGitNick() + "/" + repoName + "/contents/.gitignore";
  		 
 		RestTemplate restTemplate = new RestTemplate();
		
 		HttpHeaders headers = new HttpHeaders();
 		headers.setContentType(MediaType.APPLICATION_JSON);
		
  		headers.set("Authorization", "Bearer " + m.getMemToken());
  		headers.set("Accept", "Accept: application/vnd.github+json");
  		 
  		String encodedContent = Base64.getEncoder().encodeToString(git.getBytes());
  		
  		Map<String, Object> committerMap = new HashMap<>();
  		committerMap.put("name", m.getGitNick());
  		committerMap.put("email", "null");
  		
  		Map<String, Object> map = new HashMap<>();
  		map.put("message", "gitignore 생성");
  		map.put("content", encodedContent);
  		map.put("committer", committerMap);
  		
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(map, headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PUT, request, String.class);
        
        System.out.println(response.getStatusCode());
        
        String createGit = "";
        
        if (response.getStatusCode() == HttpStatus.CREATED) {
	   		 //System.out.println("깃이그노어성공했냐?"); 
	   		 createGit = response.getBody();
	   		 return createGit; 
   		} else {
	   		 System.out.println("깃이그노어 생성 실패"); 
	   		 return null; 
   		}
  		
	}
	
	public String repoDetailView(Member m, String repoName) {
		
		String url = "https://api.github.com/repos/" + m.getGitNick() + "/" + repoName + "/contents/";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String repoContent = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			repoContent = response.getBody();
			//System.out.println(repoContent);
		} else {
			System.out.println("content 조회 실패");
		}
		
		return repoContent;
		
	}
	
	public String getSubContent(Member m, String repoName, String path) {
		
		String url = "https://api.github.com/repos/"+ m.getGitNick() + "/"+ repoName + "/contents/" + path;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String subContent = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			subContent = response.getBody();
			
	        JsonElement element = JsonParser.parseString(subContent);
	        if (element.isJsonObject()) {
	            JsonObject jsonObject = element.getAsJsonObject();
	            
	            // content 키가 있는지 확인
	            if (jsonObject.has("content")) {
	            	// content 값을 가져옴
	            	String content = jsonObject.get("content").getAsString();
	            	content = cleanBase64String(content);
	            	
	            	// Base64 유효성 검사
	            	if(isValidBase64(content)) {
	            		String decodedContent = decodeBase64(content);
	            		jsonObject.addProperty("content", decodedContent);
	            	} else {
	                    System.out.println("Invalid Base64 string: " + content);
	                }
	            }
	            subContent = jsonObject.toString(); 
	        }
			
		} else {
			System.out.println("content 조회 실패");
		}
		
		//System.out.println(subContent);
		return subContent;
		
	}
	
	private boolean isValidBase64(String str) {
		try {
	        Base64.getDecoder().decode(str.trim()); // 디코딩할 문자열의 앞뒤 공백을 제거하고 디코딩
	        return true;
	    } catch (IllegalArgumentException e) {
	        return false;
	    }
	}
	
	private String decodeBase64(String content) {
		
	    try {
	        byte[] decodedBytes = Base64.getDecoder().decode(content); // content 문자열을 디코딩하고 배열에 저장
	        return new String(decodedBytes); // 디코딩된 문자열을 바이트배열로 반환
	    } catch (IllegalArgumentException e) {
	        // Base64 디코딩 중 오류 발생 시, 예외 처리하여 오류 메시지를 출력
	        System.err.println("Base64 디코딩 오류: " + e.getMessage());
	        return null; // 또는 예외를 throw하여 호출자에게 전달
	    }
	}
	
    private String cleanBase64String(String base64) {
        base64 = base64.replaceAll("[^A-Za-z0-9+/=]", ""); // 대소문자, 알파벳, 숫자, +, \, =을 제외한 모든 문자를 찾아서 "" 빈문자열로 대체하여 제거
        int mod = base64.length() % 4; // base64 문자열의 길이를 4로 나눈 나머지 값 저장
        if (mod != 0) { // 나머지값이 0이 아니면, 그러니까 4배수가 아닌 경우 나머지값이 0일때까지 = 를 누적추가
            base64 += "=".repeat(4 - mod);
        }
        return base64;
    }
    
}
