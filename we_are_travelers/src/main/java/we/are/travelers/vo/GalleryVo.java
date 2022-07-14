package we.are.travelers.vo;

import java.util.Date;

public class GalleryVo {
	
	private int gallery_idx;
	private String gallery_content;
	private String origin_filename;
	private String system_filename;
	private Date upload_date;
	
	public int getGallery_idx() {
		return gallery_idx;
	}
	public void setGallery_idx(int gallery_idx) {
		this.gallery_idx = gallery_idx;
	}
	public String getGallery_content() {
		return gallery_content;
	}
	public void setGallery_content(String gallery_content) {
		this.gallery_content = gallery_content;
	}
	public String getOrigin_filename() {
		return origin_filename;
	}
	public void setOrigin_filename(String origin_filename) {
		this.origin_filename = origin_filename;
	}
	public String getSystem_filename() {
		return system_filename;
	}
	public void setSystem_filename(String system_filename) {
		this.system_filename = system_filename;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	
	

}
