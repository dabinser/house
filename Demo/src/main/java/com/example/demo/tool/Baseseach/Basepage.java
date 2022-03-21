package com.example.demo.tool.Baseseach;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

import java.io.Serializable;
@Data
public  class Basepage extends Page implements Serializable {
    /**
     * 排序列名
     */
    private String sort;

    /**
     * 排序方向
     */
    private String sortOrder = "ASC";

    /**
     * 页面容量
     */
    private Integer pageSize = 10;

    /**
     * 页码
     */
    private Integer pageNum = 1;

}
