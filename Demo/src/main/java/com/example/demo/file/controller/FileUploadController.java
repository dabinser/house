package com.example.demo.file.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.service.IUserService;
import com.example.demo.ins.entity.Documentfile;
import com.example.demo.ins.service.IDocumentfileService;
import com.example.demo.ins.service.IRentService;
import com.example.demo.tool.File.FileCreateNameUtils;
import com.example.demo.tool.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;


/**
* @file FileUploadController.java
* @brief
* @author jeffjliu
* @email 2973296964@qq.com
* @date 09/02/2022
*/
@Slf4j
@RestController
@RequestMapping("/document")
public class FileUploadController {
@Value("${file}")
private String filePath;
@Autowired
private IRentService rentService;
@Autowired
private IDocumentfileService fileService;
@Autowired
private IUserService userService;

public static final Logger LOG = LoggerFactory.getLogger(FileUploadController.class);

@PostMapping("/upload/{id}")
public Result upload(@RequestParam("file")MultipartFile file,Principal principal,@PathVariable("id") Integer id) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
    if(file.isEmpty()){
        return Result.error("文件为空");
    }
    String fileName = file.getOriginalFilename();
    LOG.info("上传的文件名为："+fileName);
    String name = FileCreateNameUtils.toCreateName();
    String suffixName = fileName.substring(fileName.lastIndexOf("."));
    LOG.info("文件的后缀名："+suffixName);
    String fileNameUnique = String.join(name, ".", suffixName);
    QueryWrapper<SysUser> sysUserQueryWrapper = new QueryWrapper<>();
    sysUserQueryWrapper.eq("user_name",principal.getName());
    SysUser user = userService.getOne(sysUserQueryWrapper);
    Documentfile documentFile = new Documentfile();
    documentFile.setUrl(fileNameUnique);
    documentFile.setRentId(user.getId());
    String path = filePath+fileNameUnique;
    File file1 = new File(path);
    if(!file1.getParentFile().exists()){
        file1.getParentFile().mkdirs();
    }
    try {
        file.transferTo(file1);
        fileService.save(documentFile);
        return Result.success("上传成功");
    } catch (IOException e) {
        e.printStackTrace();
    }
    return Result.error("上传失败");
}
@GetMapping("/currentusername")
public String currentUserName(Principal principal) {
    return principal.getName();
}

@PostMapping("/batch/{id}")
public Result handleFileUpload(HttpServletRequest request,@PathVariable("id") Integer RentId){
    List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
    MultipartFile file = null;
    BufferedOutputStream stream = null;
    ArrayList<Documentfile> documentFiles = new ArrayList<>();
    for (int i = 0; i < files.size(); i++) {
        file = files.get(i);
        if(!file.isEmpty()){
            try {
                byte[] bytes = file.getBytes();
                String fileName = file.getOriginalFilename();
                LOG.info("上传的文件名为："+fileName);
                String name = FileCreateNameUtils.toCreateName();
                String suffixName = fileName.substring(fileName.lastIndexOf("."));
                String fileNameUnique = name + suffixName;
                Documentfile documentFile = new Documentfile();
                documentFile.setRentId(RentId);
                documentFile.setUrl(fileNameUnique);
                documentFiles.add(documentFile);
                stream = new BufferedOutputStream(new FileOutputStream
                        (new File(filePath,fileNameUnique)));//设置文件路径以及名字
                stream.write(bytes);
                stream.close();
            } catch (IOException e) {
                stream = null;
                return Result.error("第"+i+"个文件上传失败==>"+e.getMessage());
            }
        }else {
            return Result.error("第"+i+"个文件上传失败,文件为空");
        }
    }
    fileService.saveBatch(documentFiles);
    return Result.success("OK");
}

    /**
     *
     * @param request
     * @param response
     * @return
     */

    @GetMapping("/download/{fileName}")
    public String downloadFile(@PathVariable("fileName") @NotNull String fileName, HttpServletRequest request, HttpServletResponse response) {
        QueryWrapper<Documentfile> documentfileQueryWrapper = new QueryWrapper<>();
        documentfileQueryWrapper.eq("url",fileName);
        Documentfile documentfile = fileService.getOne(documentfileQueryWrapper);


        if (null==documentfile){
            return "KONG";
        }
        else {
            String url = documentfile.getUrl();
            String fileType = url.substring(url.lastIndexOf(".")+1);
            fileName=filePath+url;
            //类型
            if("jpg,jepg,gif,png".contains(fileType)){//图片类型
                response.setContentType("image/"+fileType);
            }else if("pdf".contains(fileType)){//pdf类型
                response.setContentType("application/pdf");
            }else{//自动判断下载文件类型
                response.setContentType("multipart/form-data");
            }


            if (fileName != null) {
                //设置文件路径
                File file = new File(fileName);
                //File file = new File(realPath , fileName);
                if (file.exists()) {
                   /* httpServletResponse.setContentType("image/png");
                    OutputStream os = httpServletResponse.getOutputStream();
                    os.write(img);
                    os.flush();
                    os.close();        图片返回
                    return "success";*/
                 //   response.setContentType("application/force-download");// 设置强制下载不打开
                    response.addHeader("Content-Disposition", "attachment;fileName=" + url);// 设置文件名

                    byte[] buffer = new byte[1024];
                    FileInputStream fis = null;
                    BufferedInputStream bis = null;

                    try {
                        fis = new FileInputStream(file);
                        bis = new BufferedInputStream(fis);
                        OutputStream os = response.getOutputStream();
                        int i = bis.read(buffer);
                        while (i != -1) {
                            os.write(buffer, 0, i);
                            i = bis.read(buffer);
                        }
                        BASE64Encoder base64Encoder = new BASE64Encoder();
                        String encode = base64Encoder.encode(buffer);

                        return "encode";


                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (bis != null) {
                            try {
                                bis.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                        if (fis != null) {
                            try {
                                fis.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        }


            // 文件名

        LOG.info(documentfile+"下载失败");

        return "WEI";
    }
}
