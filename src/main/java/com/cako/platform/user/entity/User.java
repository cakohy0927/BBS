package com.cako.platform.user.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cako.platform.utils.BaseEntity;
import com.orm.enums.SysEnum;
import com.orm.enums.SysEnum.Status;
import com.orm.enums.SysEnum.UserType;

@Entity
@Table(name = "t_platform_user")
public class User extends BaseEntity {

	private String brithday;// 出生日期
	private String email;// 电子邮箱
	private String loginName;// 登录名称
	private String nickName;// 用户昵称
	private String password;// 登录密码
	private SysEnum.Status userStatus = Status.INIT;// 用户状态
	private SysEnum.UserType userType = UserType.GENERAL;// 用户类型

	public String getBrithday() {
		return brithday;
	}

	public String getEmail() {
		return email;
	}

	public String getLoginName() {
		return loginName;
	}

	public String getNickName() {
		return nickName;
	}

	public String getPassword() {
		return password;
	}

	public SysEnum.Status getUserStatus() {
		return userStatus;
	}

	public SysEnum.UserType getUserType() {
		return userType;
	}

	public void setBrithday(String brithday) {
		this.brithday = brithday;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserStatus(SysEnum.Status userStatus) {
		this.userStatus = userStatus;
	}

	public void setUserType(SysEnum.UserType userType) {
		this.userType = userType;
	}

}
