package com.kh.gogit.commit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.commit.model.service.CommitServiceImpl;
import com.kh.gogit.commit.model.vo.Commit;
import com.kh.gogit.member.model.vo.Member;

@Controller
public class CommitController {
	
	@Autowired
	private CommitServiceImpl cService;

	@RequestMapping("view.cm")
	public String commitListView(Model model, String repoName, String owner, String visibility) {
		model.addAttribute("repoName", repoName);
		model.addAttribute("owner", owner);
		model.addAttribute("visibility", visibility);
		return "commit/commitList";
	}
	
	@RequestMapping("list.cm")
	public void getCommitList(HttpSession session, HttpServletResponse response, String repoName, String owner) throws JsonIOException, IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		String commitList = cService.getCommitList(m, repoName, owner);
		
		ArrayList<Commit> cList = new ArrayList<Commit>();
		
		if(commitList != null) {
			
			JsonArray commitArr = JsonParser.parseString(commitList).getAsJsonArray();
			
			for(int i=0; i<commitArr.size(); i++) {
				
				Commit commit = new Commit();
		        commit.setSah(commitArr.get(i).getAsJsonObject().get("sha").getAsString());
		        commit.setCommitDate(commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("author").getAsJsonObject().get("date").getAsString().substring(0, 10));
				commit.setAuthor(commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("author").getAsJsonObject().get("name").getAsString());
		        commit.setMessage(commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("message").getAsString());
				
	            JsonElement authorEl = commitArr.get(i).getAsJsonObject().get("author");
	            if (authorEl == null || authorEl.isJsonNull()) {
	                commit.setAvatarUrl("");
	            } else {
	            	commit.setAvatarUrl(commitArr.get(i).getAsJsonObject().get("author").getAsJsonObject().get("avatar_url").getAsString());
	            }
		        
		        cList.add(commit);
			}
			
		} else {
			System.out.println("조회된 커밋리스트 없음");
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(cList, response.getWriter());
		
	}
	
	@RequestMapping("branch.cm")
	public void branchCommitList(HttpSession session, HttpServletResponse response, String repoName, String owner, String branches) throws JsonIOException, IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		String commitList = cService.branchCommitList(m, repoName, owner, branches);
		
		JsonArray commitArr = JsonParser.parseString(commitList).getAsJsonArray();
		ArrayList<Commit> cList = new ArrayList<Commit>();
		
		if(commitList != null) {
			
			for(int i=0; i<commitArr.size(); i++) {
				
				Commit commit = new Commit();
		        commit.setSah(commitArr.get(i).getAsJsonObject().get("sha").getAsString());
		        commit.setCommitDate(commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("author").getAsJsonObject().get("date").getAsString().substring(0, 10));
				commit.setAuthor(commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("author").getAsJsonObject().get("name").getAsString());
		        commit.setMessage(commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("message").getAsString());
				
	            JsonElement authorEl = commitArr.get(i).getAsJsonObject().get("author");
	            if (authorEl == null || authorEl.isJsonNull()) {
	                commit.setAvatarUrl("");
	            } else {
	            	commit.setAvatarUrl(commitArr.get(i).getAsJsonObject().get("author").getAsJsonObject().get("avatar_url").getAsString());
	            }
		        
		        cList.add(commit);
			}
			
		} else {
			System.out.println("조회된 커밋리스트 없음");
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(cList, response.getWriter());
		
	}
	
}
