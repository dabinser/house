package com.example.demo.dto;/**
 * @Author jeff
 * @Date 10/03/2022 13:37
 * @Version 1.0
 * @Description:
 */

import com.example.demo.tool.Baseseach.Basepage;

import java.io.Serializable;

/**
 *@ClassName SearchDto
 *@Author jeffjliu
 *@Date 10/03/2022 13:37
 **/
public class SearchDto implements Serializable {
    private Condition condition;
    private Basepage basepage;

    @Override
    public String toString() {
        return "SearchDto{" +
                "condition=" + condition +
                ", basepage=" + basepage +
                '}';
    }

    public Condition getCondition() {
        return condition;
    }

    public void setCondition(Condition condition) {
        this.condition = condition;
    }

    public Basepage getBasepage() {
        return basepage;
    }

    public void setBasepage(Basepage basepage) {
        this.basepage = basepage;
    }
}
