package com.inc.util;

public class Pager {
	//한 페이지에 뿌려줄 게시물 리스트의 수
	public static final int BOARDS = 5;
	//한  페이지에 뿌려줄 페이지 버튼의 수
	public static final int PAGES = 5;
	
	public static String paging(String type,int page, int total) {
		int totalPage = (int)Math.ceil(total / (double)BOARDS);
		StringBuffer sb = new StringBuffer();
		
		//왼쪽화살표
		if(page == 1) {
			sb.append("<li class='paginate_button page-item previous disabled'>");
			sb.append("<a href='' aria-controls='dataTable' data-dt-idx='0' tabindex='0' class='page-link'>Previous</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='paginate_button page-item previous' id='dataTable_previous'>");
			sb.append("<a href='/board/"+type+"/list?page="+(page-1)+"' aria-controls='dataTable' data-dt-idx='0' tabindex='0' class='page-link'>Previous</a>");
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
				sb.append("<li class='paginate_button page-item active'>");
				sb.append("<a herf='' aria-controls='dataTable' data-dt-idx='"+i+"' tabindex='0' class='page-link'>"+i+"</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='paginate_button page-item'>");
				sb.append("<a href='/board/"+type+"/list?page="+i+"' aria-controls='dataTable' data-dt-idx='"+i+"' tabindex='0' class='page-link' >"+i+"</a>");
				sb.append("</li>");
			}
		}
		
		if(page == totalPage) {
			sb.append("<li class='paginate_button page-item next disabled'>");
			sb.append("<a href='' aria-controls='dataTable' data-dt-idx='0' tabindex='0' class='page-link'>Next</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='paginate_button page-item next' id='dataTable_next'>");
			sb.append("<a href='/board/"+type+"/list?page="+(page+1)+"' aria-controls='dataTable' data-dt-idx='5' tabindex='0' class='page-link'>Next</a>");
			sb.append("</li>");
		}
		
		return sb.toString();
	}
}
