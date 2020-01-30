package com.example.association2.controller;

import com.example.association2.enums.UserType;
import com.example.association2.model.User;
import com.example.association2.service.ActivityServiceImpl;
import com.example.association2.service.AssociationServiceImpl;
import com.example.association2.service.NewsServiceImpl;
import com.example.association2.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class LoginController{
    @Autowired
    private UserServiceImpl userService;
@Autowired
private NewsServiceImpl newsService;
    @Autowired
    private AssociationServiceImpl associationService;
    @Autowired
    private ActivityServiceImpl activityService;
    //登录界面
    @GetMapping("/")
    public String tologin(){
        return "mid/login";
    }
    //校验账户密码
    @PostMapping("/login")
    public String check(User user, HttpSession session, HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes) {
        User u1=userService.validUser(user.getUserId(), user.getPassword());
        if(u1==null) {//账户密码不匹配
            httpServletRequest.setAttribute("msg","用户名密码错误" );
            return "mid/login";
        }else {
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userType", userService.finUserTypeById(user.getUserId()));
            return "redirect:associations";
        }
    }

    //注册界面
    @GetMapping("/register")
    public String Register(Model model) {
        //model.addAttribute("user", new User());
        return "register";
    }
    //进行注册
    @PostMapping("/register")
    public String Register(User user,HttpSession session, HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes) {
        User u2=userService.validUserAccount(user.getUserId());

        if(u2!=null) {//账户已存在
            httpServletRequest.setAttribute("msg","用户已存在" );
            return "register";
        }
        else//进行注册
            userService.addUser(user.getUserId(), user.getPassword(), UserType.STUDENT.getUserType());
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("userType", userService.finUserTypeById(user.getUserId()));
        return "redirect:associations";
    }
    //注销
    @RequestMapping("/exit")
    public String exit(HttpSession session, HttpServletRequest httpServletRequest,
                       Model model,
                       @RequestParam(name = "type", required = false,defaultValue = "1") int type) {
        httpServletRequest.setAttribute("type",type);
        httpServletRequest.setAttribute("associationsList",associationService.findAssociationsByType(type));
        model.addAttribute("signatureActivity","**大赛");
        httpServletRequest.setAttribute("lastNews",newsService.findLastNews());
        httpServletRequest.setAttribute("lastActivity",activityService.findLastActivity());
        session.invalidate();
        return "mid/index";
    }
}
