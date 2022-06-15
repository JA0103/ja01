package com.Tv;

public class TVCR extends Tv implements IVCR {

		VCR vcr = new VCR();
		
		public static void main(String[] args) {
			TVCR tv = new TVCR();
			tv.play();
			tv.setCounter(10);
			System.out.println(tv.getCounter());
			
		} 

		@Override
		public void play() {vcr.play();}

		@Override
		public void stop() {vcr.stop();}

		@Override
		public void reset() {vcr.reset();}

		@Override
		public int getCounter() {return vcr.getCounter();}

		@Override
		public void setCounter(int c) {vcr.setCounter(c);}
	
	}


