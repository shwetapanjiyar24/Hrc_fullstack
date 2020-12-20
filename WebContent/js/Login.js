var x;
const Http = new XMLHttpRequest();


const url='http://localhost:4000/1706367/json';
data1={flag:1}
http();
function http(){
 axios.post(
		    url,
		    {},
		    {
		      headers: { 'Content-Type': 'application/json' },
		      params: {flag:1 },
		    }
		  )
		  .then(data=>{ x=data.data;
			console.log(data.data)})
				
}

var f=0;
var k=0;
function clickHandler()
{
	http()
	var name=document.getElementById('nameid').value;
	var pass=document.getElementById('pass').value;
	x.forEach((e)=>{
		if(e.username===name && e.password===pass)
			{f=1;
			
			if(e.user_level=="Level 1")
				{k=1;
				//window.open('Dashboard.jsp?page=1&myparam='+k+'&name='+name, "dashboard", "location=no");
				window.open('Dashboard.jsp?page=1&myparam='+k+'&name='+name);
				}
			else 
				{
				if(e.user_level=="Level 2")
					k=2;
				else
					k=3;
				//window.open('dashboard2.jsp?page=1&myparam='+k+'&name='+name, "dashboard", "location=no");
				window.open('dashboard2.jsp?page=1&myparam='+k+'&name='+name);
				
				
				}
				
			}
	});

	if(f===0)
		alert('wrong');
}