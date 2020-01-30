package com.example.association2.controller;

import com.example.association2.enums.UserType;
import com.example.association2.model.Activity;
import com.example.association2.model.Association;
import com.example.association2.model.AssociationMemberDTO;
import com.example.association2.model.User;
import com.example.association2.service.ActivityServiceImpl;
import com.example.association2.service.AssociationMemberServiceImpl;
import com.example.association2.service.AssociationServiceImpl;
import com.example.association2.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private AssociationMemberServiceImpl associationMemberService;
    @Autowired
    private AssociationServiceImpl associationService;
    @Autowired
    private ActivityServiceImpl activityService;

    @GetMapping("/userManage")
    public String toUserManage(@RequestParam(name = "bar", defaultValue = "1") int bar,
                               HttpServletRequest httpServletRequest) {
        switch (bar) {
            case 1:
                httpServletRequest.setAttribute("userList", userService.findAllUsers());
                httpServletRequest.setAttribute("bar", 1);
                break;
            case 2:
                httpServletRequest.setAttribute("AssociationMemberList", associationMemberService.findAllMember());
                httpServletRequest.setAttribute("bar", 2);
                break;
            case 3:

                httpServletRequest.setAttribute("bar", 3);
                break;
        }
        return "manage/user_manage";
    }

    @RequestMapping("/amDelete")
    public ModelAndView amDelete(@RequestParam(name = "id", required = true) int id,
                                 HttpServletRequest httpServletRequest) {
        associationMemberService.deleteUser(id);
        int bar = 2;

        ModelAndView mv = new ModelAndView();
        mv.addObject("bar", bar);
        mv.setViewName("forward:userManage");
        return mv;

    }

    @RequestMapping("/userDelete")
    public ModelAndView userDelete(@RequestParam(name = "userId", required = true) int userId) {
        userService.deleteUser(userId);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:userManage");
        return mv;

    }

    @GetMapping("/toUserModify")
    public String toModifyUser(@RequestParam(name = "userId", required = true) int userId,
                               HttpServletRequest httpServletRequest) {
        httpServletRequest.setAttribute("userId", userId);
        User user = userService.finUserById(userId);
        httpServletRequest.setAttribute("user", user);
        return "manage/user_modify";
    }

    @RequestMapping("/userModify")
    public ModelAndView userModify(@RequestParam(name = "userId", required = true) int userId,
                                   @RequestParam(name = "password", required = true) String password) {
        userService.updateUserPassword(userId, password);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:userManage");
        return mv;
    }

    @RequestMapping("/toAmModify")
    public String toModifyAm(@RequestParam(name = "id", required = true) int id,
                             HttpServletRequest httpServletRequest) {
        httpServletRequest.setAttribute("am", associationMemberService.findMemberById(id));
        return "manage/am_modify";
    }

    @RequestMapping("/amModify")
    public ModelAndView userModify(@RequestParam(name = "userId", required = true) int userId,
                                   @RequestParam(name = "position", required = true) String position,
                                   @RequestParam(name = "description", required = true) String description) {
        associationMemberService.updateAm(userId, position, description);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:userManage");
        return mv;
    }

    @RequestMapping("/profile")
    public String profile(HttpSession httpSession,
                          @RequestParam(name = "bar", defaultValue = "1") int bar,
                          HttpServletRequest httpServletRequest) {
        //返回用户
        httpServletRequest.setAttribute("user", userService.finUserById((int) httpSession.getAttribute("userId")));
        //查找社团成员表

        List<AssociationMemberDTO> amd = associationMemberService.findMemberByUserId((int) httpSession.getAttribute("userId"));
        List<Association> associations = new ArrayList<>();
        Iterator<AssociationMemberDTO> iterator = amd.iterator();
        //返回创建的社团
        Association association = associationService.findAssByUserId((int) httpSession.getAttribute("userId"));

        switch (bar) {
            case 1:
                //遍历，添加到assjoin
                while (iterator.hasNext()) {
                    AssociationMemberDTO associationMemberDTO = iterator.next();
                    associations.add(associationService.findAssociationById(associationMemberDTO.getAssociationId()));
                }
                //返回加入的社团
                httpServletRequest.setAttribute("assJoin", associations);
                httpServletRequest.setAttribute("bar", 1);
                break;
            case 2:
                //返回创建的社团
                httpServletRequest.setAttribute("assCreate", association);
                //返回申请的活动
                List<Activity> activities = activityService.findActivityByAssociationId(association.getAssociationId());
                if (activities != null) {
                    httpServletRequest.setAttribute("actApply", activities);
                    httpServletRequest.setAttribute("bar", 2);
                    break;
                } else {
                    httpServletRequest.setAttribute("bar", 2);
                    break;
                }

        }
        return "profile";


    }
    @RequestMapping("/toEditPassword")
    public String toEditPassword(HttpSession httpSession,HttpServletRequest httpServletRequest){
        httpServletRequest.setAttribute("userId",httpSession.getAttribute("userId"));
        return "edit_password";
    }
    @RequestMapping("/editPassword")
    public String editPassword(@RequestParam(name = "userId",required = true) int userId,
                               @RequestParam(name = "password", required = true) String password){

        userService.updateUserPassword(userId,password);
        return "password_edit_success";
    }
}