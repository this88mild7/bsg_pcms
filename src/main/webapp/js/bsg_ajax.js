/**
* 통신 서비스
* json : response to json
* object : response to html
* @param        url
* @param        data
* @param        r_call
* @param        e_call
*/

function BsgRequest(){}
BsgRequest.prototype = {
	json:function (url, param, r_call, e_call) { 
		$.ajax({
				'type': 'POST',
				'url': url,
				"contentType": "application/x-www-form-urlencoded; charset=utf-8",
				'dataType': 'json',
				'data': param,
				'traditional': true,
				'success': function (response) {
					r_call(response, param);
				},
				'error': function (xhr,status,error) {
					e_call(status,error);
				}
		});
	},
	object:function (url, param, r_call, e_call) {
		$.ajax({
				'cache' : false,
				'async' : false,
				'type' :'POST',
				'url'  : url,
				'data': param,
				'dataType': 'text',
				"contentType": "application/x-www-form-urlencoded; charset=utf-8",
				'success': function (response) {
					r_call(response, param);
				},
				'error': function (xhr,status,error) {
					e_call(status,error);
				}
			});
	},
	form:function (div, url, param, r_call, e_call) {
		var options = { 
		        success     : r_call,
		        error		: e_call,
		        url         : url,
		        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		        type        : "post", /* get, post */
		        dataType    : "html"
		    };
		 $("#searchForm").ajaxSubmit( options );
	}
};