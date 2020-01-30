package com.example.association2.service;

import com.example.association2.model.News;
import com.example.association2.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsRepository newsRepository;

    @Override
    public News findNewsById(int id) {
        return newsRepository.findNewsById(id);
    }

    @Override
    public List<News> findAllNews() {
        return newsRepository.findAllNews();
    }

    @Override
    public List<News> findLastNews() {
        return newsRepository.findLastNews();
    }

    @Override
    public void addNews(String title, String description, String createTime) {
        newsRepository.addNews(title, description, createTime);
    }

    @Override
    public void deleteNews(int id) {
        newsRepository.deleteNews(id);
    }

    @Override
    public void updateNews(String title, String description, int id) {
        newsRepository.updateNews(title, description, id);
    }
}
