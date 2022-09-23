package com.achu.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.*;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.achu.dto.Member;
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@WebAppConfiguration
	@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
										"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
	public class MemberControllerTest {
		private static final Logger log = LoggerFactory.getLogger("MemberControllerTest.class");
		
		@Autowired
		private WebApplicationContext wac;
		
		private MockMvc mockMvc;
		
		@Before
		public void setup() {
			this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
			log.info("mockMvc setup....");
		}
		// 일반 컨트롤러
		@Test
		public void test() {
			
			try {
				String rs = mockMvc.perform(
								MockMvcRequestBuilders.post("/log/login").param("id", "testOracle").param("password", "eocjf123")
							).andReturn().getModelAndView().getViewName();
				log.info(rs);
			} catch (Exception e) {
				e.printStackTrace();
		}
	}
		//REST 컨트롤러
		@Test
		public void test2() throws Exception {
			Member member = new Member();
			member.setId("testOracle");
			member.setPw("eocjf123");
			member.setName("임정후");
			member.setGender("M");
			String jsonStr = new Gson().toJson(member);
			log.info(jsonStr);
			mockMvc.perform(MockMvcRequestBuilders.post("/ex/member")
					.contentType(MediaType.APPLICATION_JSON)
					.content(jsonStr)).andExpect(status().is(200));
		}
		
}
