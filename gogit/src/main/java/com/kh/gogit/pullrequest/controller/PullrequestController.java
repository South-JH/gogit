package com.kh.gogit.pullrequest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.service.PullrequestServiceImpl;
import com.kh.gogit.pullrequest.model.vo.Pullrequest;

@Controller
public class PullrequestController {
	
	@Autowired
	private PullrequestServiceImpl prqService;
	
	@RequestMapping("list.pullrq")
	public String pullRequestList(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String responseBody = prqService.getPullrequestList(loginUser);
		
		JsonArray pullreqArr = JsonParser.parseString(responseBody).getAsJsonArray();
		
		ArrayList<Pullrequest> list = new ArrayList<Pullrequest>();
		
		for(int i = 0; i < pullreqArr.size(); i ++) {
			JsonObject pullreq = pullreqArr.get(i).getAsJsonObject();
			
			Pullrequest prq = new Pullrequest();
			prq.setPullTitle(pullreq.get("title").getAsString());
			
			if(!pullreq.get("body").isJsonNull()) {
				prq.setPullContent(pullreq.get("body").getAsString());
			}
			
			prq.setPullWriter(pullreq.get("user").getAsJsonObject().get("login").getAsString());
			
			JsonArray assigneesArr = pullreq.get("assignees").getAsJsonArray();
			
			String assignees = "";
			String profiles = "";
			for(int j = 0; j < assigneesArr.size(); j++) {
				
				String assignee = assigneesArr.get(j).getAsJsonObject().get("login").getAsString();
				
				String profile = prqService.getAssigneesProfile(loginUser, assignee);

				if(j == assigneesArr.size() -1) {
					assignees += assignee;
					profiles += profile;
				} else {
					assignees += assignee + ",";
					profiles += profile + ",";
				}
				
			}
			
			prq.setPullManager(assignees);
			prq.setPullManagerProfile(profiles);
			prq.setStatus(pullreq.get("state").getAsString());
			prq.setCreateDate(pullreq.get("created_at").getAsString());
			
			list.add(prq);
		}
		
		model.addAttribute("list", new Gson().toJson(list));
		
		return "pullrequest/pullRequestList";
	}
	
	@RequestMapping("create.pullrq")
	public String createPullRequestForm() {
		// branch 조회해와야 함
		prqService.getBranchList();
		
		return "pullrequest/pullRequestEnroll";
	}

}
