console.log('Reply Module...')

var replyService=(function(){
  
    // 실행할 함수 정의하는 공간.
    function add(reply, callback, error){
        console.log("add reply..........");

        $.ajax({
            type:'post',         // 전송방식
            url:'../replies/new',   // url 주소
            data:JSON.stringify(reply),  // 문자열 자체를 json 형태로 바꿔라
            contentType:"application/json; charset=utf-8",
            success:function(result,status,xhr){
                if(callback){           // status : 상태정보, xhr : 통신객체정보(비동기 데이터 전송요청)
                    callback(result);
                }
            },
            error:function(xhr,status,err){
                if(error){
                    error(err);
                }
            }
        });
    }//end for add
    
    function getList(param, callback, error){
    	var bno = param.bno;
    	var page = param.page || 1; //페이지 값이 없거나 넘겨주지 않았을 때 1로 
    	
    	$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
    		function(data){
    			if(callback){
    				callback(data);
    			}
    			
    		}).fail(function(xhr, status, err){
    			if(error){
    				error(err);
    			}
    		});
    	
    } //end for getList
    
function remove(rno, callback, error){
        $.ajax({
            type:'delete',
            url:'/replies/'+rno,
            success:function(deleteResult, status,xhr){
                if(callback) callback(deleteResult);
            },
            error:function(xhr,status,err){
                if(error) error(err);
            }
        });
    } //end for remove


	function update(reply, callback, error){
		console.log("update............");
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}//end for update


	function get(rno, callback, error){
		console.log("get............");
	/*	
	 $.ajax({
            type:'get',
            url:'/replies/get/' + rno,
            success:function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error:function(xhr, status, err){
                if(error){
                    error(err);
                }
            }
        });
        */
        
	$.get("/replies/get/"+ rno + ".json",
        function(data){
            if(callback){
                callback(data);
            }
        }).fail(function(xhr,status,err){
            if(error){
                error(err);
            }
        });
        
	}//end for update




    return{
      add:add,
      getList : getList,
      remove : remove,
      update : update,
      get : get
   };    // 함수를 객체로 만들어서 리턴한다.


})();