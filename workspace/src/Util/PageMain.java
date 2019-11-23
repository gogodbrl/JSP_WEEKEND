package Util;

public class PageMain {
	
	public static void main(String[] args) {
		String pageNumber = "13";
		String pageSize = "10";
		int totalCount = 250;
		String url = "selectBoardAll.jsp";
		
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
		pageInfo.getPagingHtml(url);
		
	}
}

