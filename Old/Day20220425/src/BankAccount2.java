
public class BankAccount2 { //클래스  --> 클래스 설계는 추상화 개념
	int balance;
	
	int deposit(int amount) {   //입금
		
		if(amount<0)
			return 0;
		
		balance += amount;
		
		return balance;
		
	}
	
	int withdraw(int amount) { //출금
		balance -= amount;
		return balance;
	}
	
	int checkBalance() {     //잔고확인
		System.out.println("잔액 : "+ balance);
		
		return 0;
	}
}

class MainClass2{
	public static void main(String[] args) {
		
		BankAccount2[] bank = new BankAccount2[3]; // 이것만 한다고 되지 않음!

		bank[0] = new BankAccount2();   //여기까지 해줘야함!
		bank[1] = new BankAccount2();
		bank[2] = new BankAccount2();
		
		bank[0].deposit(10000);
		bank[0].withdraw(3000);
		bank[0].checkBalance();
		
		System.out.println(bank[0].checkBalance());
	}
}

//잔액 : 10000
//잔액 : 7000