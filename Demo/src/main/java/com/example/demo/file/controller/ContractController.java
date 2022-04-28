package com.example.demo.file.controller;

import com.example.demo.User.service.IUserService;
import com.example.demo.file.Temp.Template;
import com.example.demo.ins.entity.Rent;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 * @Author jeff
 * @Date 17/02/2022 9:18
 * @Version 1.0
 * @Description: 租赁合同生成
 */
@RestController
@RequestMapping("/contract")
public class ContractController {
    @Autowired
    private Template template;
    @Autowired
    private IUserService userService;
    @Value("${file}")
    private String file;
    @PostMapping
    public Result downLoad(@RequestBody @NotNull Rent rent, Principal principal, HttpServletResponse httpServletResponse){
        HashMap<String, String> Data = new HashMap<>();
        Data.put("lanLady",userService.getById(rent.getSysUserId()).getUserName());
        Data.put("tenant",principal.getName());
        Data.put("address",rent.getArea());
        Data.put("rcode",rent.getRcode());
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Data.put("beginData",simpleDateFormat.format(date) );
        Data.put("price",rent.getPay().toString());
        template.createPDFContract(Data,new ArrayList<>(),file,"test.html");
        return Result.success("ok");
    }
}
