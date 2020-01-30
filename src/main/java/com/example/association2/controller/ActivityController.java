package com.example.association2.controller;

import com.example.association2.service.ActivityServiceImpl;
import com.example.association2.service.AssociationMemberServiceImpl;
import com.example.association2.utils.PicUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ActivityController {
    @Autowired
    private AssociationMemberServiceImpl associationMemberService;
    @Autowired
    private ActivityServiceImpl activityService;

    @GetMapping("/activities")//所有活动页面
    public String toActivities(HttpServletRequest httpServletRequest,
                               @RequestParam(name = "key", required = true) int key) {//key判断点击的活动分类
        if (key == 0) {//所有活动
            httpServletRequest.setAttribute("activityList", activityService.findAllActivityAndName());
            httpServletRequest.setAttribute("key", key);
        } else if (key == 1) {//文体类活动
            httpServletRequest.setAttribute("activityList", activityService.findActivityAndNameByAssociationType(key));
            httpServletRequest.setAttribute("key", key);
        } else if (key == 2) {//学术类活动
            httpServletRequest.setAttribute("activityList", activityService.findActivityAndNameByAssociationType(key));
            httpServletRequest.setAttribute("key", key);
        } else if (key == 3) {//公益类活动
            httpServletRequest.setAttribute("activityList", activityService.findActivityAndNameByAssociationType(key));
            httpServletRequest.setAttribute("key", key);
        }
        return "activity";
    }

    @GetMapping("/activity")//活动详情页面
    public String act_detail(HttpServletRequest httpServletRequest,
                             @RequestParam(name = "activityId", required = true) int activityId) {
        String imglocation[] = activityService.findActivityById(activityId).getPicture().split(";");//把活动图片路径和分号切割后返回正确的图片路径
        httpServletRequest.setAttribute("imgLocation", imglocation);
        int imgNum = imglocation.length;
        httpServletRequest.setAttribute("imgNum", imgNum);//获取图片数量
        httpServletRequest.setAttribute("activity", activityService.findActivityById(activityId));
        return "act_detail";//活动详情页面
    }

    @GetMapping("/activityApply")//申请活动页面
    public String toApply(HttpServletRequest httpServletRequest) {
        HttpSession session = httpServletRequest.getSession();
        int userId = (int) session.getAttribute("userId");
        httpServletRequest.setAttribute("associationId", associationMemberService.findassociationIdByUserId(userId));
        return "act_apply";
    }

    @PostMapping("/activity")//提交活动申请
    @ResponseBody
    public String addAct(@RequestParam String title,
                         String description,
                         int associationId,
                         String startTime,
                         String endTime,
                         String location,
                         float material,
                         @RequestParam(name = "base64Data0", required = false) String base64Data0,
                         @RequestParam(name = "base64Data1", required = false) String base64Data1,
                         @RequestParam(name = "base64Data2", required = false) String base64Data2,
                         HttpServletRequest httpServletRequest) {
        String picture1 = "";
        String picture2 = "";
        String picture3 = "";
        String picture = "";
        if (base64Data0 == null || "".equals(base64Data0)) {
            //提示上传图片错误
        } else {
            picture1 = PicUtil.pictureUtil(base64Data0, httpServletRequest);
            picture = picture1;
        }
        if (base64Data1 == null || "".equals(base64Data1)) {
            //提示上传图片错误
        } else {
            picture2 = PicUtil.pictureUtil(base64Data1, httpServletRequest);
            picture = picture + ";" + picture2;
        }
        if (base64Data2 == null || "".equals(base64Data2)) {
            //提示上传图片错误
        } else {
            picture3 = PicUtil.pictureUtil(base64Data2, httpServletRequest);
            picture = picture + ";" + picture3;
        }

        activityService.addActivity(title, description, associationId, startTime, endTime, location, material, picture);
        //HttpSession session = httpServletRequest.getSession();
        String result = "1";
        return result;
    }

    @RequestMapping("/applyResult")//活动申请结果页面
    public String toresult() {
        return "apply_result";
    }

    @RequestMapping("/actDelete")
    public ModelAndView actDelete(@RequestParam(name = "activityId", required = true) int activityId) {
        activityService.deleteActivity(activityId);
        int bar = 2;
        ModelAndView mv = new ModelAndView();
        mv.addObject("bar", bar);
        mv.setViewName("forward:assManage");
        return mv;
    }
    //查看申请的活动图片
    @RequestMapping("/actPicture")
    public String act_picture(HttpServletRequest httpServletRequest,
                             @RequestParam(name = "activityId", required = true) int activityId) {
        String imglocation[] = activityService.findActivityById(activityId).getPicture().split(";");//把活动图片路径和分号切割后返回正确的图片路径
        httpServletRequest.setAttribute("imgLocation", imglocation);
        int imgNum = imglocation.length;
        httpServletRequest.setAttribute("imgNum", imgNum);//获取图片数量
        httpServletRequest.setAttribute("activity", activityService.findActivityById(activityId));
        return "manage/act_picture";//活动详情页面
    }
    @RequestMapping("/toActModify")//活动修改页面
    public String toAssModify(@RequestParam(name = "activityId", required = true) int activityId,
                              HttpServletRequest httpServletRequest) {
        String imglocation[] = activityService.findActivityAndNameById(activityId).getPicture().split(";");//把活动图片路径和分号切割后返回正确的图片路径
        httpServletRequest.setAttribute("imgLocation", imglocation);
        int imgNum = imglocation.length;
        httpServletRequest.setAttribute("imgNum", imgNum);//获取图片数量
        httpServletRequest.setAttribute("act", activityService.findActivityAndNameById(activityId));
        return "manage/act_modify";
    }
    @RequestMapping("/actModify")//提交活动修改
    @ResponseBody
    public String actModify( @RequestParam(name = "activityId", required = true)int activityId,
                             int activityStatus,
                             @RequestParam String title,
                             String description,
                             int associationId,
                             String startTime,
                             String endTime,
                             String location,
                             float material,
                             @RequestParam(name = "base64Data0", required = false) String base64Data0,
                             @RequestParam(name = "base64Data1", required = false) String base64Data1,
                             @RequestParam(name = "base64Data2", required = false) String base64Data2,
                             HttpServletRequest httpServletRequest) {
        String picture1 = "";
        String picture2 = "";
        String picture3 = "";
        String picture = "";
        if("data".equals(base64Data0.substring(0,4))){//本地上传的图片
            if (base64Data0 == null || "".equals(base64Data0)) {
                //提示上传图片错误
            } else {
                picture1 = PicUtil.pictureUtil(base64Data0, httpServletRequest);
                picture = picture1;
            }
            if (base64Data1 == null || "".equals(base64Data1)) {
                //提示上传图片错误
            } else {
                picture2 = PicUtil.pictureUtil(base64Data1, httpServletRequest);
                picture = picture + ";" + picture2;
            }
            if (base64Data2 == null || "".equals(base64Data2)) {
                //提示上传图片错误
            } else {
                picture3 = PicUtil.pictureUtil(base64Data2, httpServletRequest);
                picture = picture + ";" + picture3;
            }
        }else {//是从数据库读取的图片
            if (base64Data0 == null || "".equals(base64Data0)) {
                //提示上传图片错误
            } else {
                picture1 = base64Data0;
                picture = picture1;
            }
            if (base64Data1 == null || "".equals(base64Data1)) {
                //提示上传图片错误
            } else {
                picture2 = base64Data1;
                picture = picture + ";" + picture2;
            }
            if (base64Data2 == null || "".equals(base64Data2)) {
                //提示上传图片错误
            } else {
                picture3 =base64Data2;
                picture = picture + ";" + picture3;
            }
        }


        activityService.updateActivity(title,description,associationId,startTime,endTime,location,picture,material,activityStatus,activityId);
        String result = "1";
        return result;
    }
    @RequestMapping("/toAddAct")
    public String toAddAss(int associationId,HttpServletRequest httpServletRequest) {
        httpServletRequest.setAttribute("associationId",associationId);
        return "manage/act_add";
    }
    @PostMapping("/actAdd")//活动添加业务逻辑
    @ResponseBody
    public String actAdd(@RequestParam String title,
                         String description,
                         int associationId,
                         String startTime,
                         String endTime,
                         String location,
                         float material,
                         @RequestParam(name = "base64Data0", required = false) String base64Data0,
                         @RequestParam(name = "base64Data1", required = false) String base64Data1,
                         @RequestParam(name = "base64Data2", required = false) String base64Data2,
                         HttpServletRequest httpServletRequest) {
        String picture1 = "";
        String picture2 = "";
        String picture3 = "";
        String picture = "";
        if (base64Data0 == null || "".equals(base64Data0)) {
            //提示上传图片错误
        } else {
            picture1 = PicUtil.pictureUtil(base64Data0, httpServletRequest);
            picture = picture1;
        }
        if (base64Data1 == null || "".equals(base64Data1)) {
            //提示上传图片错误
        } else {
            picture2 = PicUtil.pictureUtil(base64Data1, httpServletRequest);
            picture = picture + ";" + picture2;
        }
        if (base64Data2 == null || "".equals(base64Data2)) {
            //提示上传图片错误
        } else {
            picture3 = PicUtil.pictureUtil(base64Data2, httpServletRequest);
            picture = picture + ";" + picture3;
        }

        activityService.addActivity(title, description, associationId, startTime, endTime, location, material, picture);
        //HttpSession session = httpServletRequest.getSession();
        String result = "1";
        return result;
    }


    @RequestMapping("/actApplyPass")//活动申请通过
    public ModelAndView actApplySuccess(@RequestParam(name = "activityId", required = true) int activityId) {
        activityService.applyPass(activityId);
        int bar = 1;
        ModelAndView mv = new ModelAndView();
        mv.addObject("bar", bar);
        mv.setViewName("forward:applyManage");
        return mv;
    }
    @RequestMapping("/actApplyRefuse")//活动申请拒绝
    public ModelAndView actApplyRefuse(@RequestParam(name = "activityId", required = true) int activityId) {
        activityService.applyRefuse(activityId);
        int bar = 1;
        ModelAndView mv = new ModelAndView();
        mv.addObject("bar", bar);
        mv.setViewName("forward:applyManage");
        return mv;
    }
}
