package com.inc.util;

public class Pager {
	//한 페이지에 뿌려줄 게시물 리스트의 수
	public static final int BOARDS = 5;
	//한  페이지에 뿌려줄 페이지 버튼의 수
	public static final int PAGES = 5;
	
	public static String paging(int page, int total) {
		int totalPage = (int)Math.ceil(total / (double)BOARDS);
		StringBuffer sb = new StringBuffer();
		
		//왼쪽화살표
		if(page == 1) {
			sb.append("<li class='disabled'>");
			sb.append("<a>");
			sb.append("<span class='glyphicon glyphicon-chevron-left'></span>");
			sb.append("</a>");
			sb.append("</li>");
		} else {
			sb.append("<li>");
			sb.append("<a href='?page="+(page-1)+"'>");
			sb.append("<span class='glyphicon glyphicon-chevron-left'></span>");
			sb.append("</a>");
			sb.append("</li>");
		}
		//시작페이지, 끝페이지
		int startPage = page - (page-1)% PAGES;
		int endPage = startPage + PAGES - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		
		for(int i = startPage; i <= endPage; i++ ) {
			if(page == i) {
				sb.append("<li class='active'>");
				sb.append("<a>"+i+"</a>");
				sb.append("</li>");
			} else {
				sb.append("<li>");
				sb.append("<a href='?page="+i+"'>"+i+"</a>");
				sb.append("</li>");
			}
		}
		
		if(page == totalPage) {
			sb.append("<li class='disabled'>");
			sb.append("<a>");
			sb.append("<span class='glyphicon glyphicon-chevron-right'></span>");
			sb.append("</a>");
			sb.append("</li>");
		} else {
			sb.append("<li>");
			sb.append("<a href='?page="+(page+1)+"'>");
			sb.append("<span class='glyphicon glyphicon-chevron-right'></span>");
			sb.append("</a>");
			sb.append("</li>");
		}
		
		return sb.toString();
	}
}
