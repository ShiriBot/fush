package com.achu.mapper;

import java.util.List;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;

public interface SearchMapper {
	public List<Artwork> getSearchList();
	
	public List<Artwork> searchResult(String name);
}
