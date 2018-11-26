package detail.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Detail_QnAPaging {
	private int currentPage;	//현재페이지
	private int pageBlock;	//[이전][1][2][3][다음]
	private int pageSize;	//1페이지당 5개씩
	private int totalA;	//총글수
	private StringBuffer pagingHTML;
	
	public void detail_QnA_makePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;	//����������
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) {
			endPage = totalP;
		}
		if(startPage > pageBlock) {
			pagingHTML.append("<li class='page-item disabled'><a class='page-link' href='#?pg="+(startPage-1)+"' tabindex='-1'>Pervious</a></li>");
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='#'>"+i+"</a></li>");
			}
			else {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='#'>"+i+"</a></li>");
			}
		}
		if(endPage < totalP) {
			pagingHTML.append("<li class='page-item disabled'><a class='page-link' href='#?pg="+(endPage+1)+"' tabindex='-1'>Next</a></li>");
		}
	}
	
	public void detail_QnA_SearchmakePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;	//����������
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) {
			endPage = totalP;
		}
		if(startPage > pageBlock) {
			pagingHTML.append("<li class='page-item disabled'><a class='page-link' href='#?pg="+(startPage-1)+"' tabindex='-1'>Pervious</a></li>");
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='#'>"+i+"</a></li>");
			}
			else {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='#'>"+i+"</a></li>");
			}
		}
		if(endPage < totalP) {
			pagingHTML.append("<li class='page-item disabled'><a class='page-link' href='#?pg="+(endPage+1)+"' tabindex='-1'>Next</a></li>");
		}
	}
}
