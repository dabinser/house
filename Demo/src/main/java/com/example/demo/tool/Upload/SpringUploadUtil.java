package com.example.demo.tool.Upload;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
@Component
public class SpringUploadUtil {


    /***

     */
    public static String uploadPics(List<MultipartFile> file) {

        int index = 0;
        StringBuffer sb = new StringBuffer();

        for (MultipartFile multipartFile : file) {
            if (file.isEmpty()) {
                continue;
            }
            try {
                //工具类生成文件名
                String fileName = FileCreateNameUtils.toCreateName();
                //获取文件后缀名
                String fileType = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().indexOf("."));
                File f = new File("C:\\upload\\");
                if (f.exists()) {
                    //判断这个文件是否存在，若存在则变换文件名 防止覆盖
                    fileName = FileCreateNameUtils.toCreateName();
                }
                byte[] bytes = multipartFile.getBytes();
                Path path = Paths.get("upload/");
                //写入磁盘
                Files.write(path, bytes);
                sb.append(fileName + fileType);
                index++;
                if (file.size() != index) {
                    sb.append(",");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return sb.toString();
    }
}

