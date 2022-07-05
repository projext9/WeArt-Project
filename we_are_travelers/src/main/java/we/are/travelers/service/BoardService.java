package we.are.travelers.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import we.are.travelers.FileUtils;

public class BoardService {

	
	
	// ckeditor 이미지 업로드
	// write 내부 이미지 업로드 기능
	public static Map<String, Object> uploadImg(MultipartFile img, HttpSession session) {
		
		System.out.println("img : " + img.getOriginalFilename());
		String folder = "/resources/upload";
		String ctntImg = null;
//		String path = session.getServletContext().getRealPath("/");
//		String[] split = path.split("travelers");
//		path = split[1]; // realPath에서 프로젝트 경로만 남김
		
		try {
			ctntImg = FileUtils.transferTo(img, true, folder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ctntImg == null) {
			return null;
		}
		
		Map<String, Object> json = new HashMap<String, Object> ();
		json.put("uploaded", 1);
		json.put("fileName", ctntImg);
		json.put("url", "/img" + ctntImg);
		
		return json;
	}

}
