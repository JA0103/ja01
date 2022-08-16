package com.oe.domain;


public class PageDTO {
   private int startPage;
   private int endPage;
   private boolean prev, next;
   
   private int total;
   private CriteriaVO cri;

   public PageDTO(CriteriaVO cri, int total) {
      this.cri = cri;
      this.total = total;
                     //ceil : 올림
      this.endPage =(int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
      this.startPage = endPage-9;
                     //      소수점 붙여주기위해 *1.0
      int readEnd =(int)(Math.ceil(total*1.0)/cri.getAmount());

      if(endPage>readEnd) {
         endPage = readEnd;
      }
      
      this.prev = this.startPage > 1;
      this.next = this.endPage < readEnd;
      
      
   }

   public int getStartPage() {
      return startPage;
   }

   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }

   public boolean isPrev() {
      return prev;
   }

   public void setPrev(boolean prev) {
      this.prev = prev;
   }

   public boolean isNext() {
      return next;
   }

   public void setNext(boolean next) {
      this.next = next;
   }

   public int getTotal() {
      return total;
   }

   public void setTotal(int total) {
      this.total = total;
   }

   public CriteriaVO getCri() {
      return cri;
   }

   public void setCri(CriteriaVO cri) {
      this.cri = cri;
   }
}