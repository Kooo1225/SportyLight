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
	<div class="card">
	
    	<div class="card-header">
		    <div class="mylist-title" onclick="getChatting(${mylist.gatheringId})" style="cursor:pointer;">${mylist.title}</div>
    	</div>
    
    	<div class="card-body">
    		<div class="mylist-category">카테고리 : ${mylist.type}</div>
    		<div class="mylist-state">참여 인원 : ${mylist.participate} / ${mylist.headCount} 명</div>
    		<div class="mylist-datetime">날짜 : ${formattedDate}</div>
    	</div> 
    
    	<div class="card-footer">
    		<button class="btn7 btn--stripe btn--radius" onclick="location.href='/board/detail?gatheringId=${mylist.gatheringId}';" style="cursor:pointer;">관리</button>
    		<button class="btn8 btn--radius" onclick="remove(${mylist.gatheringId})" style="cursor:pointer;">삭제</button>
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
	  state=`<button class="btn5 btn--stripe btn--radius">신청중..</button>`;
	}else if(`${mystate.state}` == 1) {
	  state=`<button class="btn5 btn--stripe btn--radius">승인완료</button>`;
	}else if(`${mystate.state}` == -1) {
	  state=`<button class="btn5 btn--stripe btn--radius">다음기회에</button>`;
	}else if(`${mystate.state}` == 3) {
	  state=`<button class="btn5 btn--stripe btn--radius">모임글 삭제됨</button>`;
	}
	return `
	<div class="card">
	
    	<div class="card-header">
    		<div class="mylist-title" onclick="getState(${mystate.membersId}, ${mystate.gatheringId})">${mystate.title }</div>
    	</div>
    
    	<div class="card-body">
    		<div class="mylist-category">카테고리 : ${mystate.type}</div>
    		<div class="mylist-state">참여 인원 : ${mystate.participate} / ${mystate.headCount} 명</div>
    		<div class="mylist-datetime">날짜 : ${formattedDate}</div>
    	</div> 
    
    	<div class="card-footer">
    		${state}
    		<button class="btn6 btn--radius" onclick="deleteMyState(${mystate.gatheringId}, ${mystate.membersId})" style="cursor:pointer;">신청 취소</button>
    	</div>
    </div>
	`;
	
}
