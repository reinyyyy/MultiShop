$(document).ready(function(){
	
	$('.w20per').on('click','a',function(){
		$('.w20per a').removeClass('now');
		$(this).addClass('now');
	});
	
	$(document).on('click','.btn-h52-blue', function(){ /*파란 버튼 클릭 시*/

		var p_status = $('.search_prd_display').val();
		var p_name = $('.search_keyword').val();
		
		var p_startDate = $('#datepicker1').val();
		if(p_startDate==''){	/*유효성 검사*/
			p_startDate='1900-01-01';
		}
		
		var p_lastDate = $('#datepicker2').val().split('-');
		p_lastDate = p_lastDate[0]+p_lastDate[1]+p_lastDate[2];
		
		$.ajax({
			type : 'POST',
			url : '../manage/productListsJson.do',
			data : {'p_status':p_status, 'p_name':p_name, 'p_startDate':p_startDate, 'p_lastDate':p_lastDate},
			dataType : 'json',
			success : function(data) {
				alert(p_lastDate);
				$('.non-data').remove();
				$('#pc_prd_row tr:gt(0)').remove();
				$.each(data.list, function(index, items){
					items.p_date.split(' ');
					items.p_date = items.p_date[0]+items.p_date[1]+items.p_date[2]+items.p_date[3]+items.p_date[4]+items.p_date[5]+items.p_date[6]+items.p_date[7]+items.p_date[8]+items.p_date[9];
					$('<tr/>')
					.append($('<td/>',{html : '<label class="single"><input type="checkbox" class="chk'+items.p_code+'"/><span><span></label>'}))
					.append($('<td/>',{text : items.p_code}))
					.append($('<td/>',{text : items.p_name}))
					.append($('<td/>',{text : items.p_cost}))
					.append($('<td/>',{text : items.p_status}))
					.append($('<td/>',{text : items.p_amount}))
					.append($('<td/>',{text : items.p_sales}))
					.append($('<td/>',{text : items.p_date}))
					.appendTo($('#pc_prd_row'));
				});
			}
		});
	});
});