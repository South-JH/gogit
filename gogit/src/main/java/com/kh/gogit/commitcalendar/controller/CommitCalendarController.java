package com.kh.gogit.commitcalendar.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.commitcalendar.model.service.CommitCalServiceImpl;
import com.kh.gogit.commitcalendar.model.vo.CommitCal;
import com.kh.gogit.member.model.vo.Member;

@Controller
public class CommitCalendarController {
	
	@Autowired
	private CommitCalServiceImpl cService;
	
	@RequestMapping("commitcl.cl")
	public String commitcal(HttpSession session, Model model) {
		Member m = (Member) session.getAttribute("loginUser");

		int count = 0;
	    // cService.repositoryList 메서드는 페이지 번호를 인자로 받아 해당 페이지의 커밋 리스트를 가져오는 메서드입니다.
	    String repoList = cService.repositoryList(m);
		JsonArray repoArr = JsonParser.parseString(repoList).getAsJsonArray();
		
		ArrayList<CommitCal> rpList = new ArrayList<CommitCal>();
		
		for(int i =0; i<repoArr.size(); i++) {
			CommitCal rp = new CommitCal();
			JsonObject repoObj = repoArr.get(i).getAsJsonObject();
			rp.setRepoName(repoArr.get(i).getAsJsonObject().get("name").getAsString());
			rp.setOwner(repoArr.get(i).getAsJsonObject().get("owner").getAsJsonObject().get("login").getAsString());
			
			rpList.add(rp);
		}
		String firstRepoName = (repoArr.get(0).getAsJsonObject().get("name").getAsString());
		String firstOwner = (repoArr.get(0).getAsJsonObject().get("owner").getAsJsonObject().get("login").getAsString());
		
		String commitFirst = "";
		
		for (int i = 1; i <= 5; i++) {
		    // cService.repositoryList 메서드는 페이지 번호를 인자로 받아 해당 페이지의 커밋 리스트를 가져오는 메서드입니다.
		    String pageData = cService.commitFirstList(m,firstOwner,firstRepoName, i);
		    // 페이지 데이터를 repoList에 추가

		    
		    if(pageData.length() == 2) {
		    	break;
		    }
		    if (i == 1) {
		    	commitFirst += pageData.substring(0, pageData.length()-1)+",";
		    } else if (i == 5) {
		    	commitFirst += pageData.substring(1); 
		    } else {
		    	commitFirst += pageData.substring(1, pageData.length()-1)+",";	    	
		    }
		}
		
		if(commitFirst.endsWith(",")) {
			commitFirst = commitFirst.substring(0, commitFirst.length() - 1) + "]";
		}
		
		JsonArray commitArr = JsonParser.parseString(commitFirst).getAsJsonArray();
		String[] commitObj = new String[commitArr.size()];
		for(int i=0; i<commitArr.size(); i++) {
			CommitCal cr = new CommitCal();
			//commitObj = commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("committer").getAsJsonObject().get("date").getAsString();
			String date = commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("committer").getAsJsonObject().get("date").getAsString();
			commitObj[i] = date; // 배열에 0번째에는 commitArr의 0번째의 값이 들어갈꺼임
		}
		
		String[] commitmesObj = new String[commitArr.size()];
		for(int i=0; i<commitArr.size(); i++) {
			CommitCal cr = new CommitCal();
			String message = commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("message").getAsString().replace("\n", "");
			commitmesObj[i] = message; // 배열에 0번째에는 commitArr의 0번째의 값이 들어갈꺼임				
		}
		model.addAttribute("rpList", rpList)
		     .addAttribute("commitObj", Arrays.toString(commitObj))
		     .addAttribute("commitmesObj", Arrays.toString(commitmesObj));
		return "commitcalendar/commitcal";
	}	
	
	@RequestMapping("commitcal.cl")
	public String commitcalOther(HttpSession session, Model model, String owner, String repoName) {
		Member m = (Member) session.getAttribute("loginUser");

	    String repoList = cService.repositoryList(m);
		JsonArray repoArr = JsonParser.parseString(repoList).getAsJsonArray();
		
		ArrayList<CommitCal> rpList = new ArrayList<CommitCal>();
		
		for(int i =0; i<repoArr.size(); i++) {
			CommitCal rp = new CommitCal();
			JsonObject repoObj = repoArr.get(i).getAsJsonObject();
			rp.setRepoName(repoArr.get(i).getAsJsonObject().get("name").getAsString());
			rp.setOwner(repoArr.get(i).getAsJsonObject().get("owner").getAsJsonObject().get("login").getAsString());
			
			rpList.add(rp);
		}
		
		String commitFirst = "";
		
		for (int i = 1; i <= 5; i++) {
		    // cService.repositoryList 메서드는 페이지 번호를 인자로 받아 해당 페이지의 커밋 리스트를 가져오는 메서드입니다.
		    String pageData = cService.commitFirstList(m,owner,repoName, i);
		    // 페이지 데이터를 repoList에 추가

		    
		    if(pageData.length() == 2) {
		    	break;
		    }
		    if (i == 1) {
		    	commitFirst += pageData.substring(0, pageData.length()-1)+",";
		    } else if (i == 5) {
		    	commitFirst += pageData.substring(1); 
		    } else {
		    	commitFirst += pageData.substring(1, pageData.length()-1)+",";	    	
		    }
		}
		
		if(commitFirst.endsWith(",")) {
			commitFirst = commitFirst.substring(0, commitFirst.length() - 1) + "]";
		}
		
		JsonArray commitArr = JsonParser.parseString(commitFirst).getAsJsonArray();
		String[] commitObj = new String[commitArr.size()];
		for(int i=0; i<commitArr.size(); i++) {
			CommitCal cr = new CommitCal();
			//commitObj = commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("committer").getAsJsonObject().get("date").getAsString();
			String date = commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("committer").getAsJsonObject().get("date").getAsString();
			commitObj[i] = date; // 배열에 0번째에는 commitArr의 0번째의 값이 들어갈꺼임
		}
		
		String[] commitmesObj = new String[commitArr.size()];
		for(int i=0; i<commitArr.size(); i++) {
			CommitCal cr = new CommitCal();
			String message = commitArr.get(i).getAsJsonObject().get("commit").getAsJsonObject().get("message").getAsString().replace("\n", "");
			commitmesObj[i] = message; // 배열에 0번째에는 commitArr의 0번째의 값이 들어갈꺼임				
		}
		
		model.addAttribute("rpList", rpList)
		     .addAttribute("commitObj", Arrays.toString(commitObj))
		     .addAttribute("commitmesObj", Arrays.toString(commitmesObj));
		return "commitcalendar/commitcal";
	}	
}
