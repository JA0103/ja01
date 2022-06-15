
public class Exercise07_1 {

	public static void main(String[] args) {

		SutdaDeck deck = new SutdaDeck();
		
		
		System.out.printf("original\n");
		for(int i=0;i<deck.cards.length;i++) {
			
			System.out.print(deck.cards[i]+",");
		}
		
//		deck.shuffle();
//		System.out.printf("\nshuffle\n");
//		for(int i=0;i<deck.cards.length;i++) {
//			
//			System.out.print(deck.cards[i]+",");
//		}
		System.out.println();
		System.out.println(deck.pick(2));
		System.out.println(deck.pick());
	}

}


class SutdaDeck{

	final int CARD_NUM = 20;
	SutdaCard[] cards = new SutdaCard[CARD_NUM];

		public SutdaDeck() {
			for(int i=0; i<cards.length;i++) {
				int num = i%10+1;  //1-10 까지 두번 나올 수 있다. 
				boolean isKwang = i<10 && (num==3||num==1||num==8);
						
				cards[i] =new SutdaCard(num,isKwang);
			}
		}
	
		
		void shuffle() {
		//  배열 cards에 담긴 카드의 위치를 뒤섞는다. 랜덤사용	
			for(int i =0; i<cards.length;i++) {
				int j = (int)(Math.random()*cards.length);
				SutdaCard tmp = cards[i];
				cards[i] = cards[j];
				cards[j] = tmp;
			}
		}
		
		SutdaCard pick(int index) {
			//배열 cards에서 지정된 위치의 sutdaCard를 반환한다.
				
			if(index>20 || index<0)
				return null;
			
			return cards[index];
		}
		
		SutdaCard pick() {
			//배열 cards에서 임의의 위치의 SutdaCArd를 반환한다. 랜덤사용 
				int i=(int)(Math.random()*cards.length);
				return cards[i];
		}
		
		
}

class SutdaCard{
		int num;
		boolean isKwang;
		
		
		SutdaCard() {
			this(1,true);
		}
		
		SutdaCard(int num, boolean isKwang){
			this.num=num;
			this.isKwang = isKwang;
		}
	
		@Override
		public String toString() {
		return num +(isKwang ? "K":"");
		}
}
