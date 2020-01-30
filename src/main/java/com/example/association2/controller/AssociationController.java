package com.example.association2.controller;

import com.example.association2.model.User;
import com.example.association2.service.ActivityServiceImpl;
import com.example.association2.service.AssociationMemberServiceImpl;
import com.example.association2.service.AssociationServiceImpl;
import com.example.association2.service.NewsServiceImpl;
import com.example.association2.utils.PicUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AssociationController {
    @Autowired
    private AssociationServiceImpl associationService;
    @Autowired
    private AssociationMemberServiceImpl associationMemberService;
    @Autowired
    private ActivityServiceImpl activityService;
@Autowired
private NewsServiceImpl newsService;
    @GetMapping("/associations")//所有社团页面
    public String index(HttpServletRequest httpServletRequest,
                        @RequestParam(name = "type", required = false, defaultValue = "1") int type) {
        httpServletRequest.setAttribute("type", type);
        httpServletRequest.setAttribute("associationsList", associationService.findAssociationsByType(type));
        httpServletRequest.setAttribute("lastActivity", activityService.findLastActivity());

        return "mid/index";
    }

    //申请创建社团页面
    @GetMapping("/associationApply")
    public String toApplyAss(HttpServletRequest httpServletRequest) {
        HttpSession session = httpServletRequest.getSession();
        int userId = (int) session.getAttribute("userId");
        httpServletRequest.setAttribute("userId", userId);
        return "ass_apply";
    }

    //提交创建社团申请
    @PostMapping("/associationApply")
    @ResponseBody
    public String addAss(String name,
                         String description,
                         int ownerId,
                         int type,
                         @RequestParam(name = "base64Data", required = true) String base64Data,
                         HttpServletRequest httpServletRequest) {
        String logo = "";
        String s[];
        if (base64Data == null || "".equals(base64Data)) {
            //提示上传图片错误
        } else {
            logo = PicUtil.pictureUtil(base64Data, httpServletRequest);
            logo = logo.substring(3, logo.length());
            System.out.println(logo);
        }
        associationService.addAssociation(description, name, null, type, ownerId, logo);
        String result = "1";
        return result;
    }

    //社团详情页面
    @GetMapping("/association")
    public String association(
            @RequestParam(name = "associationId", required = true) int associationId,
            @RequestParam(name = "bar", defaultValue = "1") int bar,
            HttpServletRequest httpServletRequest) {
        switch (bar) {
            case 1:
                httpServletRequest.setAttribute("bar", 1);
                break;
            case 2:
                httpServletRequest.setAttribute("presidentDes",
                        associationMemberService.findPresidentDesByAssid(associationId));
                httpServletRequest.setAttribute("VicePresidentDes",
                        associationMemberService.findVicePresidentDesByAssid(associationId));
                httpServletRequest.setAttribute("MinisterDes",
                        associationMemberService.findMinisterDesByAssid(associationId));
                httpServletRequest.setAttribute("bar", 2);
                break;
            case 3:
                httpServletRequest.setAttribute("activityList",
                        activityService.findActivityByAssociationId(associationId));
                httpServletRequest.setAttribute("signatureActivity",associationService.findSignatureActivityName(associationId));
                httpServletRequest.setAttribute("bar", 3);
                break;
        }
        httpServletRequest.setAttribute("association", associationService.findAssociationById(associationId));
        return "/ass_detail";
    }

    @RequestMapping("/assManage")
    public String toAssManage(@RequestParam(name = "bar", defaultValue = "1") int bar,
                              HttpServletRequest httpServletRequest) {
        switch (bar) {
            case 1:
                httpServletRequest.setAttribute("assList", associationService.findAllAss());
                httpServletRequest.setAttribute("bar", 1);
                break;
            case 2:
                httpServletRequest.setAttribute("actList", activityService.findAllActivityAndName());
                httpServletRequest.setAttribute("bar", 2);
                break;

        }
        return "manage/ass_manage";
    }

    @RequestMapping("/toAddAss")
    public String toAddAss() {
        return "manage/ass_add";
    }


    @PostMapping("/assAdd")
    @ResponseBody
    public String AddAss(String name,
                         String description,
                         int ownerId,
                         int type,
                         @RequestParam(name = "base64Data", required = true) String base64Data,
                         HttpServletRequest httpServletRequest) {
        String logo = "";
        String s[];
        if (base64Data == null || "".equals(base64Data)) {
            //提示上传图片错误
        } else {
            logo = PicUtil.pictureUtil(base64Data, httpServletRequest);
            logo = logo.substring(3, logo.length());
            System.out.println(logo);
        }
        String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        associationService.addAss(description, name, createTime, type, ownerId, logo);
        String result = "1";
        return result;
    }

    @RequestMapping("/assDelete")
    public ModelAndView amDelete(@RequestParam(name = "associationId", required = true) int associationId) {
        associationService.deleteAss(associationId);
        int bar = 2;
        ModelAndView mv = new ModelAndView();
        mv.addObject("bar", bar);
        mv.setViewName("forward:assManage");
        return mv;

    }

    @RequestMapping("/toAssModify")
    public String toAssModify(@RequestParam(name = "associationId", required = true) int associationId,
                              HttpServletRequest httpServletRequest) {
        httpServletRequest.setAttribute("ass", associationService.findAssociationById(associationId));
        return "manage/ass_modify";
    }
    @RequestMapping("/assModify")
    @ResponseBody
    public String assModify( @RequestParam(name = "associationId", required = true)int associationId,
                                  String name,
                                  String description,
                                  int ownerId,
                                  int type,
                                  Integer signatureActivity,
                                  @RequestParam(name = "base64Data", required = true) String base64Data,
                                  HttpServletRequest httpServletRequest) {
        String logo = "";
        if("data".equals(base64Data.substring(0,4))) {//本地上传的图片
            if (base64Data == null || "".equals(base64Data)) {

                //提示上传图片错误
            } else {
                logo = PicUtil.pictureUtil(base64Data, httpServletRequest);
                logo = logo.substring(3, logo.length());
            }
        }else {
            logo=base64Data.substring(22,base64Data.length()) ;
        }
        associationService.assModify(description,name,type,ownerId,logo,signatureActivity,associationId);
        associationMemberService.updatePresidentByAssociationId(associationId,ownerId);
        String result = "1";
        return result;
    }

    @RequestMapping("/applyManage")
    public String toApplyManage(@RequestParam(name = "bar", defaultValue = "1") int bar,
                                HttpServletRequest httpServletRequest) {
        switch (bar) {
            case 1:
                httpServletRequest.setAttribute("actApplyList", activityService.findAllActivityApply());
                httpServletRequest.setAttribute("bar", 1);
                break;
            case 2:
                httpServletRequest.setAttribute("assApplyList", associationService.findAllAssociationsApply());
                httpServletRequest.setAttribute("bar", 2);
                break;
        }
        return "manage/apply_manage";
    }

    @RequestMapping("/assApplyPass")
    public ModelAndView assApplySuccess(@RequestParam(name = "associationId", required = true) int associationId) {
        String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        associationService.applyPass(createTime,associationId);
        associationMemberService.updatePresidentByAssociationId(associationId,associationService.findOwnerIdByAssociationId(associationId));
        int bar = 2;
        ModelAndView mv = new ModelAndView();
        mv.addObject("bar", bar);
        mv.setViewName("forward:applyManage");
        return mv;
    }

    @RequestMapping("/assApplyRefuse")
    public ModelAndView assApplyRefuse(@RequestParam(name = "associationId", required = true) int associationId) {
        associationService.applyRefuse(associationId);
        int bar = 2;
        ModelAndView mv = new ModelAndView();
        mv.addObject("bar", bar);
        mv.setViewName("forward:applyManage");
        return mv;
    }
}
