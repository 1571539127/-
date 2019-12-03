package com.lijp.muban.utils;

public class ResponseJsonUtil {
	  
	private static final String DEFAULTSUCCESS = "操作成功";  
	private static final String DEFAULTFAILURE= "操作失败";  
	private  boolean success;
	private  String message;
	private  String result;
	private  String version; 
	private String data;
   
    public String success() throws Exception {  
    	success = true;
        message = DEFAULTSUCCESS;
		result = "0000";
        data = "";
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    }
    public String success(String message) throws Exception{  
    	this.success = true;
    	this.message = message;
    	this.result = "0000";
    	this.data = "";
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    }
    public String successversion(String message,String version) throws Exception{  
    	this.success = true;
    	this.message = message;
    	this.version = version;
    	this.result = "0000";
    	this.data = "";
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    }
    public String success(String message,String datajson) throws Exception{  
    	this.success = true;
    	this.message = message;
    	this.data = datajson;
    	this.result = "0000";
		 String jsonResult = JacksonUtil.bean2Json(this);
         return jsonResult;  
    }
    public String success(String message,String version,String datajson) throws Exception{
    	this.success = true;
    	this.message = message;
    	this.version = version;
    	this.result = "0000";
    	this.data = datajson;
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    }
 
    public String successdata(String datajson) throws Exception{  
		  this.success = true;
		  this.message = DEFAULTSUCCESS;
		  this.result = "0000";
	      this.data = datajson;  
	      String jsonResult = JacksonUtil.bean2Json(this);
	      return jsonResult;    
    }
    
    public String failure() throws Exception{  
    	this.success = false;
    	this.message = DEFAULTFAILURE;
    	this.result = "0999";
    	this.data = "";
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    }  
  
    public String failure(String message) throws Exception{  
    	this.success = false;
    	this.message = message;
    	this.result = "0999";
    	this.data = "";
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    }  
    public String failure(String message,String version) throws Exception{
    	this.success = false;
    	this.message = message;
    	this.result = "0999";
    	this.version = version; 
    	this.data = "";
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    }  
    public String failure(String message,String version,String datajson) throws Exception{  
    	this.success = false;
    	this.message = message;
    	this.result = "0999";
    	this.version = version;
    	this.data = datajson;
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    } 
    public String failure(String message,String version,String datajson,String resultCode) throws Exception{ 
    	this.success = false;
    	this.message = message;
    	this.result = resultCode;
    	this.version = version; 
    	this.data = datajson;
        String jsonResult = JacksonUtil.bean2Json(this);
        return jsonResult;  
    } 
  
  
	public  String getData() {
		return data;
	}

	public  void setData(String data) {
		this.data = data;
	}
	public  boolean isSuccess() {
		return success;
	}
	public  void setSuccess(boolean success) {
		this.success = success;
	}
	public  String getMessage() {
		return message;
	}
	public  void setMessage(String message) {
		this.message = message;
	}
	public  String getResult() {
		return result;
	}
	public  void setResult(String result) {
		this.result = result;
	}
	public  String getVersion() {
		return version;
	}
	public  void setVersion(String version) {
		this.version = version;
	}
} 

