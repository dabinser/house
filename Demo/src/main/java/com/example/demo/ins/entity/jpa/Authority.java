package com.example.demo.ins.entity.jpa;

import com.example.demo.ins.entity.jpa.Role;
import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "auth_table")
public class Authority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "auth_id")
    private Integer authorityId;
    @Column(name = "auth_name")
    private String authorityName;

    @JsonBackReference
    @ManyToMany(mappedBy = "authorities")
    private List<Role> roles;

    //省略了getter和setter方法

    public String getAuthorityName() {
        return authorityName;
    }

    public void setAuthorityName(String authorityName) {
        this.authorityName = authorityName;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
