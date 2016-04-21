package com.myClass.RestController;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.aspectj.ajde.ui.swing.GoToLineThread;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myClass.Common.JsonFile;
import com.myClass.Common.MyclassCommon;

@Controller
public class JusoRestController {
	
	@RequestMapping(value="/rest/getJuso", method = RequestMethod.POST)
	public ResponseEntity<JSONArray> get(
			@RequestParam(value="sdcd", required=false) String sdcd,
			HttpServletRequest request, HttpServletResponse response) {
		
		JSONArray req = new JSONArray();
		final String key = MyclassCommon.jusoApiKey;
		
		if ( sdcd != null ) {
			String url = "http://juso.monteapps.com/Juso/SelectSGG.do?key=" + key + "&sd_cd=" + sdcd;
		
			try { 
				CloseableHttpClient httpClient = HttpClients.createDefault();
				HttpGet get = new HttpGet(url);
				CloseableHttpResponse httpResponse = httpClient.execute(get);
				
				try { 
					req.add(EntityUtils.toString(httpResponse.getEntity()));
				} finally {
					httpResponse.close();
				}
				
			} catch ( Exception e ) {
				e.printStackTrace();
			}
		
		} 
		else {
			req.add(JsonFile.city);
		}
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept( Arrays.asList(MediaType.APPLICATION_JSON ));
        return new ResponseEntity<JSONArray>(req, headers, HttpStatus.OK);
	}
}
