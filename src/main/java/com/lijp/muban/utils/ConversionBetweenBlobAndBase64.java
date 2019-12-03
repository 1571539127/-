package com.lijp.muban.utils;

import java.sql.Blob;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
public class ConversionBetweenBlobAndBase64 {
	/**
	 * 
	 * @param base64Str
	 * @return Blob
	 * @throws Exception
	 */
//	public static Blob base64ToBlob(String base64Str) throws Exception{
//		BASE64Decoder base64Decoder = new BASE64Decoder();
//		byte[] byteBlog = base64Decoder.decodeBuffer(base64Str);
//		return Hibernate.createBlob(byteBlog);
//	}
//	
//	
//	/**
//	 * 
//	 * @param blob
//	 * @return string 
//	 * @throws Exception
//	 */
//	public static String BlobToBase64(Blob blob) throws Exception{
//		byte[] bytes = blob.getBytes(1l,(int)blob.length());
//		return new BASE64Encoder().encode(bytes);
//	}	

}

