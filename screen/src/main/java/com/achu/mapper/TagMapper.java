package com.achu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.achu.dto.Tag;

public interface TagMapper {

	int insert(String tagName);

	List<Tag> list();

	int edit(@Param("seqno") String seqno,@Param("newName") String newName);

	int remove(String seqno);

	int confirm(String tagName);

	/*Integer insert(Map<String,Object> rs);*/

}
