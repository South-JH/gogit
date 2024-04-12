package com.kh.gogit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.service.MemberServiceImpl;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.service.GitHubAuthService;

@Controller
public class GitHubLoginController {
	
	@Autowired
    private GitHubAuthService gitHubAuthService;
	
	@Autowired
	private MemberServiceImpl mService;

    @GetMapping("/github/callback")
    public String githubCallback(@RequestParam("code") String code, HttpSession session) {
        String accessToken = gitHubAuthService.getGitHubAccessToken(code);
        
        if (accessToken != null) {
        	
            String userInfo = gitHubAuthService.getGitHubUserInfo(accessToken);
            
            JsonObject userInfoObj = (JsonObject)new JsonParser().parse(userInfo);
            
            Member m = new Member();
            m.setMemId(userInfoObj.get("id").toString());
            m.setMemToken(accessToken);
            m.setGitNick(userInfoObj.get("login").toString().replace("\"", ""));
            m.setProfile(userInfoObj.get("avatar_url").toString().replace("\"", ""));
            
            int checkResult = mService.checkMemberId(m.getMemId());

            int result = 0;
            if(checkResult > 0) {
            	result = mService.updateMember(m);
            	
            } else {
            	result = mService.insertMember(m);
            }
            
            if(result > 0) {
            	Member loginUser = mService.loginMember(m.getMemId());
            	
            	session.setAttribute("loginUser", loginUser);
            	return "redirect:/main";
            	
            } else {
            	return "error";
            }
            
        } else {
            return "error";
        }
    }

}
