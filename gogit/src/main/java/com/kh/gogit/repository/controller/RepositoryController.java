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
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream())); // 기반스트림을 가지고 보조스트림 만들어주기
		
		String gitignore = "";
		String line;
		
		while((line = br.readLine()) != null) {
			gitignore += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
//		JsonArray gitignoreArr = JsonParser.parseString(gitignore).getAsJsonArray();
		
//		System.out.println(gitignore);
		
		model.addAttribute("gitignore", gitignore);
		
		return "repository/repositoryEnrollForm";
	}
	
	@RequestMapping("create.rp")
	public void createRepo(HttpSession session, String repoName, String repoDesc, String visibility, String readme) {
		/*
		System.out.println(repoName);
		System.out.println(repoDesc);
		System.out.println(visibility);
		System.out.println(readme);
		*/
		if(readme == null) {
			readme = "true";
		}
		
		//System.out.println(readme);
		
		Member m = (Member)session.getAttribute("loginUser");
		String createRepo = rService.createRepo(m, repoName, repoDesc, visibility, readme);
		System.out.println("여기왔냐?"+createRepo);
		
		/*
		JsonObject repoObj = JsonParser.parseString(createRepo).getAsJsonObject();
		System.out.println(repoObj.getAsJsonObject().get("name").getAsString());
		*/
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
