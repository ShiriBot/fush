package service;



import dao.TagDao;
import dto.TagDto;

public class TagService {
	TagDao searchDao = new TagDao();
	
	public TagDto[] searchService() {
		
		return searchDao.searchBox();
	}
}
