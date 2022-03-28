package com.example.demo.dto;

import com.example.demo.solve.entity.Solve;
import com.example.demo.tool.Baseseach.Basepage;

import java.io.Serializable;

public class SolveDto implements Serializable {
    private Solve solve;
    private Basepage basepage;

    public Solve getSolve() {
        return solve;
    }

    public void setSolve(Solve solve) {
        this.solve = solve;
    }

    public Basepage getBasepage() {
        return basepage;
    }

    public void setBasepage(Basepage basepage) {
        this.basepage = basepage;
    }

    @Override
    public String toString() {
        return "SolveDto{" +
                "solve=" + solve +
                ", basepage=" + basepage +
                '}';
    }
}
