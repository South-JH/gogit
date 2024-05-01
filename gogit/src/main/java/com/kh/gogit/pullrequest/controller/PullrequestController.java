package com.kh.gogit.pullrequest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.branch.model.vo.Branch;
import com.kh.gogit.comment.model.vo.Comment;
import com.kh.gogit.commit.model.vo.Commit;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.service.PullrequestServiceImpl;
import com.kh.gogit.pullrequest.model.vo.Pullrequest;
import com.kh.gogit.repository.model.service.RepositoryServiceImpl;
import com.kh.gogit.repository.model.vo.Repository;

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
			String assigneesProfiles = "";
			for(int j = 0; j < assigneesArr.size(); j++) {
				
				String assignee = assigneesArr.get(j).getAsJsonObject().get("login").getAsString();
				
				String assigneesProfile = assigneesArr.get(j).getAsJsonObject().get("avatar_url").getAsString();

				if(j == assigneesArr.size() -1) {
					assignees += assignee;
					assigneesProfiles += assigneesProfile;
				} else {
					assignees += assignee + ",";
					assigneesProfiles += assigneesProfile + ",";
				}
				
			}
			
			prq.setPullManager(assignees);
			prq.setPullManagerProfile(assigneesProfiles);
			
			JsonArray reviewersArr = pullreq.get("requested_reviewers").getAsJsonArray();
			
			String reviewers = "";
			String reviewersProfiles = "";
			for(int j = 0; j < reviewersArr.size(); j++) {
				
				String reviewer = reviewersArr.get(j).getAsJsonObject().get("login").getAsString();
				String reviewersProfile = reviewersArr.get(j).getAsJsonObject().get("avatar_url").getAsString();
				
				if(j == reviewersArr.size() -1) {
					reviewers += reviewer;
					reviewersProfiles += reviewersProfile;
				} else {
					reviewers += reviewer + ",";
					reviewersProfiles += reviewersProfile + ",";
				}
				
			}
			
			prq.setPullReviewer(reviewers);
			prq.setPullReviewerProfile(reviewersProfiles);
			
			prq.setStatus(pullreq.get("state").getAsString());
			prq.setCreateDate(pullreq.get("created_at").getAsString());
			
			list.add(prq);
		}
		
		model.addAttribute("repoName", repoName)
			 .addAttribute("visibility", visibility)
			 .addAttribute("owner", owner)
			 .addAttribute("list", new Gson().toJson(list));
		
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
		
		// collaborators 조회
		String collaborators = new RepositoryServiceImpl().collaboratorList(loginUser, pullrq.getRepoName(), pullrq.getRepoOwner());
		
		JsonArray colArr = JsonParser.parseString(collaborators).getAsJsonArray();
		
		ArrayList<Repository> collaboratorList = new ArrayList<Repository>();
		
		for(int i = 0; i < colArr.size(); i++) {
			Repository r = new Repository();
			r.setCollaborator(colArr.get(i).getAsJsonObject().get("login").getAsString());
			r.setAvatar(colArr.get(i).getAsJsonObject().get("avatar_url").getAsString());
			
			collaboratorList.add(r);
		}
		
		model.addAttribute("pullrq", pullrq)
			 .addAttribute("list", list)
			 .addAttribute("collaboratorList", collaboratorList);
		
		return "pullrequest/pullRequestEnroll";
	}
	
	@RequestMapping("create.pullrq")
	public String createPullRequest(Pullrequest pullrq, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String result = prqService.createPullRequest(loginUser, pullrq);
		
		if(result != null) {
			pullrq.setPullNo(JsonParser.parseString(result).getAsJsonObject().get("number").getAsInt());
			
			boolean managerResult = true;
			
			if(pullrq.getPullManager() != null) {
				managerResult = prqService.addAssignees(loginUser, pullrq);
			}
			
			if(pullrq.getPullReviewer() != null) {
				managerResult = prqService.addReviewers(loginUser, pullrq);
			}
			
			if(managerResult) {
				session.setAttribute("alertMsg", "pull request가 생성되었습니다.");
			} else {
				session.setAttribute("alertMsg", "Assignees / Reviewers 추가를 실패했습니다.");
			}
			
		} else {
			session.setAttribute("alertMsg", "pull request 생성을 실패했습니다.");
		}
		
		return "redirect:list.pullrq?repoName=" + pullrq.getRepoName() + "&visibility=" + pullrq.getRepoVisibility() + "&owner=" + pullrq.getRepoOwner();
	}
	
	@RequestMapping("detail.pullrq")
	public String detailPullRequest(String owner, String repoName, int pullNo, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String result = prqService.getPullrequest(loginUser, owner, repoName, pullNo);
		
		JsonObject pullrqObj = JsonParser.parseString(result).getAsJsonObject();
		
		Pullrequest pullrq = new Pullrequest();
		
		pullrq.setPullNo(pullrqObj.get("number").getAsInt());
		pullrq.setPullTitle(pullrqObj.get("title").getAsString());
		
		if(!pullrqObj.get("body_html").isJsonNull()) {
			pullrq.setPullContent(pullrqObj.get("body_html").getAsString());
		}
		pullrq.setPullWriter(pullrqObj.get("user").getAsJsonObject().get("login").getAsString());
		pullrq.setPullWriterProfile(pullrqObj.get("user").getAsJsonObject().get("avatar_url").getAsString());
		pullrq.setBaseBranch(pullrqObj.get("base").getAsJsonObject().get("ref").getAsString());
		pullrq.setCompareBranch(pullrqObj.get("head").getAsJsonObject().get("ref").getAsString());
		pullrq.setCommits(pullrqObj.get("commits").getAsInt());
		pullrq.setChangedFiles(pullrqObj.get("changed_files").getAsInt());
		pullrq.setRepoName(repoName);
		pullrq.setRepoOwner(owner);
		pullrq.setRepoVisibility(pullrqObj.get("base").getAsJsonObject().get("repo").getAsJsonObject().get("visibility").getAsString());
		if(!pullrqObj.get("mergeable").isJsonNull()) {
			pullrq.setMergeable(pullrqObj.get("mergeable").getAsBoolean());
		}
		pullrq.setStatus(pullrqObj.get("merged").getAsBoolean() ? "Merged" : pullrqObj.get("state").getAsString());
		pullrq.setCreateDate(pullrqObj.get("created_at").getAsString().split("T")[0]);
		
		JsonArray assigneesArr = pullrqObj.get("assignees").getAsJsonArray();
		
		String assignees = "";
		String assigneesProfiles = "";
		for(int j = 0; j < assigneesArr.size(); j++) {
			
			String assignee = assigneesArr.get(j).getAsJsonObject().get("login").getAsString();
			
			String assigneesProfile = assigneesArr.get(j).getAsJsonObject().get("avatar_url").getAsString();

			if(j == assigneesArr.size() -1) {
				assignees += assignee;
				assigneesProfiles += assigneesProfile;
			} else {
				assignees += assignee + ",";
				assigneesProfiles += assigneesProfile + ",";
			}
			
		}
		
		pullrq.setPullManager(assignees);
		pullrq.setPullManagerProfile(assigneesProfiles);
		
		JsonArray reviewersArr = pullrqObj.get("requested_reviewers").getAsJsonArray();
		
		String reviewers = "";
		String reviewersProfiles = "";
		for(int j = 0; j < reviewersArr.size(); j++) {
			
			String reviewer = reviewersArr.get(j).getAsJsonObject().get("login").getAsString();
			String reviewersProfile = reviewersArr.get(j).getAsJsonObject().get("avatar_url").getAsString();
			
			if(j == reviewersArr.size() -1) {
				reviewers += reviewer;
				reviewersProfiles += reviewersProfile;
			} else {
				reviewers += reviewer + ",";
				reviewersProfiles += reviewersProfile + ",";
			}
			
		}
		
		pullrq.setPullReviewer(reviewers);
		pullrq.setPullReviewerProfile(reviewersProfiles);

		//===================================== 커밋 리스트 가져와 ==================================
		String commitsUrl = pullrqObj.get("commits_url").getAsString();
		String commitList = prqService.getCommitList(commitsUrl, loginUser);
		
		JsonArray commitArr = JsonParser.parseString(commitList).getAsJsonArray();
		
		ArrayList<Commit> list = new ArrayList<Commit>();
		
		for(int i = 0; i < commitArr.size(); i++) {
			JsonObject commitObj = commitArr.get(i).getAsJsonObject();
			
			Commit c = new Commit();
			
			c.setSha(commitObj.get("sha").getAsString());
			c.setAuthor(commitObj.get("commit").getAsJsonObject().get("author").getAsJsonObject().get("name").getAsString());
			c.setCommitDate(commitObj.get("commit").getAsJsonObject().get("author").getAsJsonObject().get("date").getAsString().split("T")[0]);
//			c.setAvatar(commitObj.get("author").getAsJsonObject().get("avatar_url").getAsString());
			c.setMessage(commitObj.get("commit").getAsJsonObject().get("message").getAsString());
			
			list.add(c);
		}
		
		//==================================== 댓글 리스트 가져와 ====================================
		String commentsUrl = pullrqObj.get("_links").getAsJsonObject().get("comments").getAsJsonObject().get("href").getAsString();
		String commentsList = prqService.getCommentsList(commentsUrl, loginUser);
		
		JsonArray commentArr = JsonParser.parseString(commentsList).getAsJsonArray();
		
		ArrayList<Comment> comments = new ArrayList<Comment>();
		
		for(int i = 0; i< commentArr.size(); i++) {
			JsonObject commentObj = commentArr.get(i).getAsJsonObject();
			
			Comment c = new Comment();
			
			c.setComment(commentObj.get("body_html").getAsString());
			c.setCommentWriter(commentObj.get("user").getAsJsonObject().get("login").getAsString());
			c.setCommentWriterProfile(commentObj.get("user").getAsJsonObject().get("avatar_url").getAsString());
			c.setIsAuthor(commentObj.get("author_association").getAsString().equals("OWNER"));
			c.setCreateDate(commentObj.get("created_at").getAsString().split("T")[0]);
			
			comments.add(c);
		}
		
		//=================================== collaborator 가져와 ==================================
		String collaborators = new RepositoryServiceImpl().collaboratorList(loginUser, repoName, owner);
		
		JsonArray colArr = JsonParser.parseString(collaborators).getAsJsonArray();
		
		ArrayList<Repository> collaboratorList = new ArrayList<Repository>();
		
		for(int i = 0; i < colArr.size(); i++) {
			Repository r = new Repository();
			r.setCollaborator(colArr.get(i).getAsJsonObject().get("login").getAsString());
			r.setAvatar(colArr.get(i).getAsJsonObject().get("avatar_url").getAsString());
			
			collaboratorList.add(r);
		}
		
		model.addAttribute("pullrq", pullrq)
			 .addAttribute("list", list)
			 .addAttribute("comments", comments)
			 .addAttribute("collaboratorList", collaboratorList);
		
		return "pullrequest/pullRequestDetailView";
	}
	
	@RequestMapping("merge.pullrq")
	public String mergePullrequest(Pullrequest pullrq, Commit commit, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		boolean result = prqService.createMerge(loginUser, pullrq, commit);
		
		if(result) {
			session.setAttribute("alertMsg", "Success");
		} else {
			session.setAttribute("alertMsg", "Fail");
		}
		
		return "redirect:detail.pullrq?owner=" + pullrq.getRepoOwner() + "&repoName=" + pullrq.getRepoName() + "&pullNo=" + pullrq.getPullNo();
	}
	
	@RequestMapping("update.pullrq")
	public String updatePullrequest(Pullrequest pullrq, HttpSession session) throws InterruptedException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		boolean result = prqService.updatePullrequest(loginUser, pullrq);
		
		if(result) {
			session.setAttribute("alertMsg", "Pull request 수정이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "Pull request 수정을 실패했습니다.");
		}
		
		// pull request 상태 업데이트 후, mergeable 속성 업데이트까지 시간이 좀 소요됨.
		// reopen한 후에 바로 조회하면 mergeable 속성이 null로 들어와서 1초 대기 후 조회하도록
		Thread.sleep(500); // 500ms 대기
		
		return "redirect:detail.pullrq?owner=" + pullrq.getRepoOwner() + "&repoName=" + pullrq.getRepoName() + "&pullNo=" + pullrq.getPullNo();
	}
	
	@RequestMapping("comment.pullrq")
	public String createComment(Pullrequest pullrq, Comment comment, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		boolean result = prqService.createComment(loginUser, pullrq, comment);
		
		if(result) {
			session.setAttribute("alertMsg", "Review 등록 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "Review 등록 실패했습니다.");
		}
		
		return "redirect:detail.pullrq?owner=" + pullrq.getRepoOwner() + "&repoName=" + pullrq.getRepoName() + "&pullNo=" + pullrq.getPullNo();
	}
	
	@ResponseBody
	@RequestMapping("addReviewer.pullrq")
	public boolean addReviewer(Pullrequest pullrq, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");

		boolean removeResult = prqService.removeReviewers(loginUser, pullrq);
		
		if(removeResult) {
			pullrq.setPullReviewer(pullrq.getNewReviewer());
			
			if(pullrq.getPullReviewer() != null) {
				return prqService.addReviewers(loginUser, pullrq);
			} else {
				return true;
			}
			
		} else {
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "selectReviewer.pullrq", produces = "application/json; charset=utf-8")
	public String getReviewer(Pullrequest pull, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String result = prqService.getPullrequest(loginUser, pull.getRepoOwner(), pull.getRepoName(), pull.getPullNo());
		
		JsonArray reviewersArr = JsonParser.parseString(result).getAsJsonObject().get("requested_reviewers").getAsJsonArray();
		
		Pullrequest pullrq = new Pullrequest();
		
		String reviewers = "";
		String reviewersProfiles = "";
		for(int j = 0; j < reviewersArr.size(); j++) {
			
			String reviewer = reviewersArr.get(j).getAsJsonObject().get("login").getAsString();
			String reviewersProfile = reviewersArr.get(j).getAsJsonObject().get("avatar_url").getAsString();
			
			if(j == reviewersArr.size() -1) {
				reviewers += reviewer;
				reviewersProfiles += reviewersProfile;
			} else {
				reviewers += reviewer + ",";
				reviewersProfiles += reviewersProfile + ",";
			}
			
		}
		
		pullrq.setPullReviewer(reviewers);
		pullrq.setPullReviewerProfile(reviewersProfiles);
		
		return new Gson().toJson(pullrq);
	}
	
	@ResponseBody
	@RequestMapping("addAssignee.pullrq")
	public boolean addAssignee(Pullrequest pullrq, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");

		boolean removeResult = prqService.removeAssignees(loginUser, pullrq);
		
		if(removeResult) {
			pullrq.setPullManager(pullrq.getNewManager());
			
			if(pullrq.getPullManager() != null) {
				return prqService.addAssignees(loginUser, pullrq);
			} else {
				return true;
			}
			
		} else {
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "selectAssignee.pullrq", produces = "application/json; charset=utf-8")
	public String getAssignee (Pullrequest pull, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String result = prqService.getPullrequest(loginUser, pull.getRepoOwner(), pull.getRepoName(), pull.getPullNo());
		
		JsonArray assigneesArr = JsonParser.parseString(result).getAsJsonObject().get("assignees").getAsJsonArray();
		
		Pullrequest pullrq = new Pullrequest();
		
		String assignees = "";
		String assigneesProfiles = "";
		for(int j = 0; j < assigneesArr.size(); j++) {
			
			String assignee = assigneesArr.get(j).getAsJsonObject().get("login").getAsString();
			String assigneesProfile = assigneesArr.get(j).getAsJsonObject().get("avatar_url").getAsString();
			
			if(j == assigneesArr.size() -1) {
				assignees += assignee;
				assigneesProfiles += assigneesProfile;
			} else {
				assignees += assignee + ",";
				assigneesProfiles += assigneesProfile + ",";
			}
			
		}
		
		pullrq.setPullManager(assignees);
		pullrq.setPullManagerProfile(assigneesProfiles);
		
		return new Gson().toJson(pullrq);
	}

}
