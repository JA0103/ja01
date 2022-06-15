import java.util.Arrays;

class Exercise7_19 {
	public static void main(String args[]) {
	Buyer b = new Buyer();
	b.buy(new Tv1());
	b.buy(new Computer());
	b.buy(new Tv1());
	b.buy(new Audio());
	b.buy(new Computer());
	b.buy(new Computer());
	b.buy(new Computer());
	b.summary();
	}
}

//물건 p 장바구니 cart[] 장바구니 index는 i 
class Buyer {
	int money = 1000;
	Product[] cart = new Product[3]; 
	int i = 0; //장바구니 인덱스
	
	void buy(Product p) {
		if(money > p.price) {
			money-=p.price;
			add(p);  //장바구니 저장(호출)_
		}
		else if(money<p.price) {
			System.out.printf("잔액이 부족하여 %s를 살 수 없습니다.%n",p);
			return;
		}
	}
	
	void add(Product p) {
	
		if(i>=cart.length) {
			Product[] tmp = new Product[cart.length*2];
			System.arraycopy(cart, 0, tmp, 0, cart.length);
			cart = tmp;
		}
		cart[i]=p;
		i++;
		System.out.println(Arrays.toString(cart));

	}
	
	void summary() {
		
		int useMoney = 0;
		String list =" ";
		for(i=0;i<cart.length;i++) {
			
			System.out.println(cart[i].price);
			
			if(i<cart.length-1)
				list += cart[i]+",";
			else
				list+=cart[i];
			useMoney += cart[i].price;
		}
		
		System.out.println("구입한 물건 :"+ list);
		System.out.println("사용한 금액 : "+useMoney);
		System.out.println("남은  금액 : "+ money);
		
	}
}


class Product {
	int price; // 제품의 가격
	Product(int price) {
		this.price = price;
	}
}

class Tv1 extends Product {
	Tv1() { super(100); }
	
	public String toString() { return "Tv"; }
	
}

class Computer extends Product {
	Computer() { super(200); }
	
	public String toString() { return "Computer";}
	
}

class Audio extends Product {
	Audio() { super(50); }
	
	public String toString() { return "Audio"; }
	
}





