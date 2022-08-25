package dto;

import java.util.List;

public class Artwork {
	
	private String seqno;
	private String name;
	private String author;
	private String plaform;
	private String rest;
	private String week;
	private String detail;
	private String admit;
	private List<TagDto> tag;
	private List<Reply> reply;
	private String url;
	
	public Artwork() {
	}

	public String getSeqno() {
		return seqno;
	}

	public void setSeqno(String seqno) {
		this.seqno = seqno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPlaform() {
		return plaform;
	}

	public void setPlaform(String plaform) {
		this.plaform = plaform;
	}

	public String getRest() {
		return rest;
	}

	public void setRest(String rest) {
		this.rest = rest;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		if(week.equals("완결")) {
			this.week = week;
		}else {
			this.week=week+" 연재중" ;
		}
		
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getAdmit() {
		return admit;
	}

	public void setAdmit(String admit) {
		this.admit = admit;
	}

	public List<TagDto> getTag() {
		return tag;
	}

	public void setTag(List<TagDto> tag) {
		this.tag = tag;
	}

	public List<Reply> getReply() {
		return reply;
	}

	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
