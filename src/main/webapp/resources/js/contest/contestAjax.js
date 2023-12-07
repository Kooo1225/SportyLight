function createCardTemplate(list) {
	let style;
	
	switch (list.title) {
		case '마라톤':
			style="#7fccdd";
			break;
		case '축구':
			style="#8bcba0";
			break;
		case '농구':
			style="#ffb79a";
			break;
		case '야구':
			style="#fdabad";
			break;
		case '테니스':
			style="#c7aadf";
			break;
		case '배드민턴':
			style="#fbfac3";
			break;
		default:
			style="gray";
			break;
	}
	
	return `
		<div class="card">
			<div class="card-header" style="background: ${style}; border-radius: 12px 11px 0px 0px;">
				<div class="contest-title2">${list.association}</div>
			</div>
		
			<div class="card-body">
				<div class="contest-category">${list.title}</div>
				<div class="contest-site">사이트 링크
						<a href="${list.link}" class="contest-link">바로가기</a>
				</div>
			</div>
			
		</div>
	`;
}