package we.are.travelers;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtils {

//	@Autowired
//	private static ServletContext ctx;

	public static void makeFolders(String path) {
		File folder = new File(path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
	}

	public static String getBasePath(String... moreFolder) {
		String temp = "";
		for (String s : moreFolder) {
			temp += s;
		}
		String basePath = temp;
		return basePath;
	}

	// 확장자 얻어오기
	public static String getExt(String fileNm) {
		return fileNm.substring(fileNm.lastIndexOf(".") + 1);
	}

	// 랜덤 파일명 리턴
	public static String getRandonFileNm(String fileNm) {
		return UUID.randomUUID().toString() + "." + getExt(fileNm);
	}

	// 파일 저장 & 랜덤 파일명 구하기
	public String transferTo(MultipartFile mf, String... target) {
		String fileNm = null;
		String basePath = getBasePath(target);
		makeFolders(basePath);

		try {
			fileNm = getRandonFileNm(mf.getOriginalFilename());
			File file = new File(basePath, fileNm);
			mf.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return fileNm;
	}

	public static String transferTo(MultipartFile mf, boolean createThumb, HttpServletRequest request) throws Exception {
		String fileNm = null;
		
		String upload_dir = "resources/upload/";
		
		String basePath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("basePath : "+basePath);
		makeFolders(basePath);
		File file;

		try {
			fileNm = getRandonFileNm(mf.getOriginalFilename());
			file = new File(basePath, fileNm);
			mf.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return fileNm;
	}
	
}