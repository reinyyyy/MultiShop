
package mypage.bean;

import lombok.Data;

@Data
public class DeliveryPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수

		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			//pagingHTML.append("<li class='page-item'><a class='page-link' href='/MultiShop/mypage/delivery.do?pg="+(startPage-1)+"' aria-label='Previous' id='paging'><span aria-hidden='true'>&laquo;</span><span class='sr-only'>Previous</span></a></li>");
			pagingHTML.append("<li class='page-item'><a class='page-link' name="+(startPage-1)+" aria-label='Previous' id='paging'><span aria-hidden='true'>&laquo;</span><span class='sr-only'>Previous</span></a></li>");

		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				//pagingHTML.append("<li class='page-item'><a class='page-link' href='/MultiShop/mypage/delivery.do?pg="+i+"' id='currentPaging'>"+i+"</a></li>");
				pagingHTML.append("<li class='page-item'><a class='page-link' href='javascript:void(0)' id='currentPaging'>"+i+"</a></li>");
			}else {
				//pagingHTML.append("<li class='page-item'><a class='page-link' href='/MultiShop/mypage/delivery.do?pg="+i+"' id='paging'>"+i+"</a></li>");
				pagingHTML.append("<li class='page-item'><a class='page-link' name="+i+" id='paging'>"+i+"</a></li>");
			}
		}
		if(endPage < totalP) {
			//pagingHTML.append("<li class='page-item'><a class='page-link' href='/MultiShop/mypage/delivery.do?pg="+(endPage+1)+"' aria-label='Next' id='paging'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
			pagingHTML.append("<li class='page-item'><a class='page-link' name="+(endPage+1)+" aria-label='Next' id='paging'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
		}
	}
}

