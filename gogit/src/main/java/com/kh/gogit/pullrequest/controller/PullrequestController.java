package com.kh.gogit.pullrequest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
//			prq.setPullManager(pullreq.get("assignees").getAsString());
			prq.setCreateDate(pullreq.get("created_at").getAsString());
			
			list.add(prq);
		}
		
		model.addAttribute("list", list);
		
		return "pullrequest/pullRequestList";
	}
	
	@RequestMapping("create.pullrq")
	public String createPullRequestForm() {
		return "pullrequest/pullRequestEnroll";
	}

}
