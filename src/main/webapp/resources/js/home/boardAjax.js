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
		<div class="mylist-gather-wrapper mx-auto">
			<div class="mylist-gather-title">
				<span class="mylist-gather-title-main">${mylist.title }</span> 
				<span class="mylist-gather-title-type">${mylist.type }</span>
			</div>
			<div class="mylist-gather-dateTime">
				${mylist.headCount}명 | ${formattedDate}
			</div>
			<div class="mylist-gather-description"> ${mylist.description}</div>
		</div>
	`;
}

function MyStateTemplate(mystate) {
	let stateCount = Object.keys(myState).length;
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
	return `
		<div class="mylist-gather-wrapper mx-auto">
			<div class="mylist-gather-title">
				<span class="mylist-gather-title-main">${mystate.title }</span> 
				<span class="mylist-gather-title-type">${mystate.type }</span>
			</div>
			<div class="mylist-gather-dateTime">
				${stateCount}명 | ${formattedDate}
			</div>
			<div class="mylist-gather-description"> ${mystate.description}</div>
			<div> 현재상태 ${mystate.state} </div>
		</div>
	`;
}