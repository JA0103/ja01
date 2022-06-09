function insertCheck(){
	if(document.frm.custno.value.length == 0) {
  	alert("번호가 입력되지 않았습니다.");
    frm.custno.focus();
    return false;
  }
  if(document.frm.custname.value == "") {
  	alert("이름이 입력되지 않았습니다.");
    frm.custname.focus();
    return false;
  }
  if(document.frm.phone.value == "") {
  	alert("전화번호가 입력되지 않았습니다.");
    frm.phone.focus();
    return false;
  }
  if(document.frm.address.value == "") {
  	alert("주소가 입력되지 않았습니다.");
    frm.address.focus();
    return false;
  }
  if(document.frm.joindate.value == "") {
  	alert("날짜가 입력되지 않았습니다.");
    frm.joindate.focus();
    return false;
  }
  if(document.frm.grade.value == "") {
  	alert("등급이 입력되지 않았습니다.");
    frm.grade.focus();
    return false;
  }
  if(document.frm.city.value == "") {
  	alert("도시코드가 입력되지 않았습니다.");
    frm.city.focus();
    return false;
  }
  return true;
}