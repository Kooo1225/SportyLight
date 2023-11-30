async function rest_get(url) {
	try {
		let res = await fetch(url); //await fetch(url) : 비동기방식으로 url에 접속하겠다
		return await res.json();
	}
	catch(e) {
		console.log(e);
	}
}

async function rest_post(url, gatheringId, membersId) {
	const data = {
		gatheringId: gatheringId,
		membersId: membersId
	};

	try {
		let res = await fetch(url, {
			method : "POST",
			headers : { "Content-Type" : "application/json" },
			body: JSON.stringify(data), 
		});
				
		return await res.json();
	}
	catch(e) {
		console.log(e);
	}		
}