package we.are.travelers.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import we.are.travelers.vo.MemberVo;

@Controller
public class HomeController {
	
	@RequestMapping("/")//get방식 요청 처리
	public String home() {
		return "home";
	}
	
	
	@GetMapping("/fileUpload.do")//get방식 요청 처리
	public String fileUpload() {
		return "gallery/fileUpload";
	}
	
	/* Spring MVC에서 파일 업로드 구현을 위한 조치들
	 * 
	 * 1. pom.xml에 fileupload에 필요한 dependency 추가
	 * <dependency>
	 * 	<groupId>commons-fileupload</groupId>
	 * 	<artifactId>commons-fileupload</artifactId>
	 * 	<version>1.4</version>
	 * </dependency>
	 * 
	 * 2. pom.xml에 servlet-api와 jsp-api 업데이트
	 * <dependency>
	 * 	<groupId>javax.servlet</groupId>
	 * 	<artifactId>javax.servlet-api</artifactId>
	 * 	<version>3.1.0</version>
	 * 	<scope>provided</scope>
	 * </dependency>
	 * 
	 * <dependency>
	 * 	<groupId>javax.servlet.jsp</groupId>
	 * 	<artifactId>javax.servlet.jsp-api</artifactId>
	 * 	<version>2.3.2-b02</version>
	 * 	<scope>provided</scope>
	 * </dependency>
	 * 
	 * 3. servlet-context.xml에 MultipartResolver 빈 등록
	 * <beans:bean id="multipartResolver" 
	 *             class="org.springframework.web.multipart.support.StandardServletMultipartResolver">
	 * </beans:bean>
	 * 
	 * 4. web.xml에 <servlet>태그 내에 multipart-config 설정 정보 추가
	 * <multipart-config>
	 * 	<max-file-size>10485760</max-file-size><!-- 파일 한 개의 최대 크기: 10MB(10*1024*1024) -->
	 * 	<max-request-size>52428800</max-request-size><!-- 한 번에 여러 파일을 올릴 때 최대 크기: 50MB -->
	 * 	<file-size-threshold>20971520</file-size-threshold><!-- 넘으면 temp에 넣고 업로드에 들어가지 않음: 20MB -->
	 * </multipart-config>
	 * 
	 * 5. webapp/resources/upload 폴더 만들기
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
