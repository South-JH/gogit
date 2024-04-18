package com.kh.gogit.repository.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.repository.model.service.RepositoryServiceImpl;
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
        	rp.setUpdateAt(repoArr.get(i).getAsJsonObject().get("updated_at").getAsString());
        	
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
		for(String str : git) {
			gitStr += str;
		}
		
		System.out.println(gitStr);
		
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
	public String repoDetailView(HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String repoList = rService.repositoryList(m);
		JsonArray repoArr = JsonParser.parseString(repoList).getAsJsonArray();
		
		rService.repoDetailView(m);
		
		return "repository/repositoryDetailView";
	}
	
}
