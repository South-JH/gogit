package com.kh.gogit.search.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.repository.model.vo.Repository;
import com.kh.gogit.search.model.service.SearchServiceImpl;
import com.kh.gogit.search.model.vo.Search;

import kotlin.reflect.TypeOfKt;

@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImpl sService;
	
	@RequestMapping("search.jm")
	public String test1(HttpSession session, Model model, String keyword) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		// JSON 응답을 받아옴
		String searchList = sService.test1(m, keyword);
		
		// 객체를 담을 ArrayList를 생성
		ArrayList<Search> seList = new ArrayList<Search>();
		
		/*
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
			for (JsonElement elements : itemsArray) {
				Search se = new Search();
				se.setLogin(login); // getAsString 스트링으로 변환시켜주는 애
				se.setAvatarUrl(firstItem.get("avatar_url").getAsString()); // getAsString 스트링으로 변환시켜주는 애
				se.setHtmlUrl(firstItem.get("html_url").getAsString());
				se.setTotalCount(seObj.get("total_count").getAsString());
				se.setType(firstItem.get("type").getAsString());
				
				seList.add(se);
				
			}
		}else {
			System.out.println("객체도 배열도 아니면 뭐냐");
		}
		*/
		
		// 받아온 JSON 응답을 객체로 변환
		JsonParser parser = new JsonParser(); // JSON파싱을 위해 JsonParser객체를 생성
		JsonObject seObj = parser.parse(searchList).getAsJsonObject(); // 받아온 JSON 응답을 jsonObject로 변환
		JsonArray itemsArray = seObj.getAsJsonArray("items"); // JsonObject에서 "items"의 키값을 가져옴

		// 모든 아이템을 순회하며 객체를 생성
		for (JsonElement element : itemsArray) { // items 배열 다 순회하기
		    if (element.isJsonObject()) { // 각 요소가 JsonObject인지 확인
		        JsonObject item = element.getAsJsonObject(); // JsonObject로 변환
		        Search se = new Search();
		        se.setLogin(item.get("login").getAsString()); // JsonObject에서 "login" 키의 값을 가져와서 setLogin
		        se.setAvatarUrl(item.get("avatar_url").getAsString());
		        se.setHtmlUrl(item.get("html_url").getAsString());
		        se.setType(item.get("type").getAsString());
		        se.setTotalCount(seObj.get("total_count").getAsString());
		        seList.add(se);
		    }
		}
		
		// 다른방법)나머지 속성은 첫 번째 아이템의 값으로 설정
		//if (!seList.isEmpty()) { // 첫 번째 아이템의 "total_count" 속성 값을 가져와서 Search 객체의 totalCount에 설정
		    //Search firstItem = seList.get(0); // seList에서 첫 번째 요소를 가져와서 firstItem 변수에 할당
		    //firstItem.setTotalCount(seObj.get("total_count").getAsString());  // 첫 번째 요소인 firstItem의 total_count 값을 seObj에서 가져와서 설정함, 이 값은 JSON 응답에서 total_count 값임
		    
		    //for (Search searchItem : seList) { // for 루프 안에서 각 요소에 대해 total_count 값을 설정하고 있음, 이 부분이 for 루프 밖에서 total_count 값이 seList에 추가되는 것과 같은 효과를 줌
		        //searchItem.setTotalCount(seObj.get("total_count").getAsString());
		    //}
		//}	
		model.addAttribute("seList", seList);
		model.addAttribute("keyword", keyword);
		return "common/searchView";
	}
	
	@RequestMapping("search.jmm")
	public void test2(HttpSession session, Model model, String keyword, String page, HttpServletResponse response) throws JsonIOException, IOException {	
		Member m = (Member)session.getAttribute("loginUser");
		
		String searchList = sService.test2(m, keyword, page);
		
		ArrayList<Search> seList = new ArrayList<Search>();
		
		JsonParser parser = new JsonParser(); 
		JsonObject seObj = parser.parse(searchList).getAsJsonObject();
		JsonArray itemsArray = seObj.getAsJsonArray("items");

		for (JsonElement element : itemsArray) { 
		    if (element.isJsonObject()) { 
		        JsonObject item = element.getAsJsonObject();
		        Search se = new Search();
		        se.setLogin(item.get("login").getAsString());
		        se.setAvatarUrl(item.get("avatar_url").getAsString());
		        se.setHtmlUrl(item.get("html_url").getAsString());
		        se.setType(item.get("type").getAsString());
		        se.setTotalCount(seObj.get("total_count").getAsString());
		        seList.add(se);
		    }
		}		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(seList, response.getWriter());
	}
	
	@RequestMapping("detail.sr")
	public String detailView(String nickName, String avatar, Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		String searchUserContent = sService.userDetailView(nickName, m);
		JsonParser parser = new JsonParser(); 
		JsonArray userArr = JsonParser.parseString(searchUserContent).getAsJsonArray(); // 대괄호는 어레이로 파싱(올때 스트링형으로 오니까 jSonArray형으로 파싱을 해줘야 키값으로 값을 뽑을수 있기에 파싱을함)
		//JsonObject objuser = userArr.get(0).getAsJsonObject(); // 얘가 제이슨오브젝트, 어레이를 빼서 오브젝트로 만들어줌
		
		ArrayList<Search> list = new ArrayList<Search>();
		
		for (JsonElement element : userArr) { 
		    if (element.isJsonObject()) { 
		        JsonObject objuser = element.getAsJsonObject();
		        Search se = new Search();
				se.setName(objuser.get("name").getAsString());
				se.setVisibility(objuser.get("visibility").getAsString());
				se.setLanguage(objuser.get("language").isJsonNull() ? "" : objuser.get("language").getAsString());
				se.setDescription(objuser.get("description").isJsonNull() ? "" : objuser.get("description").getAsString());
		        list.add(se);
		    }
		}		

		model.addAttribute("nickName", nickName)
		.addAttribute("avatar", avatar)
		.addAttribute("list",list) ;
		return "search/searchDetailView";
	}
	
}
