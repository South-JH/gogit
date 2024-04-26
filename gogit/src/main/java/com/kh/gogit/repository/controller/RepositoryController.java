package com.kh.gogit.repository.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.repository.model.service.RepositoryServiceImpl;
import com.kh.gogit.repository.model.vo.Branch;
import com.kh.gogit.repository.model.vo.Repository;

@Controller
public class RepositoryController {
	
	@Autowired
	private RepositoryServiceImpl rService;

	@RequestMapping("list.rp")
	public String repositoryList(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String repoList = rService.repositoryList(m);
		
        JsonArray repoArr = JsonParser.parseString(repoList).getAsJsonArray();
        //System.out.println(repoArr.get(0).getAsJsonObject().get("owner").getAsJsonObject().get("login").getAsString());
        
        ArrayList<Repository> rpList = new ArrayList<Repository>();
        
        for(int i=0; i<repoArr.size(); i++) {
        	JsonObject repoObj = repoArr.get(i).getAsJsonObject();
        	
        	Repository rp = new Repository();
        	rp.setRepoTitle(repoArr.get(i).getAsJsonObject().get("name").getAsString());
        	
            JsonElement descriptionElement = repoObj.get("description");
            if (descriptionElement == null || descriptionElement.isJsonNull()) {
                rp.setRepoContent("");
            } else {
                rp.setRepoContent(descriptionElement.getAsString());
            }
            
        	rp.setVisibility(repoArr.get(i).getAsJsonObject().get("visibility").getAsString());
        	
        	JsonElement languageElement = repoObj.get("language");
        	if (languageElement == null || languageElement.isJsonNull()) {
                rp.setLanguage("");
            } else {
                rp.setLanguage(languageElement.getAsString());
            }
        	
        	rp.setStargazers(repoArr.get(i).getAsJsonObject().get("stargazers_count").getAsString());
        	rp.setFork(repoArr.get(i).getAsJsonObject().get("forks_count").getAsString());
        	rp.setOpenIssue(repoArr.get(i).getAsJsonObject().get("open_issues_count").getAsString());
        	rp.setUpdateAt(repoArr.get(i).getAsJsonObject().get("updated_at").getAsString().substring(0, 10));
        	rp.setOwner(repoArr.get(i).getAsJsonObject().get("owner").getAsJsonObject().get("login").getAsString());
        	rp.setPermission(repoArr.get(i).getAsJsonObject().get("permissions").getAsJsonObject().get("push").getAsString());
        	
        	rpList.add(rp);
        }
        //System.out.println(rpList);
		model.addAttribute("rpList", rpList);
		model.addAttribute("repoList", repoList);
        
		return "repository/repositoryList";
	}
	
	@RequestMapping("enrollForm.rp")
	public String repoEnrollForm(Model model) throws IOException {
		
		/* gitignore API */
		String url ="https://www.toptal.com/developers/gitignore/api/list?format=json";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String gitName = "";
		String line;
		
		while ((line = br.readLine()) != null) {
			gitName += line;
		}
		
		br.close();
		
		JsonObject totalObj = JsonParser.parseString(gitName).getAsJsonObject();
		
		model.addAttribute("gitName", totalObj);
		
		return "repository/repositoryEnrollForm";
	}
	
