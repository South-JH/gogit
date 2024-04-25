package com.kh.gogit.issue.controller;

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
import com.google.gson.JsonParser;
import com.kh.gogit.issue.model.service.IssueServiceImpl;
import com.kh.gogit.issue.model.vo.Issue;
import com.kh.gogit.member.model.vo.Member;

@Controller
public class IssueController {
	
	@Autowired
	private IssueServiceImpl iService;
	
	@RequestMapping("list.is")
	public String issueList(HttpSession session, Model model, String repoName, String visibility, String owner) {
		
//		System.out.println(repoName);
//		System.out.println(visibility);
//		System.out.println(owner);
		
		Member m = (Member)session.getAttribute("loginUser");
		String issueList = iService.issueList(m, repoName, owner);
		
		JsonArray issueArr = JsonParser.parseString(issueList).getAsJsonArray();
		ArrayList<Issue> list = new ArrayList<Issue>();
		
		if(issueList != null) {
			
			for(int i=0; i<issueArr.size(); i++) {
				
				if(issueArr.get(i).getAsJsonObject().has("pull_request")) {
					continue;
				}
				
				Issue is = new Issue();
				is.setState(issueArr.get(i).getAsJsonObject().get("state").getAsString());
				is.setTitle(issueArr.get(i).getAsJsonObject().get("title").getAsString());
				
	            JsonElement bodyEl = issueArr.get(i).getAsJsonObject().get("body");
	            if (bodyEl == null || bodyEl.isJsonNull()) {
	                is.setBody("");
	            } else {
	            	is.setBody(issueArr.get(i).getAsJsonObject().get("body").getAsString());
	            }
				
				is.setUser(issueArr.get(i).getAsJsonObject().get("user").getAsJsonObject().get("login").getAsString());
				
				
				is.setUserAvatar(issueArr.get(i).getAsJsonObject().get("user").getAsJsonObject().get("avatar_url").getAsString());
				
				JsonArray labelArr = issueArr.get(i).getAsJsonObject().get("labels").getAsJsonArray();
				String[] laName = new String[labelArr.size()];
				String[] laColor = new String[labelArr.size()];
				
				for(int j=0; j<labelArr.size(); j++) {
					
					laName[j] = issueArr.get(i).getAsJsonObject().get("labels").getAsJsonArray().get(j).getAsJsonObject().get("name").getAsString();
					laColor[j] = issueArr.get(i).getAsJsonObject().get("labels").getAsJsonArray().get(j).getAsJsonObject().get("color").getAsString();
					
				}
				
				is.setLabels(laName);
				is.setLabelColors(laColor);
				
				JsonArray assiArr = issueArr.get(i).getAsJsonObject().get("assignees").getAsJsonArray();
				String[] assi = new String[assiArr.size()];
				String[] assiAva = new String[assiArr.size()];
				
				for(int j=0; j<assiArr.size(); j++) {
					
					assi[j] = issueArr.get(i).getAsJsonObject().get("assignees").getAsJsonArray().get(j).getAsJsonObject().get("login").getAsString();
					assiAva[j] = issueArr.get(i).getAsJsonObject().get("assignees").getAsJsonArray().get(j).getAsJsonObject().get("avatar_url").getAsString();
					
				}
				
				is.setAssignees(assi);
				is.setAssigneesAvatar(assiAva);
					
				is.setComment(issueArr.get(i).getAsJsonObject().get("comments").getAsString());
				is.setCreateAt(issueArr.get(i).getAsJsonObject().get("created_at").getAsString().substring(0, 10));
				
				list.add(is);
				
			}
			
		} else {
			System.out.println("이슈 없음");
		}
		
		model.addAttribute("repoName", repoName);
		model.addAttribute("visibility", visibility);
		model.addAttribute("owner", owner);
		model.addAttribute("list", list);
		
		return "issue/issueList";
	}
	
