package service;

import java.util.List;

import dao.BannerDao;
import dto.File;

public class BannerService {
	BannerDao bannerDao = new BannerDao();
	
	public List<File> bannerImage() {
		return bannerDao.banner();
	}
}
