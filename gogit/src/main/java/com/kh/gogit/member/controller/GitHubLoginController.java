package com.kh.gogit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.gogit.service.GitHubAuthService;

@Controller
public class GitHubLoginController {
	
	@Autowired
    private GitHubAuthService gitHubAuthService;

    @GetMapping("/github/callback")
    public String githubCallback(@RequestParam("code") String code, HttpSession session) {
        String accessToken = gitHubAuthService.getGitHubAccessToken(code);
        
        if (accessToken != null) {
            String userInfo = gitHubAuthService.getGitHubUserInfo(accessToken);
            session.setAttribute("userInfo", userInfo);
            return "redirect:/main"; // 사용자 정보를 표시할 뷰 이름
        } else {
            return "error"; // 오류 페이지로 리다이렉트
        }
    }

}
