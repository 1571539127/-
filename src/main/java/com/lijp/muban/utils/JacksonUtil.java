package com.lijp.muban.utils;


import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;


/**
 * @author startsi
 * 更新版本发现方法过时了，先凑合着用
 */
public class JacksonUtil {  
    private static ObjectMapper mapper = new ObjectMapper();  
  
    public static String bean2Json(Object obj) throws RuntimeException {  
    	String str = "";
    	try{
    		StringWriter sw = new StringWriter();  
	        JsonGenerator gen = new JsonFactory().createJsonGenerator(sw);  
	        mapper.writeValue(gen, obj);  
	        gen.close();  
	        str = sw.toString(); 
    	}catch (IOException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
        return str;
    }  
    public static <T> T json2Bean(String jsonStr, Class<T> objClass) throws RuntimeException{  
        T o = null ;
		try {
			mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false); //如果json中有新增的字段并且是objClass类中不存在的，防止转换报错 
			o = mapper.readValue(jsonStr, objClass);
		} catch (IOException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
        return o;
   }
    
    public static <T> T json2ListBean(String jsonStr, Class<T> objClass) throws RuntimeException {   
    	 T o = null ;
    	 try{
    		 ObjectMapper mapper = new ObjectMapper();  
    		 mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    		 JavaType javaType = mapper.getTypeFactory().constructParametricType(List.class, objClass);  
    	//如果是Map类型  mapper.getTypeFactory().constructParametricType(HashMap.class,String.class, Bean.class);     	 
    		 o=	mapper.readValue(jsonStr, javaType);
    	 }catch (IOException e) {
 			// TODO Auto-generated catch block
// 			e.printStackTrace();
 			throw new RuntimeException(e.getMessage());
 		}
         return o;
    	 
     }
    
   /* public static <T> T json2Bean(String jsonStr, Class<T> objClass)  
            throws Exception {  
        return mapper.readValue(jsonStr, objClass);  
    } 
    public static <T> T json2ListBean(String jsonStr, Class<T> objClass) throws Exception {   
    	ObjectMapper mapper = new ObjectMapper();  
    	JavaType javaType = mapper.getTypeFactory().constructParametricType(List.class, objClass);  
    	//如果是Map类型  mapper.getTypeFactory().constructParametricType(HashMap.class,String.class, Bean.class);  
    	 return mapper.readValue(jsonStr, javaType);
    	 
     }*/ 
   
}  
