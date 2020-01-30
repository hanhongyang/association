package com.example.association2.service;

import com.example.association2.model.News;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface NewsService {
    public News findNewsById(@Param("id")int id);

    public List<News> findAllNews();

    public List<News> findLastNews();
    public void addNews(@Param("title")String title,@Param("description")String description,@Param("createTime")String createTime);
    public void deleteNews(@Param("id")int id);
    public void updateNews(@Param("title")String title,@Param("description")String description,@Param("id")int id);

}