	@RequestMapping("getList.is")
	public void getIssueList(HttpServletResponse response, HttpSession session, String repoName, String owner, String status) throws JsonIOException, IOException {
		
		Member m = (Member)session.getAttribute("loginUser");
		String issueList = iService.getIssueList(m, repoName, owner, status);
		
		JsonArray issueArr = JsonParser.parseString(issueList).getAsJsonArray();
		ArrayList<Issue> list = new ArrayList<Issue>();
		
		if(issueList != null) {
			
			for(int i=0; i<issueArr.size(); i++) {
				
				if(issueArr.get(i).getAsJsonObject().has("pull_request")) {
					continue;
				}
				
				Issue is = new Issue();
				is.setState(issueArr.get(i).getAsJsonObject().get("state").getAsString());
				is.setTitle(issueArr.get(i).getAsJsonObject().get("title").getAsString());
				
	            JsonElement bodyEl = issueArr.get(i).getAsJsonObject().get("body");
	            if (bodyEl == null || bodyEl.isJsonNull()) {
	                is.setBody("");
	            } else {
	            	is.setBody(issueArr.get(i).getAsJsonObject().get("body").getAsString());
	            }
				
				is.setUser(issueArr.get(i).getAsJsonObject().get("user").getAsJsonObject().get("login").getAsString());
				
				
				is.setUserAvatar(issueArr.get(i).getAsJsonObject().get("user").getAsJsonObject().get("avatar_url").getAsString());
				
				JsonArray labelArr = issueArr.get(i).getAsJsonObject().get("labels").getAsJsonArray();
				String[] laName = new String[labelArr.size()];
				String[] laColor = new String[labelArr.size()];
				
				for(int j=0; j<labelArr.size(); j++) {
					
					laName[j] = issueArr.get(i).getAsJsonObject().get("labels").getAsJsonArray().get(j).getAsJsonObject().get("name").getAsString();
					laColor[j] = issueArr.get(i).getAsJsonObject().get("labels").getAsJsonArray().get(j).getAsJsonObject().get("color").getAsString();
					
				}
				
				is.setLabels(laName);
				is.setLabelColors(laColor);
				
				JsonArray assiArr = issueArr.get(i).getAsJsonObject().get("assignees").getAsJsonArray();
				String[] assi = new String[assiArr.size()];
				String[] assiAva = new String[assiArr.size()];
				
				for(int j=0; j<assiArr.size(); j++) {
					
					assi[j] = issueArr.get(i).getAsJsonObject().get("assignees").getAsJsonArray().get(j).getAsJsonObject().get("login").getAsString();
					assiAva[j] = issueArr.get(i).getAsJsonObject().get("assignees").getAsJsonArray().get(j).getAsJsonObject().get("avatar_url").getAsString();
					
				}
				
				is.setAssignees(assi);
				is.setAssigneesAvatar(assiAva);
					
				is.setComment(issueArr.get(i).getAsJsonObject().get("comments").getAsString());
				is.setCreateAt(issueArr.get(i).getAsJsonObject().get("created_at").getAsString().substring(0, 10));
				
				if(issueArr.get(i).getAsJsonObject().get("closed.at") == null) {
					is.setCloseAt("");
				} else {
					is.setCloseAt(issueArr.get(i).getAsJsonObject().get("closed_at").getAsString().substring(0, 10));
				}
				
				list.add(is);
				
			}
			
		} else {
			System.out.println("이슈 없음");
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
	}
	
	@RequestMapping("enrollForm.is")
	public String issueEnrollForm(HttpSession session, Model model, String repoName, String owner, String visibility) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String assignees = iService.assigneesList(m, repoName, owner);
		ArrayList<Issue> aList = new ArrayList<Issue>();
		ArrayList<Issue> lList = new ArrayList<Issue>();
		
		if(assignees != null) {
			
			JsonArray assiArr = JsonParser.parseString(assignees).getAsJsonArray();
			
			for(int i=0; i<assiArr.size(); i++) {
				
				Issue is = new Issue();
				is.setAssignee(assiArr.get(i).getAsJsonObject().get("login").getAsString());
				is.setAssigneeAvatar(assiArr.get(i).getAsJsonObject().get("avatar_url").getAsString());
				
				aList.add(is);
			}
		}
		
		String label = iService.labelList(m, repoName, owner);
		
		if(label != null) {
			
			JsonArray labelArr = JsonParser.parseString(label).getAsJsonArray();
			
			for(int i=0; i<labelArr.size(); i++) {
				
				Issue is = new Issue();
				is.setLabel(labelArr.get(i).getAsJsonObject().get("name").getAsString());
				is.setLabelColor(labelArr.get(i).getAsJsonObject().get("color").getAsString());
				is.setLabelDesc(labelArr.get(i).getAsJsonObject().get("description").getAsString());
				
				lList.add(is);
			}
		}
		
		model.addAttribute("repoName", repoName);
		model.addAttribute("visibility", visibility);
		model.addAttribute("owner", owner);
		model.addAttribute("aList", aList);
		model.addAttribute("lList", lList);
		return "issue/issueEnroll";
	}
	
	@RequestMapping("create.is")
	public String createIssue(Model model, HttpSession session, String repoName, String visibility, String owner, String title, String body, String[] assignees, String[] labels) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		String createIs = iService.createIssue(m, repoName, owner, title, body, assignees, labels);
		
		if(createIs != null) {
			model.addAttribute("repoName", repoName);
			model.addAttribute("visibility", visibility);
			model.addAttribute("owner", owner);
			
			session.setAttribute("alertMsg", "이슈를 등록했습니다.");
			return "redirect:list.is";
		} else {
			System.out.println("이슈등록실패");
			return null;
		}
		
	}
	
	@RequestMapping("detail.is")
	public String issueDetail() {
		return "issue/issueDetail";
	}
	
}
