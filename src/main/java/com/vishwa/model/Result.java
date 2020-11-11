package com.vishwa.model;

public class Result {
	
	private boolean res;
	private int errorCode;
	private String errorMsg;
	
	public boolean isRes() {
		return res;
	}
	@Override
	public String toString() {
		return "ResultModel [res=" + res + ", errorCode=" + errorCode + ", errorMsg=" + errorMsg + "]";
	}
	public void setRes(boolean res) {
		this.res = res;
	}
	public int getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

}
