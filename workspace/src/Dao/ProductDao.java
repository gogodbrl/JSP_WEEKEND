package Dao;

import java.util.ArrayList;
import java.util.List;

import Bean.Product;

/*************************************
 * No Database Connection
 ************************************/
public class ProductDao {
	
	/*************************************
	 * Construct
	 ************************************/
	public ProductDao() {}
	
	/*************************************
	 * GetProductList
	 ************************************/
	public List<Product> GetProductList(){
		
		List<Product> lists = new ArrayList<Product>();
		
		Product iphone = new Product();
		Product android = new Product();
		
		iphone.SetProduct(1, "아이폰", 100, 10000000, "휴대폰-아이폰");
		android.SetProduct(2, "안드로이드", 2, 50000, "휴대폰-안드로이드");
		
		lists.add(iphone);
		lists.add(android);
		
		if(lists !=null && lists.size() >= 0) {
			return lists;
		}
		return null;
	}
	/*************************************
	 * GetProductList
	 ************************************/
	public List<Product> GetProductExample(){
		
		List<Product> lists = new ArrayList<Product>();
		
		Product apple = new Product();
		Product persimmon = new Product();
		
		apple.SetProduct("사과", 10, 2000, 0.1);
		persimmon.SetProduct("감", 30, 1000, 0.15);
		
		lists.add(apple);
		lists.add(persimmon);
		
		if(lists !=null && lists.size() >= 0) {
			return lists;
		}
		return null;
	}
	
}
