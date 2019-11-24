package Util;

public class Paging {
	/*************************************
	 * Variable
	 ************************************/
	/** 전체 게시물 갯수 **/
	private int totalCount = 0;
	
	/** 전체 페이지 갯수 **/
	private int totalPage = 0;
	
	/** 현재 페이지 번호 **/
	private int pageNumber = 0;
	
	/** 가로로 쭉 나오는 Row 갯수 (기본 10개) **/
	private int pageSize = 0;
	
	/** 한 페이지에 나오는 시작,끝 게시물의 인덱스 번호 **/
	private int beginRow = 0;
	private int endRow = 0;
	
	/** 세로로 쭉 나오는 페이지 갯수 ( 기본 10개)  **/
	private int pageCount = 10;
	private int beginPage = 0;
	private int endPage = 0;
	
	private String url = "";
	private String pagingHtml = "";
	private String pagingStatus = "";
	
	/*************************************
	 * isEmpty
	 ************************************/
	public boolean IsEmpty(String str) {
		if(str == null) { return false; }
		if("null".equalsIgnoreCase(str)) { return false; }
		if("".equalsIgnoreCase(str)) { return false; }
		return true;
	}
	
	/*************************************
	 * Construct
	 ************************************/
	public Paging(String _pageNumber, String _pageSize, int totalCount, String url) {
		if(IsEmpty(_pageNumber) == false) { _pageNumber = "1"; }
		if(IsEmpty(_pageSize) == false)	 { _pageSize = "10"; }
		
		/** 현재 보여줄 페이지 번호 **/
		this.pageNumber = Integer.parseInt(_pageNumber);
		/** 한 페이지에 나오게 할 게시물 갯수 **/
		this.pageSize   = Integer.parseInt(_pageSize);
		/** 전체 게시물 갯수 **/
		this.totalCount = totalCount;
		/** URL **/
		this.url = url;
		
		/** 전체 페이지 갯수 **/
		this.totalPage 	= (int) Math.ceil((double) totalCount / pageSize);
		
		/** 첫번째 값 : beginRow, 마지막 값 : endRow **/
		this.beginRow 	= (( pageNumber -1 ) * pageSize) + 1 ;
		this.endRow		= pageNumber * pageSize ;
		
		/** 페이지 첫번째 값 : beginPage, 페이지 마지막 값 : endPage **/
		this.beginPage 	= ((pageNumber -1) / (pageCount * pageCount)) + 1;
		this.endPage	= beginPage + pageCount - 1;
		if(this.endPage > this.totalPage) { this.endPage = totalPage; }
		
		this.pagingHtml = this.getPagingHtml(url);
		/** 총 13건 [1/2] **/
		this.pagingStatus =  String.format("총 %s건[%s/%s]", totalCount, pageNumber, totalPage);
		
		this.DisplayInformation();
	}
	
	/*************************************
	 * getPagingHtml()
	 ************************************/
	public String getPagingHtml() {
		return pagingHtml;
	}
	public String getPagingHtml(String url) {
		String result = "";
		
		String pagingLink = "<a href=%s?pageNumber=%s&pageSize=%s>%s</a>&nbsp;";
		String firstPage = String.format(pagingLink, url, 1, pageSize, "맨처음");
		String beforePage = String.format(pagingLink, url, (pageNumber -1), pageSize, "이전");
		String nextPage = String.format(pagingLink, url, (endPage + 1), pageSize, "다음");
		String lastPage = String.format(pagingLink, url, totalPage, pageSize, "맨끝");
		
		/** 맨처음, 이전 **/
		if(pageNumber <= pageCount) {
			result += "";
			result += "";
		} else {
			result += firstPage;
			result += beforePage;
		}

		/** 링크 영역 **/
		String test = "<a href=%s?pageNumber=%d&pageSize=%s>%d</a>&nbsp;";
		for(int index = beginPage; index <= endPage; index ++) {
			if(index == pageNumber) {
				String redBoldHtml = String.format("<font color='red'><b>%d</b></font>", index); 
				result += String.format(pagingLink, url, index, pageSize, redBoldHtml);
			} else {
				String linkPage = String.format(test, url, index, pageSize, index);
				result += linkPage;
			}
		}
		
		/** 다음, 맨끝 **/
		if(pageNumber >= (totalPage/ pageCount * pageCount + 1)) {
			result += "";
			result += "";
		} else {
			result += nextPage;
			result += lastPage;
		}
		return result;
	}
	
	/*************************************
	 * DisplayInformation
	 ************************************/
	public void DisplayInformation() {
		System.out.println("------------------------------------");
		System.out.println("totalCount		: " + totalCount);
		System.out.println("totalPage		: " + totalPage);
		System.out.println("pageSize 		: " + pageSize);
		System.out.println("pageCount 		: " + pageCount);
		System.out.println();
		System.out.println("pageNumber 		: " + pageNumber);
		System.out.println("beginPage 		: " + beginPage);
		System.out.println("endPage 		: " + endPage);
		System.out.println("beginRow 		: " + beginRow);
		System.out.println("endRow 			: " + endRow);
		System.out.println();
		System.out.println("url 			: " + url);
		System.out.println("pagingHtml 		: " + getPagingHtml(url));
		System.out.println("pagingStatus 		: " + pagingStatus);
		System.out.println("------------------------------------");
	}
	
	/*************************************
	 * Getter & Setter
	 ************************************/
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBeginRow() {
		return beginRow;
	}
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	public String getPagingStatus() {
		return pagingStatus;
	}
	public void setPagingStatus(String pagingStatus) {
		this.pagingStatus = pagingStatus;
	}
	
	
}
