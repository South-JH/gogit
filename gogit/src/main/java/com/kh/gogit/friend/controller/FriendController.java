package com.kh.gogit.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.common.template.Pagination;
import com.kh.gogit.friend.model.service.FriendServiceImpl;
import com.kh.gogit.friend.model.vo.Friend;
import com.kh.gogit.member.model.vo.Member;
import com.microsoft.graph.models.Request;





@Controller
public class FriendController {


@Autowired
private FriendServiceImpl fService;


   @RequestMapping("form.fr")
   public String friendForm() {
      return "friend/friendForm";
   }
   
   
   
     
		 

   @ResponseBody
   @RequestMapping("addFriend.fr")
   public String addFriend(String bfTaker, String bfGiver, HttpSession session) {
      Friend f = new Friend();
      f.setBfTaker(bfTaker);
      f.setBfGiver(bfGiver);
      
      int result = fService.addFriend(f);
      if(result > 0){
         session.setAttribute("alert", "dff");
      }
      return result > 0 ? "success" : "fail";
      
   }

   @ResponseBody
   @RequestMapping("acceptFriend.fr")
   public String acceptFriend(String bfTaker, String bfGiver, HttpSession session){
   
	   
	   Friend f = new Friend();

      f.setBfGiver(bfGiver);
      f.setBfTaker(bfTaker);

      int result = fService.acceptFriend(f);
      int result2 = 0;

      if(result>0){
         result2 = fService.acceptMyFriend(f);
      }

  	return result * result2 > 0 ? "success" : "fail";

         }
   @ResponseBody
   @RequestMapping("deleteFriend.fr")
   public String deleteFriend(String bfTaker, String bfGiver){
      Friend f = new Friend();
      f.setBfGiver(bfGiver);
      f.setBfTaker(bfTaker);

      int result = fService.deleteFriend(f);
      int result2 = 0;

      if(result>0){
         result2 = fService.deleteMyFriend(f);
      }

      return result * result2 > 0 ? "success" : "fail";
   }

   /*
   @ResponseBody
   @RequestMapping("cancelAddFriend.fr"){
      public String cancelAddFriend(String bfTaker, String bfGiver){
         Friend f = new Friend();
         f.setBfGiver(bfGiver);
         f.setBfTaker(bfTaker);

         int result = fservice.cancelAddFriend(f);
      }
   }*/

   @ResponseBody
   @RequestMapping("refuseFriend.fr")
   public String refuseFriend(String bfTaker, String bfGiver){

      Friend f = new Friend();
      f.setBfGiver(bfGiver);
      f.setBfTaker(bfTaker);

      int result = fService.refuseFriend(f);

      return result > 0 ? "success" : "fail";
   }

   @ResponseBody
   @RequestMapping(value = "selectMyFriend.fr", produces="application/json; charset=UTF-8")
   public String selectMyFriend(@RequestParam(value="cpage", defaultValue = "1") int currentPage,String memId, HttpSession session){

      int listCount = fService.listCount(memId);

      PageInfo pi2 = new Pagination().getPageInfo(listCount, currentPage, 5, 5);

      ArrayList<Member> myBList = fService.selectFriendList(memId, pi2);

      return "";
   }


   //@ResponseBody
  // @RequestMapping(value="allMemberList.fr", produces="application/json; charset=UTF-8")
  // public ArrayList<Member> selectFriendList(String memId){

       //int allMemberList = fService.allMemberList();
      // int listCount = fService.listCount(memId);

       //return fService.selectFriendList(memId);
  // }

   @ResponseBody
   @RequestMapping(value = "searchMember.fr", produces = "application/json; charset=UTF-8")
   public String searchMember(String search, String memId, HttpSession session) {
	   
	   
	   System.out.println(search);
       System.out.println(memId);
       
       ArrayList<Member> list  = fService.searchMember(search, memId);
       System.out.println(list);
      return new Gson().toJson(list);   
      }
  @ResponseBody
  @RequestMapping(value = "allMemberList.fr" , produces="application/json; charset=UTF-8")
  public String allMemberList(String memId){
	 
	  ArrayList<Member> list = fService.allMemberList(memId);
	  
	  return new Gson().toJson(list);
  }
   
}
