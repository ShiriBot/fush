package service;



import dao.TagDao;
import dto.TagDto;

public class TagService {
	TagDao searchDao = new TagDao();
	TagDao tagDao = new TagDao();
	
	public TagDto[] searchService() {
		return searchDao.searchBox();
	}

	public void insert() {
		tagDao.insert();
	}
}
