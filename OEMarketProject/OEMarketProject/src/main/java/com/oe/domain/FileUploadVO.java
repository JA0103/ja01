package com.oe.domain;

import lombok.Data;

/*
create table fileUpload(
    bo_num number,
    file_num number PRIMARY KEY,
    file_original varchar2(500),
    file_size number,
    file_category varchar2(50) default 1,
    CONSTRAINT fk_file_num  FOREIGN KEY (bo_num) REFERENCES marketboard (bo_num)
    on delete cascade
);
*/

@Data
public class FileUploadVO {
	
	private String file_num, file_original, file_category;
	private Long file_size,bo_num;
	
	
}