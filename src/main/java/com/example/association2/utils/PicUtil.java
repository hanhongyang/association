package com.example.association2.utils;

import org.apache.commons.io.FileUtils;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class PicUtil {
    public static String pictureUtil(String base64Data, HttpServletRequest httpServletRequest){
        String dataPrix = "";
        String data = "";

        String[] d = base64Data.split("base64,");
        if (d != null && d.length == 2) {
            dataPrix = d[0];
            data = d[1];
        }
        String suffix = "";
        if ("data:image/jpeg;".equalsIgnoreCase(dataPrix)) {//data:image/jpeg;base64,base64编码的jpeg图片数据
            suffix = ".jpg";
        } else if ("data:image/x-icon;".equalsIgnoreCase(dataPrix)) {//data:image/x-icon;base64,base64编码的icon图片数据
            suffix = ".ico";
        } else if ("data:image/gif;".equalsIgnoreCase(dataPrix)) {//data:image/gif;base64,base64编码的gif图片数据
            suffix = ".gif";
        } else if ("data:image/png;".equalsIgnoreCase(dataPrix)) {//data:image/png;base64,base64编码的png图片数据
            suffix = ".png";
        }
        String imgName = UUID.randomUUID().toString();
        String tempFileName = imgName + suffix;
        byte[] bs = Base64Utils.decodeFromString(data);
        String url = httpServletRequest.getSession().getServletContext().getRealPath("/upload");
        try {
            FileUtils.writeByteArrayToFile(new File(url + "/" + tempFileName), bs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String picture="../upload/"+tempFileName;
        return picture;

    }
}
