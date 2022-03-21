package com.example.demo.ins.controller;

import com.example.demo.ins.service.IDocumentfileService;
import com.example.demo.tool.Upload.SpringUploadUtil;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author jeff
 * @Date 11/01/2022 11:31
 * @Version 1.0
 * @Description:
 */
@Api("图片上传")
@RestController
@RequestMapping("/PicLoad")
@Slf4j
public class PicController {
    @Autowired
    private IDocumentfileService IDocumentFileService;
    @Autowired
    private SpringUploadUtil springUploadUtil;
    @PostMapping
    public Map<String, Object> orderComment(HttpServletRequest request) {

        Map<String, Object> map = new HashMap<>();
        // 从前台的请求当中取出 file文件类型
        List<MultipartFile> list = ((MultipartHttpServletRequest) request).getFiles("file");

        String pics = null;
        if (list.size() != 0) {
            //上传图片 调用工具类上传 返回上传后文件的名字
            pics = springUploadUtil.uploadPics(list);
            map.put("文件名",pics);
            /*IDocumentFileService.saveUrl(pics);*/
        }
        return map;
    }

    @ResponseBody
    public String currentUserNameSimple(HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        return principal.getName();
    }

}

