package com.achu.mapper;

import org.apache.ibatis.annotations.Param;

import com.achu.dto.Artwork;

public interface ArtworkMapper {

	public Artwork getArtwork(String seqno) ;
}
