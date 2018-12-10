package category.bean;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CategoryPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private String p_name;	//검새거
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수

		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock) {
			//pagingHTML.append("[<a id='paging' onclick='categoryList("+(startPage-1)+")'>이전</a>]");
			pagingHTML.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\" onclick='categoryList_go("+(startPage-1)+",  "+pageSize+")' tabindex=\"-1\">이전</a></li>");
		}else {
			pagingHTML.append("<li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\" onclick='categoryList_go("+(startPage-1)+",  "+pageSize+")' tabindex=\"-1\">이전</a></li>");
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				//pagingHTML.append("[<a id='currentPaging' onclick='categoryList("+i+")'>"+i+"</a>]");
				pagingHTML.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#\" onclick='categoryList_go("+i+", "+pageSize+")'>"+i+ 
						"									<span class=\"sr-only\">(current)</span>\n" + 
						"							</a></li>");
			else
//				pagingHTML.append("[<a id='paging' onclick='categoryList("+i+")'>"+i+"</a>]");
				pagingHTML.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\" onclick='categoryList_go("+i+", "+pageSize+")'>"+i+"</a></li>");
		}
		
		if(endPage < totalP)
			//pagingHTML.append("[<a id='paging' onclick=categoryList("+(endPage+1)+"'>다음</a>]");
			pagingHTML.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\"onclick='categoryList_go("+(endPage+1)+", "+pageSize+")'>다음</a></li>");
	}

	public void makeSearchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수

		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock) {
			pagingHTML.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\" onclick='categoryList("+(startPage-1)+", \""+p_name+"\", "+pageSize+")' tabindex=\"-1\">이전</a></li>");
		}else {
			pagingHTML.append("<li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\" onclick='categoryList("+(startPage-1)+", \""+p_name+"\", "+pageSize+")' tabindex=\"-1\">이전</a></li>");
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#\" onclick='categoryList("+i+",\""+p_name+"\", "+pageSize+")'>"+i+ 
						"									<span class=\"sr-only\">(current)</span>\n" + 
						"							</a></li>");
			else
				pagingHTML.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\" onclick='categoryList("+i+",\""+p_name+"\", "+pageSize+")'>"+i+"</a></li>");
		}
		
		if(endPage < totalP)
			pagingHTML.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\"onclick='categoryList("+(endPage+1)+",\""+p_name+"\", "+pageSize+")'>다음</a></li>");
		
	}
}








