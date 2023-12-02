async function rest_get(url) {
	try {
		let res = await fetch(url); //await fetch(url) : 비동기방식으로 url에 접속하겠다
		
		console.log(res);
		
		return await res.json();
	}
	catch(e) {
		console.log(e);
	}
}

async function rest_get2(url) {
	try {
		let res = await fetch(url); //await fetch(url) : 비동기방식으로 url에 접속하겠다
		
		console.log(res);
		
	}
	catch(e) {
		console.log(e);
	}
}

async function rest_delete(url) {
  try {
    let res = await fetch(url, { method: "DELETE" });
    return await res.text();	// res.json();
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

	console.log(data);

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

async function rest_post2(url, gatheringId, membersId) {
	const data = {
		gatheringId: gatheringId,
		membersId: membersId
	};

	console.log(data);

	try {
		let res = await fetch(url, {
			method : "POST",
			headers : { "Content-Type" : "application/json" },
			body: JSON.stringify(data), 
		});

	}
	catch(e) {
		console.log(e);
	}		
}