package com.recipe.vo;

public class Recipe {

	private int rid;
	private String rname;
	private String ritem;
	private byte[] rimage;
	private String rrecipe;
	private String rcontent;
	private int rhit;
	private double score_avg;
	private int score_num;
	private double score_all;
	private byte[] thumnail;
	
	
	public byte[] getThumnail() {
		return thumnail;
	}
	public void setThumnail(byte[] thumnail) {
		this.thumnail = thumnail;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRitem() {
		return ritem;
	}
	public void setRitem(String ritem) {
		this.ritem = ritem;
	}
	public byte[] getRimage() {
		return rimage;
	}
	public void setRimage(byte[] rimage) {
		this.rimage = rimage;
	}
	public String getRrecipe() {
		return rrecipe;
	}
	public void setRrecipe(String rrecipe) {
		this.rrecipe = rrecipe;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public int getRhit() {
		return rhit;
	}
	public void setRhit(int rhit) {
		this.rhit = rhit;
	}
	public double getScore_avg() {
		return score_avg;
	}
	public void setScore_avg(double score_avg) {
		this.score_avg = score_avg;
	}
	public int getScore_num() {
		return score_num;
	}
	public void setScore_num(int score_num) {
		this.score_num = score_num;
	}
	public double getScore_all() {
		return score_all;
	}
	public void setScore_all(double score_all) {
		this.score_all = score_all;
	}
	
	
}
