package com.example.association2.controller;

import com.alibaba.fastjson.JSONArray;
import com.example.association2.model.News;
import com.example.association2.service.NewsService;
import com.example.association2.service.NewsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class NewsController {
    @Autowired
    private NewsServiceImpl newsService;

    @RequestMapping("/newsManage")
    public String toNewsManage(HttpServletRequest httpServletRequest){
        httpServletRequest.setAttribute("newsList",newsService.findAllNews());
        return "manage/news_manage";
    }
    @RequestMapping("/toAddNews")
    public String toAddNews(){
        return "manage/news_add";
    }
    @RequestMapping("/addNews")
    public ModelAndView addNews(String title,String description){
        String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        newsService.addNews(title,description,createTime);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:newsManage");
        return mv;
    }
    @RequestMapping("/deleteNews")
    public ModelAndView actApplyRefuse(@RequestParam(name = "id", required = true) int id) {
        newsService.deleteNews(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:newsManage");
        return mv;
    }
    @RequestMapping("/toNewsModify")
    public String toNewsModify(int id,HttpServletRequest httpServletRequest){
        httpServletRequest.setAttribute("news",newsService.findNewsById(id));
        return "manage/news_modify";
    }
    @RequestMapping("/newsModify")
    public ModelAndView newsModify(String title,String description,int id){
        newsService.updateNews(title,description,id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:newsManage");
        return mv;
    }
    @RequestMapping("/newsDetail")
    public String newsDetail(int id,HttpServletRequest httpServletRequest){
        httpServletRequest.setAttribute("news",newsService.findNewsById(id));
        return "news_detail";
    }
    @GetMapping("/news")
    @ResponseBody
    public List<News>  news(HttpServletRequest httpServletRequest){
        List<News> lastNews=newsService.findLastNews();
        return lastNews;
    }
}
