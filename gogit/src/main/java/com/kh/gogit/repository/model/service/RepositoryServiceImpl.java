package com.kh.gogit.repository.model.service;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPatch;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
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
	
	public String repoDetailView(Member m, String repoName, String owner) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/contents/";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		/*
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String repoContent = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			repoContent = response.getBody();
			//System.out.println(repoContent);
			return repoContent;
		} else {
			System.out.println("content 조회 실패");
			return null;
		}
		*/
		
	    try {
	        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
	        if (response.getStatusCode() == HttpStatus.OK && response.hasBody() && !response.getBody().isEmpty()) { // 상태코드가 200이고 데이터가 있으면
	            return response.getBody();  
	        } else if (response.getStatusCode() == HttpStatus.NO_CONTENT || response.getBody().isEmpty()) { // 데이터가 없으면
	            return null;
	        } else { // 그외에
	            return null;
	        }
	    } catch (HttpClientErrorException ex) {
	        if (ex.getStatusCode() == HttpStatus.NOT_FOUND) {
//	            System.err.println("저장소 또는 리소스를 찾을 수 없습니다: " + ex.getResponseBodyAsString());
	        	System.out.println("레파지토리 컨텐츠 없음!");
	        } else {
//	            System.err.println("클라이언트 오류: " + ex.getStatusCode() + " " + ex.getResponseBodyAsString());
	        	System.out.println("뭔가가 오류났음!");
	        }
	        return null;
	    }
	}
	
	public String getSubContent(Member m, String repoName, String path, String owner) {
		
		String url = "https://api.github.com/repos/"+ owner + "/"+ repoName + "/contents/" + path;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github.html+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String subContent = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			//System.out.println(response.getBody());
			subContent = response.getBody();
			return subContent;
		} else {
			System.out.println("콘텐츠 못가져왔다");
			return null;
		}
		/*
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
		*/
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
    
    public String collaboratorList(Member m, String repoName, String owner) {
    	
    	String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/collaborators";
    	
    	RestTemplate restTemplate = new RestTemplate();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    	headers.add("Accept", "application/vnd.github+json");
    	headers.add("Authorization", "Bearer " + m.getMemToken());
    	
		HttpEntity<String> request = new HttpEntity<String>(headers);		
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET , request, String.class);
		
		String collaboratorList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			//System.out.println(response.getBody());
			collaboratorList = response.getBody();
			return collaboratorList;
		}else {
			System.out.println("협력자 검색 실패");
			return null;
		}
    	
    }
    
    public String serarchCollaborator(Member m, String cbName) {
    	
    	String url = "https://api.github.com/search/users?q=" + cbName;
    	
    	RestTemplate restTemplate = new RestTemplate();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    	headers.add("Accept", "application/vnd.github+json");
    	headers.add("Authorization", "Bearer " + m.getMemToken());
    	
		HttpEntity<String> request = new HttpEntity<String>(headers);		
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET , request, String.class);
		
		String searchCollaborator = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			searchCollaborator = response.getBody();
			//System.out.println(searchCollaborator);
		}else {
			System.out.println("협력자 검색 실패");
		}
		
		return searchCollaborator;
    }
    
    public String inviteCollaborator(Member m, String cbName, String repoName) {
    	
    	String url = "https://api.github.com/repos/" + m.getGitNick() + "/" + repoName + "/collaborators/" + cbName;
    	
    	RestTemplate restTemplate = new RestTemplate();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    	headers.add("Accept", "application/vnd.github+json");
    	headers.add("Authorization", "Bearer " + m.getMemToken());
    	
    	HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PUT, request, String.class);
		
		String collaborator = "";
		if(response.getStatusCode() == HttpStatus.CREATED) {
			collaborator = response.getBody();
			//System.out.println(collaborator);
		} else {
			System.out.println("협력자 추가 실패");
		}
		
		return collaborator;
    }
	
	/* 
	 * MultiValueMap과 Map
	 * 둘다 키-값으로 저장
	 * 
	 * Map은
	 * 하나의 키에 하나의 값만 저장
	 * 순서대로 저장되지 않음
	 * 
	 * MultiValueMap은
	 * 하나의 키에 여러개의 값 저장
	 * 저장한 순서를 보장
	 * 스프링프레임워크에서 제공하는 메서드
	*/
    
    public String updateRepository(Member m, String repoName, String repoRename, String repoContent, String visibility) {
        String url = "https://api.github.com/repos/" + m.getGitNick() + "/" + repoName;
        boolean visibilityBo;
        String updateRepo = "";

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPatch httpPatch = new HttpPatch(url);
            
            httpPatch.setHeader(HttpHeaders.CONTENT_TYPE, ContentType.APPLICATION_JSON.toString());
            httpPatch.setHeader(HttpHeaders.ACCEPT, "application/vnd.github+json");
            httpPatch.setHeader(HttpHeaders.AUTHORIZATION, "Bearer " + m.getMemToken());

            JSONObject obj = new JSONObject();
            obj.put("name", repoRename);
            obj.put("description", repoContent);
            visibilityBo = visibility.equals("private") ? true : false;
            obj.put("private", visibilityBo);

            StringEntity requestEntity = new StringEntity(obj.toString(), ContentType.APPLICATION_JSON);
            httpPatch.setEntity(requestEntity);

            CloseableHttpResponse response = httpClient.execute(httpPatch);
            
            updateRepo = EntityUtils.toString(response.getEntity());
            if (response.getStatusLine().getStatusCode() == HttpStatus.OK.value()) {
                //System.out.println("업데이트 성공: " + updateRepo);
            } else {
                System.out.println("업데이트 실패");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return updateRepo;
    }
    
    public String getBranchesList(Member m, String repoName, String owner) {
    	
    	String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/branches";
    	
    	RestTemplate restTemplate = new RestTemplate();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    	headers.add("Accept", "application/vnd.github+json");
    	headers.add("Authorization", "Bearer " + m.getMemToken());
    	
    	HttpEntity<String> request = new HttpEntity<String>(headers);
    	ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
    	
    	String branches = "";
    	if(response.getStatusCode() == HttpStatus.OK) {
    		branches = response.getBody();
    		//System.out.println(branches);
    	} else {
    		System.out.println("실패~");
    	}
    			
    	return branches;
    }
    
    public String typeRepoList(Member m, String type) {
    	
    	String url = "https://api.github.com/user/repos?sort=created&direction=desc&visibility=" + type;
    	RestTemplate restTemplate = new RestTemplate();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    	headers.add("Authorization", "Bearer " + m.getMemToken());
    	headers.add("Accept", "application/vnd.github-json");
    	
    	HttpEntity<String> request = new HttpEntity<String>(headers);
    	ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
    	
    	String typeRepo = "";
    	if(response.getStatusCode() == HttpStatus.OK) {
    		typeRepo = response.getBody();
    		//System.out.println(typeRepo);
    		return typeRepo;
    	} else {
    		System.out.println("타입별 레파지토리 조회 실패");
    		return null;
    	}
    	
    }
    
    
    
    
    
    
    
    
    
    
    
}
