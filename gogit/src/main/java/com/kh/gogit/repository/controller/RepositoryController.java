package com.kh.gogit.repository.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.gogit.repository.model.service.RepositoryServiceImpl;

@Controller
public class RepositoryController {
	
	@Autowired
	private RepositoryServiceImpl rpService;

	@RequestMapping("list.rp")
	public String repositoryList() {
		
		
		
		return "repository/repositoryList";
	}
	
	@RequestMapping("enrollForm.rp")
	public void repoEnrollForm() throws IOException {
		
		String url ="https://www.toptal.com/developers/gitignore/api/list?format=:format:";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream())); // 기반스트림을 가지고 보조스트림 만들어주기
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		System.out.println(responseText);
		//return "repository/repositoryEnrollForm";
	}
	
	@RequestMapping("detail.rp")
	public String repoDetailView() {
		return "repository/repositoryDetailView";
	}
	
}
