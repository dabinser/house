package com.example.demo.dto;/**
 * @Author jeff
 * @Date 18/03/2022 9:40
 * @Version 1.0
 * @Description:
 */

import org.hibernate.validator.constraints.Length;

import java.io.Serializable;

/**
 *@ClassName ModifyPasswordDto
 *@Author jeffjliu
 *@Date 18/03/2022 9:40
 **/
public class ModifyPasswordDto implements Serializable {
    @Length(min = 6,max = 30,message = "密码长度为6-30个字符")
    private String oldPassword;
    @Length(min = 6,max = 30,message = "密码长度为6-30个字符")
    private String newPassword;

    @Override
    public String toString() {
        return "ModifyPasswordDto{" +
                "oldPassword='" + oldPassword + '\'' +
                ", newPassword='" + newPassword + '\'' +
                '}';
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }
}
