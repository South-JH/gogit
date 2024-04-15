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





@Controller
public class FriendController {


@Autowired
private FriendServiceImpl fService;


   @RequestMapping("form.fr")
   public String friendForm() {
      return "friend/friendForm";
   }
   
   
   @ResponseBody
   @RequestMapping(value="allMemberList.fr", produces="application/json; charset=UTF-8")
   public void selectFriendList(@RequestParam(value="cpage",defaultValue = "1") int currentPage,String memId){

      //int allMemberList = fservice.allMemberList();
	   int listCount = fService.listCount(memId);

      PageInfo pi1 = new Pagination().getPageInfo(listCount, currentPage, 5, 5);
      ArrayList<Member> myBfList1 = fService.selectFriendList(memId, pi1);
      
      
      
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
      return "";
      
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

         return "";

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

      return "";
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

      return "";
   }

   @ResponseBody
   @RequestMapping(value = "selectMyFriend.fr", produces="application/json; charset=UTF-8")
   public String selectMyFriend(@RequestParam(value="cpage", defaultValue = "1") int currentPage,String memId, HttpSession session){

      int listCount = fService.listCount(memId);

      PageInfo pi2 = new Pagination().getPageInfo(listCount, currentPage, 5, 5);

      ArrayList<Member> myBList = fService.selectFriendList(memId, pi2);

      return "";
   }

   @ResponseBody
   @RequestMapping(value = "searchMember.fr", produces = "application/json; charset=UTF-8")
   public String searchMember(String search, HttpSession session) {
      
      
      String memId = ((Member)session.getAttribute("loginMember")).getMemId();
      
      
      ArrayList<Member> list  = fService.searchMember(search, memId);
  
      return new Gson().toJson(list);


   }

}
