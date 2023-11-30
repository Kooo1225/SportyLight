function MyListTemplate(mylist) {

	let localDateTime = mylist.dateTime;

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
		<div class="mylist-wrapper mx-auto">
			<div class="d-flex">
				<div class="mr-auto">
					<div class="mylist-title">
						<span class="mylist-title-main">${mylist.title }</span> 
						<span class="mylist-title-type">${mylist.type }</span>
					</div>
				</div>

				<div class="p-2">
					<a href="/board/modify?gatheringId=${mylist.gatheringId}" class="btn btn-primary" role="button">
						<i class="fa-regular fa-pen-to-square"></i> 수정
					</a>
				</div>
				
				<div class="p-2">
					<a href="#" class="btn btn-danger remove" onclick="remove(${mylist.gatheringId})">
						<i class="fas fa-trash-alt"></i> 삭제
					</a>
				</div>
			</div>
			
			<div class="mylist-dateTime">
				${mylist.cnt} / ${mylist.headCount}명 | ${formattedDate}
			</div>
			
			<div class="d-flex justify-content-between mb-3">
				<div class="p-2 mylist-description"></div>
				<div class="mylist-state-box"></div>
			</div>
		</div>
			
		
	`;
}

function MyStateTemplate(mystate) {
	let stateCount = Object(mystate).length;
	console.log(mystate);
	
	let localDateTime = mystate.dateTime;

	// LocalDateTime에서 날짜 정보 추출
	let year = localDateTime.year;
	let month = localDateTime.monthValue;
	let day = localDateTime.dayOfMonth;
	let hour = localDateTime.hour;
	let minute = localDateTime.minute;
	let second = localDateTime.second;	

	let date = new Date(year, month - 1, day, hour, minute, second);
	
	let formattedDate = `${year}년 ${month}월 ${day}일 ${hour}시${minute}분`;
	
	let state;
	
	if(`${mystate.state}` == 0) {
	  state=`<div class="mylist-state"> 승인중.. </div>`;
	}else if(`${mystate.state}` == 1) {
	  state=`<div class="mylist-state"> 승인완료 </div>`;
	}else if(`${mystate.state}` == -1) {
	  state=`<div class="mylist-state"> 다음기회에! </div>`;
	}else if(`${mystate.state}` == 3) {
	  state=`<div class="mylist-state"> 모임글 삭제됨 </div>`;
	}
	return `
		<div class="mylist-wrapper mx-auto">
			<div class="d-flex">
				<div class="mr-auto">
					<div class="mylist-title">
						<span class="mylist-title-main">${mystate.title }</span> 
						<span class="mylist-title-type">${mystate.type }</span>
					</div>
				</div>
				
				<div class="p-2">
					<a href="#" class="btn btn-danger delete" onclick="deleteMyState(${mystate.gatheringId}, ${mystate.membersId})">
						<i class="fa-solid fa-xmark"></i> 신청취소
					</a>
				</div>
			</div>
			
			<div class="mylist-dateTime">
				${mystate.cnt} / ${mystate.headCount} 명| ${formattedDate}
			</div>
			
			<div class="d-flex justify-content-between mb-3">
				<div class="p-2 mylist-description"></div>
				<div class="mylist-state-box">${state}</div>
			</div>
		</div>
		

	`;
	
}