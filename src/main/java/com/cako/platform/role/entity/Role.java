package com.cako.platform.role.entity;

import com.cako.platform.utils.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Curtain on 2015/9/21.
 */
@Entity
@Table(name = "t_platform_role")
public class Role extends BaseEntity {
    private String name;
    private String roleCode;

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
