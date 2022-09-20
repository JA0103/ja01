function voteCheck(){
	if(document.frm.v_jumin.value == ''){
		alert('주민번호가 입력되지 않았습니다!');
		frm.v_jumin.focus();
		return false;
	}
	if(document.frm.v_name.value == ''){
		alert('성명이 입력되지 않았습니다!');
		frm.v_name.focus();
		return false;
	}
	if(document.frm.m_no.value == ''){
		alert('후보번호가 입력되지 않았습니다!');
		frm.m_no.focus();
		return false;
	}
	if(document.frm.v_time.value == ''){
		alert('투표시간이 입력되지 않았습니다!');
		frm.v_time.focus();
		return false;
	}
	if(document.frm.v_area.value == ''){
		alert('투표장소가 입력되지 않았습니다!');
		frm.v_area.focus();
		return false;
	}
	if(document.frm.v_confirm.value == ''){
		alert('유권자확인이 입력되지 않았습니다!');
		return false;
	}
	return true;
}