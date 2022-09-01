function InsetClassCheck(){
	if(document.frm.class_seq.value.length == 0){
		alert('순번이 입력되지 않았습니다.');
		frm.class_seq.focus();
		return false;
	}
	if(document.frm.regist_month.value == ""){
		alert('개강월이 입력되지 않았습니다.');
		frm.regist_month.focus();
		return false;
	}
	if(document.frm.c_no.value == ""){
		alert('과정번호가 입력되지 않았습니다.');
		frm.c_no.focus();
		return false;
	}
	if(document.frm.class_area.value == ""){
		alert('캠퍼스가 입력되지 않았습니다.');
		frm.class_area.focus();
		return false;
	}
	if(document.frm.tution.value.length == 0){
		alert('수강료가 입력되지 않았습니다.');
		frm.tution.focus();
		return false;
	}
	if(document.frm.teacher_code.value == ""){
		alert('교사코드가 입력되지 않았습니다.');
		frm.teacher_code.focus();
		return false;
	}
}