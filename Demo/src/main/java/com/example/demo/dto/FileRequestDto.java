package com.example.demo.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class FileRequestDto implements Serializable {
    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件byte数组
     */
    private byte[] fileBytes;

}
