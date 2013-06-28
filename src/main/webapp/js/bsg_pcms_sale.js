// 가격표시 객체
function BsgNumeric() {};
BsgNumeric.prototype = {
	autoNumeric: function(target) {
		if(jQuery.type(target) === "string"){
			$(target).autoNumeric('init',{aPad: false });
		}else{
			target.autoNumeric('init',{aPad: false });
		}
	},
};
// 생성자 명시????????
BsgNumeric.prototype.construnctor = BsgNumeric;

	
// 메뉴 셀렉터

function MenuSelector() {};
MenuSelector.prototype = {
	selectedValue : '',
	changeValue : function(menu, hiddenTarget, value) {
		this.selectedValue = value;
		$(menu).first().text(value);
		$(hiddenTarget).val(value);
		this.toString();
	},

	toString : function(){
		console.log(this.selectedValue);
	}
}; //
// 생성자 명시????????
// BsgNumertic.prototype.construnctor = BsgNumertic;
	
// 달력 
function BsgCalendar() {};
BsgCalendar.prototype = {
	calendar : '',
	strDate : '',
	endDate : '',
		
	eventListen : function(target) {
		calendar = $(target).datepicker({
			autoclose: true,
			 format : 'yyyy-mm-dd'
		});
		return this;
	},
	checkStartEndDate : function(strDateName, ednDateName){
		calendar.on('changeDate', function(ev){
			// 시작일 
			if( strDateName === $(this).attr("name") ) {
				strDate = ev.date.valueOf();
			}
			// 종료일
			if( ednDateName === $(this).attr("name") ) {
				endDate = ev.date.valueOf();
			}
			// 시작일 종료일 체크
			if( strDate > endDate ) {
				bootbox.alert( "계약종료일 재설정" );
				$( this ).val( "" );
			}
		});
	}	
};  // 달력 EDN
