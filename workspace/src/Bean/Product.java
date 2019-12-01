package Bean;

public class Product {
	/*************************************
	 * Static
	 ************************************/
	private static String FMT_PRODUCT_TOSTRING = "Member [id=%s, name=%s, stock=%s, price=%s, category=%s]";
	
	/*************************************
	 * Variable
	 ************************************/
	private int id;
	private String name;
	private int stock;
	private int price;
	private String category;
	private double sale;
	
	/*************************************
	 * toString
	 ************************************/
	@Override
	public String toString() {
		return String.format(FMT_PRODUCT_TOSTRING, id, name, stock, price, category);
	}

	/*************************************
	 * SetProduct(int id, String name, int stock, int price, String category)
	 * SetProduct(String name, int stock, int price, double sale)
	 ************************************/
	public void SetProduct(int id, String name, int stock, int price, String category) {
		setId(id);
		setName(name);
		setStock(stock);
		setPrice(price);
		setCategory(category);
	}
	public void SetProduct(String name, int stock, int price, double sale) {
		setName(name);
		setStock(stock);
		setPrice(price);
		setSale(sale);
	}
	/*************************************
	 * Getter & Setter
	 ************************************/
	public double getSale() {
		return sale;
	}

	public void setSale(double sale) {
		this.sale = sale;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
