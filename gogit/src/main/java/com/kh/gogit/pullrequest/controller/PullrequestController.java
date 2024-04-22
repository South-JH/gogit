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
import com.kh.gogit.branch.model.vo.Branch;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.service.PullrequestServiceImpl;
import com.kh.gogit.pullrequest.model.vo.Pullrequest;

@Controller
public class PullrequestController {
	
	@Autowired
	private PullrequestServiceImpl prqService;
	
	@RequestMapping("list.pullrq")
	public String pullRequestList(String repoName, String visibility, String owner, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String responseBody = prqService.getPullrequestList(loginUser, repoName, owner);
		
		JsonArray pullreqArr = JsonParser.parseString(responseBody).getAsJsonArray();
		
		ArrayList<Pullrequest> list = new ArrayList<Pullrequest>();
		
		for(int i = 0; i < pullreqArr.size(); i ++) {
			JsonObject pullreq = pullreqArr.get(i).getAsJsonObject();
			
			Pullrequest prq = new Pullrequest();
			
			prq.setPullNo(pullreq.get("number").getAsInt());
			
			prq.setPullTitle(pullreq.get("title").getAsString());
			
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
		
		model.addAttribute("repoName", repoName);
		model.addAttribute("visibility", visibility);
		model.addAttribute("owner", owner);
		model.addAttribute("list", new Gson().toJson(list));
		
		return "pullrequest/pullRequestList";
	}
	
	@RequestMapping("createForm.pullrq")
	public String createPullRequestForm(Pullrequest pullrq, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		// branch 조회해와야 함
		String branchList = prqService.getBranchList(loginUser, pullrq);
		
		ArrayList<Branch> list = new ArrayList<Branch>();
		if(branchList != null) {
			JsonArray branchArr = JsonParser.parseString(branchList).getAsJsonArray();
			
			for(int i = 0; i < branchArr.size(); i++) {
				JsonObject branch = branchArr.get(i).getAsJsonObject();
				
				String name = branch.get("name").getAsString();
				String commitSHA = branch.get("commit").getAsJsonObject().get("sha").getAsString();
				String commitUrl = branch.get("commit").getAsJsonObject().get("url").getAsString();
				boolean isProtected = branch.get("protected").getAsBoolean();
				
				list.add(new Branch(name, commitSHA, commitUrl, isProtected));
			}
		}
		
		model.addAttribute("pullrq", pullrq);
		model.addAttribute("list", list);
		
		return "pullrequest/pullRequestEnroll";
	}
	
	@RequestMapping("create.pullrq")
	public String createPullRequest(Pullrequest pullrq, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		boolean result = prqService.createPullRequest(loginUser, pullrq);
		
		if(result) {
			session.setAttribute("alertMsg", "pull request가 생성되었습니다.");
		} else {
			session.setAttribute("alertMsg", "pull request 생성을 실패했습니다.");
		}
		
		return "redirect:list.pullrq?repoName=" + pullrq.getRepoName() + "&visibility=" + pullrq.getRepoVisibility() + "&owner=" + pullrq.getRepoOwner();
	}
	
	@RequestMapping("detail.pullrq")
	public String detailPullRequest(String owner, String repoName, int pullNo, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
//		prqService.getPullrequest(loginUser, owner, repoName, pullNo);
		
		return "pullrequest/pullRequestDetailView";
	}

}
