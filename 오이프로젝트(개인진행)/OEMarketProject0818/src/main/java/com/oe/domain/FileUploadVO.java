package com.oe.domain;

import lombok.Data;

/*
CREATE TABLE FILEUPLOAD (
	bo_num NUMBER,
	file_num NUMBER PRIMARY KEY,
	file_original VARCHAR2(500),
	file_size NUMBER,
	file_category VARCHAR2(150) DEFAULT 1,
	CONSTRAINT fk_file_num  FOREIGN KEY (bo_num) REFERENCES MARKETBOARD (bo_num)
	ON DELETE CASCADE
);
*/

@Data
public class FileUploadVO {
	private String file_num, file_original, file_category;
	private Long file_size,bo_num;
}