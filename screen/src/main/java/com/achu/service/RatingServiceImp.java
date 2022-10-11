package com.achu.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.achu.mapper.RatingMapper;

public class RatingServiceImp implements RatingService {
	
	@Autowired
	RatingMapper rm;
	@Override
	public int ratingReg(int value) {
		return rm.ratingReg(value);
	}

}
