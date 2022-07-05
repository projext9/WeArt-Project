package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.AdminDao;
import we.are.travelers.dao.GalleryDao;
import we.are.travelers.vo.GalleryVo;
import we.are.travelers.vo.MemberVo;

@Service
public class GalleryService {
	
	private GalleryDao galleryDao;
	
	@Autowired
	public GalleryService(GalleryDao galleryDao) {
		this.galleryDao = galleryDao;
	}
	

	public int addGallery(GalleryVo galleryVo) {
		return galleryDao.addGallery(galleryVo);
	}


	public List<GalleryVo> getGalleryList() {
		return galleryDao.getGalleryList();
	}

}
