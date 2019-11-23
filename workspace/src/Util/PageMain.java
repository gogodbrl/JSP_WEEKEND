package Util;

public class PageMain {
	
	public static void main(String[] args) {
		String pageNumber = "1";
		String pageSize = "10";
		int totalCount = 250;
		String url = "../board/selectBoardAll.jsp";
		
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
		pageInfo.getPagingHtml(url);
	}
}

