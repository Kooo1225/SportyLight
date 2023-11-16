function createListCountTemplate(count) {
	return `
		<span class="board-txt">모임</span> 
		<span class="board-total">${count} 건</span>
	`;
}

function createTypeListTemplate(gather) {
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
				
					<span class="board-title">${gather.title}</span> 
					<span class="board-category">${gather.type}</span> 
					
					<br>
					
					<span class="board-info">
						인원 ${gather.headCount} 명 | ${gather.dateTime}
					</span>
					
				</div>
			</div>
		</div>
	`;
}