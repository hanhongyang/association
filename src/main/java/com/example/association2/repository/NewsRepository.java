package com.example.association2.repository;

import com.example.association2.model.News;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface  NewsRepository {
    @Select("select * from news where id=#{id}")
    public News findNewsById(@Param("id")int id);
    @Select("select * from news")
    public List<News> findAllNews();
    @Select("select * from news order by createtime desc limit 5")
    public List<News> findLastNews();

    @Insert("insert into news (title,description,createtime) values(#{title},#{description},#{createTime})")
    public void addNews(@Param("title")String title,@Param("description")String description,@Param("createTime")String createTime);

    @Delete("delete from news where id=#{id}")
    public void deleteNews(@Param("id")int id);

    @Update("update news set title =#{title} , description =#{description} where id=#{id}")
    public void updateNews(@Param("title")String title,@Param("description")String description,@Param("id")int id);

}
