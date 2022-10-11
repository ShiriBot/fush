package com.achu.mapper;

import org.apache.ibatis.annotations.Param;

import com.achu.dto.Artwork;
import com.achu.dto.Image;

public interface ArtworkMapper {

	public Artwork getArtwork(String seqno) ;

	public int setImageLink(@Param("seqno") String seqno, @Param("imageLink") String imageLink);

	public String setImageFile(@Param("seqno") String seqno, @Param("image") Image image);
}
