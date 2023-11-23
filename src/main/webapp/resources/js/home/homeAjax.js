function createListCountTemplate(count) {
	return `
		<span class="board-txt">모임</span> 
		<span class="board-total">${count} 건</span>
	`;
}

function createTypeListTemplate(gather) {
	let localDateTime = gather.dateTime;

	// LocalDateTime에서 날짜 정보 추출
	let year = localDateTime.year;
	let month = localDateTime.monthValue;
	let day = localDateTime.dayOfMonth;
	let hour = localDateTime.hour;
	let minute = localDateTime.minute;
	let second = localDateTime.second;	

	let date = new Date(year, month - 1, day, hour, minute, second);
	
	let formattedDate = `${year}년 ${month}월 ${day}일 ${hour}시${minute}분`;


	
	return `
		<div class="row" id="set1">
		
			<div class="col-4">
				<div class="sidebar-board-get">
					<img src="/resources/images/home/cat.jpeg" class="board-avatar" />
				</div>
			</div>
			
			<!---------------------------------------->
			<div class="col-8" id="detail">
			
				<div class="board-info-wrapper" style="width: 100%;">
				
					<span class="board-title"><a href="/board/detail?gatheringId=${gather.gatheringId}">${gather.title}</a></span> 
					<span class="board-category">${gather.type}</span> 
					
					<br>
					
					<span class="board-info">
						인원 ${gather.headCount} 명 | ${formattedDate}
					</span>
					
				</div>
			</div>
		</div>
	`;
}