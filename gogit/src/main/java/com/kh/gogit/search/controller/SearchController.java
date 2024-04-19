package com.kh.gogit.search.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.repository.model.vo.Repository;
import com.kh.gogit.search.model.service.SearchServiceImpl;
import com.kh.gogit.search.model.vo.Search;

@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImpl sService;
	
	@RequestMapping("search.jm")
	public String test1(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		String searchList = sService.test1(m);
		System.out.println("여기다" + searchList);
		
		ArrayList<Search> seList = new ArrayList<Search>();
		
		JsonElement element = JsonParser.parseString(searchList);
		// element는 어레이배열로도 객체로도 적재적소에 만들어줌 내가 가져온값이 뭔지 판단만해서!
		
		if(element.isJsonArray()) {
			// 데이터가 배열인 경우, 배열로 처리
			// 내가 원하는 속성들만 가져가야해서 파싱해야함
			JsonArray searchArr = JsonParser.parseString(searchList).getAsJsonArray();
			
			for(int i=0; i<searchArr.size(); i++) {
				// JsonObject searObj = searchArr.get(i).getAsJsonObject();
				
				Search se = new Search();
				se.setLogin(searchArr.get(i).getAsJsonObject().get("login").getAsString()); // getAsString 스트링으로 변환시켜주는 애
				se.setAvatarUrl(searchArr.get(i).getAsJsonObject().get("avatar_url").getAsString()); // getAsString 스트링으로 변환시켜주는 애
				se.setHtmlUrl(searchArr.get(i).getAsJsonObject().get("html_url").getAsString());
				se.setTotalCount(searchArr.get(i).getAsJsonObject().get("total_count").getAsString());
				se.setType(searchArr.get(i).getAsJsonObject().get("type").getAsString());
				
				seList.add(se);
			}	
		} else if(element.isJsonObject()) {
			// 데이터가 객체인 경우, 객체로 처리
			// 너객체냐? 그럼 파싱한값을 객체로 넣겠다
			JsonParser parser = new JsonParser();
			
			JsonObject seObj = parser.parse(searchList).getAsJsonObject(); // 가져왔던 객체를 파싱함
			JsonArray itemsArray = seObj.getAsJsonArray("items"); // 가져온 객체안에 있는 배열에 접근!
			
			// 배열안에 있는 객체에 접근해야함 이제부터
			JsonObject firstItem = itemsArray.get(0).getAsJsonObject();
			
			// 만들어진 객체의 속성값에 접근해서 그걸 스트링으로 만들어져서 변수에 담는다
			String login = firstItem.get("login").getAsString();

			
			System.out.println("뭐죠? 여기거든요?" + login);
			Search se = new Search();
			se.setLogin(login); // getAsString 스트링으로 변환시켜주는 애
			se.setAvatarUrl(firstItem.get("avatar_url").getAsString()); // getAsString 스트링으로 변환시켜주는 애
			se.setHtmlUrl(firstItem.get("html_url").getAsString());
			se.setTotalCount(seObj.get("total_count").getAsString());
			se.setType(firstItem.get("type").getAsString());
			
			seList.add(se);
		}else {
			System.out.println("객체도 배열도 아니면 뭐냐");
		}

		model.addAttribute("seList", seList);
		
		return "common/searchView";
	}

}
