
public class BankAccount { //클래스  --> 클래스 설계는 추상화 개념
	int balance;
	
	int deposit(int amount) {   //입금
		balance += amount;
		
		return balance;
		
	}
	
	int withdraw(int amount) { //출금
		balance -= amount;
		return balance;
	}
	
	void checkBalance() {     //잔고확인
		System.out.println("잔액 : "+ balance);
	}
}

class MainClass{
	public static void main(String[] args) {
		
		//아래 화면처럼 출력하기 위한 문장을 기술
		//System.out.println();   --> 문장 사용 금지
		
		BankAccount kim = new BankAccount();   //계좌 개설
		kim.deposit(10000);
		kim.checkBalance();
		
		kim.withdraw(3000);
		kim.checkBalance();
		System.out.println("-------------------------");

		//park
		BankAccount park = new BankAccount();
		park.deposit(5000);
		park.checkBalance();
		
		park.withdraw(500);
		park.checkBalance();
		
		System.out.println("-------------------------");
		//lee
		BankAccount lee = new BankAccount();
		lee.deposit(12000);
		lee.checkBalance();
		
		lee.withdraw(30000);
		lee.checkBalance();
		System.out.println("-------------------------");
		System.out.println("-------------------------");
		
		lee = kim;
		
		lee.checkBalance();
		lee.deposit(10000);
		kim.checkBalance();
		park.checkBalance();
		
		
		
		
	}
}

//잔액 : 10000
//잔액 : 7000