	@RequestMapping("create.rp")
	public String createRepo(HttpSession session, String repoName, String repoDesc, String visibility, String readme, String[] git) {
		
		String gitStr = "";
		if(git != null) {
			for(String str : git) {
				gitStr += str;
			}
		}
		
		//System.out.println(gitStr);
		
		if(readme == null) {
			readme = "false";
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		String createRepo = rService.createRepo(m, repoName, repoDesc, visibility, readme);

		if(createRepo != null) {
			
			String createGit = rService.createGitignore(m, repoName, gitStr);
			
			if(createGit != null) {
				session.setAttribute("alertMsg", "레파지토리를 생성했습니다");
				return "redirect:list.rp";
			} else {
				System.out.println("깃이그노어 생성 실패");
				return null;
			}
		} else {
			System.out.println("레파지토리 생성 실패");
			return null;
		}
	}
	
	@RequestMapping("detail.rp")
	public String repoDetailView(Model model, HttpSession session, String repoName, String visibility, String owner, String permission) {
		
		Member m = (Member)session.getAttribute("loginUser");
		//System.out.println(repoName);
		String repoContent = rService.repoDetailView(m, repoName, owner);
		
		if(repoContent != null) {
			JsonArray repoArr = JsonParser.parseString(repoContent).getAsJsonArray();
			ArrayList<Repository> rpList = new ArrayList<Repository>();
			
			for(int i=0; i<repoArr.size(); i++) {
				
				Repository rp = new Repository();
				
				rp.setContentName(repoArr.get(i).getAsJsonObject().get("name").getAsString());
				rp.setSha(repoArr.get(i).getAsJsonObject().get("sha").getAsString());
				rp.setType(repoArr.get(i).getAsJsonObject().get("type").getAsString());
				rp.setPath(repoArr.get(i).getAsJsonObject().get("path").getAsString());
				//System.out.println(repoArr.get(i).getAsJsonObject().get("type").getAsString());
				rpList.add(rp);
			}
			
			model.addAttribute("rpList", rpList);
			
		} else {
			System.out.println("컨텐츠없음!");
		}
        
		model.addAttribute("repoName", repoName);
		model.addAttribute("visibility", visibility);
		model.addAttribute("owner", owner);
		model.addAttribute("permission", permission);
		//System.out.println(permission);
		
		ArrayList<Repository> list = new ArrayList<Repository>();
		if(permission.equals("true")) {
			
			String collaboratorList = rService.collaboratorList(m, repoName, owner);
			
			JsonArray colArr = JsonParser.parseString(collaboratorList).getAsJsonArray();
			
			if(collaboratorList != null) {
				
				for(int i=0; i<colArr.size(); i++) {
					
					Repository rp = new Repository();
					rp.setCollaborator(colArr.get(i).getAsJsonObject().get("login").getAsString());
					rp.setAvatar(colArr.get(i).getAsJsonObject().get("avatar_url").getAsString());
					
					list.add(rp);
					//System.out.println(list);
				}
			} else {
				System.out.println("협업자없음!");
				return null;
			}
		}

        model.addAttribute("list", list);
        
		return "repository/repositoryDetailView";
	}
	
	@RequestMapping(value="selectContent.rp", produces="application/json; charset=UTF-8")
	public void getSubContent(HttpServletResponse response, HttpSession session, String repoName, String path, String owner, String repoType) throws JsonIOException, IOException {
		//System.out.println(owner);
		//System.out.println(repoType);
		Member m = (Member)session.getAttribute("loginUser");
		String subContent = rService.getSubContent(m, repoName, path, owner);
		
		if("file".equals(repoType)) {
			
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(subContent);
			
		} else {
		
			JsonElement element = JsonParser.parseString(subContent);
			ArrayList<Repository> rpList = new ArrayList<Repository>();
			
			if(element.isJsonArray()) {
				// 데이터가 배열인 경우, 배열로 처리
				
				JsonArray repoArr = JsonParser.parseString(subContent).getAsJsonArray();
				
				for(int i=0; i<repoArr.size(); i++) {
					
					Repository rp = new Repository();
					populateSubContent(repoArr.get(i).getAsJsonObject(), rp);
			        rpList.add(rp);
					
				}
				
			} else if(element.isJsonObject()) {
				// 데이터가 객체인 경우, 객체로 처리
				
				Repository rp = new Repository();
				populateSubContent(element.getAsJsonObject(), rp);
			    rpList.add(rp);
				
			} else {
				System.out.println("객체도 배열도 아니면 뭐냐");
			}
	        
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			map.put("repoName", repoName);
			map.put("rpList", rpList);
			
			response.setContentType("application/json; charset=utf-8");
			
			new Gson().toJson(map, response.getWriter());
			
		}
		
	}
	
	public void populateSubContent(JsonObject repoObj, Repository rp) {
		
		/*
		rp.setContentName(repoArr.get(i).getAsJsonObject().get("name").getAsString());
		rp.setSha(repoArr.get(i).getAsJsonObject().get("sha").getAsString());
		rp.setType(repoArr.get(i).getAsJsonObject().get("type").getAsString());
		rp.setPath(repoArr.get(i).getAsJsonObject().get("path").getAsString());
		
		// JsonObject repoObj = repoArr.get(i).getAsJsonObject();
		JsonElement contentElement = repoObj.get("content");
		if (contentElement == null || contentElement.isJsonNull()) {
			rp.setContentDesc("");
		} else {
			rp.setContentDesc(contentElement.getAsString());
		}
		*/
		
	    rp.setContentName(repoObj.get("name").getAsString());
	    rp.setSha(repoObj.get("sha").getAsString());
	    rp.setType(repoObj.get("type").getAsString());
	    rp.setPath(repoObj.get("path").getAsString());
	    
	    JsonElement contentElement = repoObj.get("content");
	    //System.out.println(contentElement);
	    if(contentElement != null) {
	    	rp.setContentDesc(contentElement.isJsonNull() ? "" : contentElement.getAsString());
	    } else {
	    	rp.setContentDesc(null);
	    }
	    
	}
	
	@RequestMapping("delete.rp")
	public ResponseEntity<?> deleteRepo(HttpSession session, String repoName) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
    	String url = "https://api.github.com/repos/" + m.getGitNick() + "/" + repoName;
    	
    	RestTemplate restTemplate = new RestTemplate();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    	
    	headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		/*
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.DELETE, request, String.class);
		
		String responseCode = "";
		if(response.getStatusCode() == HttpStatus.NO_CONTENT) {
			
		} else {
			System.out.println("api 실패");
		}
		*/
	    try {
	        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.DELETE, request, String.class);

	        if (response.getStatusCode() == HttpStatus.NO_CONTENT) {
	        	return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	        } else {
	            // 삭제 실패 처리
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{\"error\":\"Failed to delete repository\"}");
	        }
	    } catch (Exception e) {
	        System.out.println("API 실패: " + e.getMessage());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("{\"error\":\"Server error occurred\"}");
	    }
	}
	
	@RequestMapping(value="invite.rp", produces = "application/json; charset=UTF-8")
	public void inviteCollaborator(HttpSession session, HttpServletResponse response, String cbName, String repoName) throws IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		String searchCollaborator = rService.serarchCollaborator(m, cbName);
		
		JsonObject searchObj = JsonParser.parseString(searchCollaborator).getAsJsonObject();
		//System.out.println(cbObj.get("total_count").getAsString());
		
		String count = searchObj.get("total_count").getAsString();
		response.setContentType("application/json; charset=utf-8");
		
		if(!count.equals("0")) {
			
			String collaborator = rService.inviteCollaborator(m, cbName, repoName);
			//JsonObject cbObj = JsonParser.parseString(collaborator).getAsJsonObject(); 당장 가져올 값이 없음... 필요하면 그때 세팅해주자
			if(collaborator != null) {
				response.setStatus(HttpServletResponse.SC_OK);
	            response.getWriter().write(cbName + "님에게 초대 요청을 보냈습니다.");
			} else {
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("초대에 실패했습니다.");
	        }
			
		} else {
		    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		    response.getWriter().write("사용자가 존재하지 않습니다.");
		}
		
	}
	
	@RequestMapping(value="update.rp", produces = "application/json; charset=utf-8")
	public String updateRepository(HttpServletResponse response, HttpSession session, String repoName, String repoRename, String repoContent, String visibility) throws IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		response.setContentType("application/json; charset=utf-8");
		
		String updateRepo = rService.updateRepository(m, repoName, repoRename, repoContent, visibility);
		
		if(updateRepo != null) {
			session.setAttribute("alertMsg", "레파지토리 수정 완");
			return "redirect:list.rp";
		} else {
			session.setAttribute("alertMsg", "레파지토리 수정 실패...");
			return "redirect:list.rp";
		}
		
	}
	
	@RequestMapping("listBranches.rp")
	public void getBranchesList(HttpSession session, HttpServletResponse response, String repoName, String owner) throws IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		String branches = rService.getBranchesList(m, repoName, owner);
		
		JsonArray branchArr = JsonParser.parseString(branches).getAsJsonArray();
		ArrayList<Branch> branch = new ArrayList<Branch>();
			
		for(int i=0; i<branchArr.size(); i++) {
			//System.out.println(branchArr.get(i).getAsJsonObject().get("name").toString().replaceAll("\"", "").trim());
			Branch b = new Branch();
			b.setBranchName(branchArr.get(i).getAsJsonObject().get("name").toString().replaceAll("\"", "").trim());
			b.setCommitSha(branchArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("sha").toString().replaceAll("\"", "").trim());
		
			branch.add(b);
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(new Gson().toJson(branch));
		
	}
	
	@RequestMapping("typeList.rp")
	public void typeRepoList(HttpSession session, HttpServletResponse response, String type) throws JsonIOException, IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		String typeRepo = rService.typeRepoList(m, type);
		
		JsonArray repoArr = JsonParser.parseString(typeRepo).getAsJsonArray();
		ArrayList<Repository> rpList = new ArrayList<Repository>();
		
		if(typeRepo != null) {
			
	        for(int i=0; i<repoArr.size(); i++) {
	        	JsonObject repoObj = repoArr.get(i).getAsJsonObject();
	        	
	        	Repository rp = new Repository();
	        	rp.setRepoTitle(repoArr.get(i).getAsJsonObject().get("name").getAsString());
	        	
	            JsonElement descriptionElement = repoObj.get("description");
	            if (descriptionElement == null || descriptionElement.isJsonNull()) {
	                rp.setRepoContent("");
	            } else {
	                rp.setRepoContent(descriptionElement.getAsString());
	            }
	            
	        	rp.setVisibility(repoArr.get(i).getAsJsonObject().get("visibility").getAsString());
	        	
	        	JsonElement languageElement = repoObj.get("language");
	        	if (languageElement == null || languageElement.isJsonNull()) {
	                rp.setLanguage("");
	            } else {
	                rp.setLanguage(languageElement.getAsString());
	            }
	        	
	        	rp.setStargazers(repoArr.get(i).getAsJsonObject().get("stargazers_count").getAsString());
	        	rp.setFork(repoArr.get(i).getAsJsonObject().get("forks_count").getAsString());
	        	rp.setOpenIssue(repoArr.get(i).getAsJsonObject().get("open_issues_count").getAsString());
	        	rp.setUpdateAt(repoArr.get(i).getAsJsonObject().get("updated_at").getAsString().substring(0, 10));
	        	rp.setOwner(repoArr.get(i).getAsJsonObject().get("owner").getAsJsonObject().get("login").getAsString());
	        	rp.setPermission(repoArr.get(i).getAsJsonObject().get("permissions").getAsJsonObject().get("push").getAsString());
	        	
	        	rpList.add(rp);
	        }
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(rpList, response.getWriter());
		
	}
	
	@RequestMapping("brnachContent.rp")
	public void branchContent(HttpSession session, HttpServletResponse response, String repoName, String owner, String branch) throws JsonIOException, IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		String bContent = rService.branchContent(m, repoName, owner, branch);
		
		ArrayList<Repository> list = new ArrayList<Repository>();
		if(bContent != null) {
			
			JsonArray repoArr = JsonParser.parseString(bContent).getAsJsonArray();
			
			for(int i=0; i<repoArr.size(); i++) {
				
				Repository rp = new Repository();
				
				rp.setContentName(repoArr.get(i).getAsJsonObject().get("name").getAsString());
				rp.setSha(repoArr.get(i).getAsJsonObject().get("sha").getAsString());
				rp.setType(repoArr.get(i).getAsJsonObject().get("type").getAsString());
				rp.setPath(repoArr.get(i).getAsJsonObject().get("path").getAsString());
				list.add(rp);
			}
			
		} else {
			System.out.println("컨텐츠없음!");
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
	}
	
}
