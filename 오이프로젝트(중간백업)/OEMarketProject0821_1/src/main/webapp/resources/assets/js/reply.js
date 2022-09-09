console.log('Relpy Module....')

var replyService = ( function() {

    function add(reply, callback, error){
        console.log("add reply.............");

        $.ajax({
            type : 'post' ,               
            url : '/replies/new',       
            data : JSON.stringify(reply),
            contentType : "application/json; charset = utf-8",
            success : function( result, status, xhr){
                if(callback){                 
                    callback(result);
                }
            },
            error : function( xhr, status,err){
                if(error){
                    error(err);
                }
            }
        });
     } // end for add
    
    function getList(param, callback, error){
        var bo_num = param.bo_num;
        var page = param.page || 1;

        $.getJSON("/replies/pages/" + bo_num + "/" + page + ".json" ,
            function(data){
                if(callback) {
                    callback(data);
                }

            }).fail(function(xhr, status, err){
                if(error) {
                    error(err);
                }
            });
    } //end for getList

    function remove(re_num, callback, error){
            $.ajax({
                type : 'delete',
                url : '/replies/' + re_num,
                success : function( deleteResult, status, xhr){
                    if(callback) callback(deleteResult);
                },
                error : function( xhr, status, err){
                    if(error) error(err);
                }
            });
    }  // end for remove

    function update(reply, callback, error){
            console.log("update............");

            $.ajax({
                type : 'put',
                url :  '/replies/'  + reply.re_num,
                data : JSON.stringify(reply),
                contentType : "application/json; charset=utf-8",
                success : function(result, status, xhr){
                    if(callback){
                        callback(result);
                    }
                },
                error : function( xhr, status, err){
                    if(error){
                        error(err);
                    }
                }
            });
    } //end for update

    function get(re_num, callback, error){
        console.log("get............");

        // $.ajax({
        //     type : 'get',
        //     url :  '/replies/get/'  + re_num,
        //     success : function(result, status, xhr){
        //         if(callback){
        //             callback(result);
        //         }
        //     },
        //     error : function( xhr, status, err){
        //         if(error){
        //             error(err);
        //         }
        //     }
        // });
        $.get("/replies/get/" + re_num +  ".json" ,
            function(data){
                if(callback) {
                    callback(data);
                }

            }).fail(function(xhr, status, err){
                if(error) {
                    error(err);
                }
            });
    } // end for get

    function displayTime(timeValue){
        var today = new Date();
        var gap = today.getTime() - timeValue;
        var dateObj = new Date(timeValue);
        var str = "";
        
        if(gap < 60*60*24*1000){
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

            return [ (hh>9 ? '' : '0' ) + hh,  ' : ',   (mi>9? '' : '0')+mi, ' : ' , (ss>9? ' ' : '0')+ss  ].join(' ');
        }else{
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth()+1;
            var dd  = dateObj.getDay();

            return [yy , '/' , (mm>9? ' ' : '0') + mm, '/', (dd>9? ' ' : '0')+ dd].join(' ');
        }
    } // end for displayTime
    
    return {  // 함수를 객체로 만들어 리턴한다.
    	add : add,
        getList : getList,
        remove : remove,
        update : update,
        get : get,
        displayTime : displayTime
    };  

})();