var play = play||{};

play.init = function (){
	
	play.my				=	1;				//Phía người chơi
	play.map 			=	com.arr2Clone (com.initMap);	//Khởi tạo bàn cờ
	play.nowManKey		=	false;		//Chơi ngay bây giờ
	play.pace 			=	[];			//Ghi lại các bước di chuyển	
	play.isPlay 		=	true ;			//có thể di chuyển
	play.mans 			=	com.mans;
	play.bylaw 			= 	com.bylaw;
	play.show 			= 	com.show;
	play.showPane 		= 	com.showPane;
	play.isOffensive	=	true;			//đi trước hay ko
	play.depth			=	play.depth || 3;		//đọ sâu tìm kiếm		
	
	play.isFoul			=	false;	//có vua hay ko
	
	audience = false;
	
	
	com.pane.isShow		=	 false;		//Khối vuông ẩn
	//Khởi tạo quân cờ
	for (var i=0; i<play.map.length; i++){
		for (var n=0; n<play.map[i].length; n++){
			var key = play.map[i][n];
			if (key){
				com.mans[key].x=n;
				com.mans[key].y=i;
				com.mans[key].isShow = true;
			}
		}
	}
	play.show();
	//Ràng buộc các sự kiện nhấp chuột
	if(playernum < 2)
		com.canvas.addEventListener("click",play.clickCanvas)
	
	
}
//Nhấp vào bàn cờ
play.clickCanvas = function (e){
	if (!play.isPlay) return false;
	var key = play.getClickMan(e);
	var point = play.getClickPoint(e);
	
	var x = point.x;
	var y = point.y;
	
	if (key){
		play.clickMan(key,x,y);	
	}else {
		play.clickPoint(x,y);	
	}
	play.isFoul = play.checkFoul();
}

//Nhấp vào quân cờ, trong hai trường hợp, hãy chọn hoặc lấy quân cờ
play.clickMan = function (key,x,y){
	var man = com.mans[key];
	//Ăn
	if (play.nowManKey&&play.nowManKey != key && man.my != com.mans[play.nowManKey ].my){
		//man quân cờ đã được lấy đi
		if (play.indexOfPs(com.mans[play.nowManKey].ps,[x,y])){

			man.isShow = false;
			var pace=com.mans[play.nowManKey].x+","+com.mans[play.nowManKey].y+','+x+','+y;
			//z(bill.createMove(play.map,man.x,man.y,x,y))
			delete play.map[com.mans[play.nowManKey].y][com.mans[play.nowManKey].x];
			play.map[y][x] = play.nowManKey;
			com.showPane(com.mans[play.nowManKey].x ,com.mans[play.nowManKey].y,x,y)
			com.mans[play.nowManKey].x = x;
			com.mans[play.nowManKey].y = y;
			com.mans[play.nowManKey].alpha = 1
			
			play.nowManKey = false;
			com.pane.isShow = false;
			com.dot.dots = [];
			com.show()
			com.get("clickAudio").play();
			if (key == "j0") play.showWin (-1);
			if (key == "J0") play.showWin (1);
			play.isPlay = false;
			send(pace);
		}
	}else{
		if (man.my===1){

			if (com.mans[play.nowManKey]) com.mans[play.nowManKey].alpha = 1 ;
			man.alpha = 0.6;
			com.pane.isShow = false;
			play.nowManKey = key;
			com.mans[key].ps = com.mans[key].bl(); 
			com.dot.dots = com.mans[key].ps
			com.show();
			com.get("selectAudio").play();
            
		}
	}
}
//Kích vào điểm
play.clickPoint = function (x,y){
	var key=play.nowManKey;
	var man=com.mans[key];
	if (play.nowManKey){
		if (play.indexOfPs(com.mans[key].ps,[x,y])){
			var pace=man.x+","+man.y+','+x+','+y;

			delete play.map[man.y][man.x];
			play.map[y][x] = key;
			com.showPane(man.x ,man.y,x,y)
			man.x = x;
			man.y = y;
			man.alpha = 1;
			play.pace.push(pace+x+y);
			play.nowManKey = false;
			com.dot.dots = [];
			com.show();
			com.get("clickAudio").play();
            play.isPlay = false;
			send(pace);
		}else{
			alert("Ko the di nhu the nay dòng 123")	
		}
	}
	
}

play.AIPlay = function (pace){

	play.my = -1 ;

	if (!pace) {
		play.showWin (1);
		return ;
	}
	
	var key=play.map[pace[1]][pace[0]]
		play.nowManKey = key;
	
	var key=play.map[pace[3]][pace[2]];
	if (key){
		play.AIclickMan(key,pace[2],pace[3]);	
	}else {
		play.AIclickPoint(pace[2],pace[3]);	
	}
	com.get("clickAudio").play();
	
}

//di chuyen tu đong
play.audienceplay = function (pace, num){

    if(!num){
       	pace[0] = 8 - pace[0];
		pace[1] = 9 - pace[1];
	    pace[2] = 8 - pace[2];
	    pace[3] = 9 - pace[3];
    }
	
	if (!pace) {
		play.showWin (1);
		return ;
	}
	
	var key=play.map[pace[1]][pace[0]]
		play.nowManKey = key;
	
	var key=play.map[pace[3]][pace[2]];
	if (key){
		play.AIclickMan(key,pace[2],pace[3]);	
	}else {
		play.AIclickPoint(pace[2],pace[3]);	
	}
	com.get("clickAudio").play();
	
}

	w.onmessage = function(e){
	    var msg = e.data;

	    mes = e.data.split(",");
	    if(mes[0] == 'chat'){
	    	document.getElementById("chat-box").innerHTML +=
                    '<strong style="color:red">'+ mes[1]+':</strong>'+ mes[2] + '</br>';
	    }
	    if(mes[0] == 'con'){
	    	playernum = mes[1];
	    	window.alert("Welcome you are the No." + mes[1]);
	    }
	    else{
		    var path = [];
		    path[0] = 8 - mes[0];
		    path[1] = 9 - mes[1];
		    path[2] = 8 - mes[2];
		    path[3] = 9 - mes[3];
		    
		    audience = !audience;
		    if(playernum < 2)
		    	play.AIPlay(path);
		    else
		    	play.audienceplay(path, audience);
		}
	}

//Kiểm tra xem nó có phải là tướng dài hạn hay không
play.checkFoul = function(){
	var p=play.pace;
	var len=parseInt(p.length,10);
	if (len>11&&p[len-1] == p[len-5] &&p[len-5] == p[len-9]){
		return p[len-4].split("");
	}
	return false;
}



play.AIclickMan = function (key,x,y){
	var man = com.mans[key];
	
	man.isShow = false;
	delete play.map[com.mans[play.nowManKey].y][com.mans[play.nowManKey].x];
	play.map[y][x] = play.nowManKey;
	play.showPane(com.mans[play.nowManKey].x ,com.mans[play.nowManKey].y,x,y)
	
	com.mans[play.nowManKey].x = x;
	com.mans[play.nowManKey].y = y;
	play.nowManKey = false;
	
	com.show();

	play.isPlay = true;
	if (key == "j0") play.showWin (-1);
	if (key == "J0") play.showWin (1);
}

play.AIclickPoint = function (x,y){
	var key=play.nowManKey;
	var man=com.mans[key];
	if (play.nowManKey){
		delete play.map[com.mans[play.nowManKey].y][com.mans[play.nowManKey].x];
		play.map[y][x] = key;
		
		com.showPane(man.x,man.y,x,y)
		
	
		man.x = x;
		man.y = y;
		play.nowManKey = false;
		
	}
	com.show();
	play.isPlay = true;
}


play.indexOfPs = function (ps,xy){
	for (var i=0; i<ps.length; i++){
		if (ps[i][0]==xy[0]&&ps[i][1]==xy[1]) return true;
	}
	return false;
	
}

//Nhận một cú nhấp chuột
play.getClickPoint = function (e){
	var domXY = com.getDomXY(com.canvas);
	var x=Math.round((e.pageX-domXY.x-com.pointStartX-20)/com.spaceX)
	var y=Math.round((e.pageY-domXY.y-com.pointStartY-20)/com.spaceY)
	return {"x":x,"y":y}
}

//Nhận quân cờ
play.getClickMan = function (e){
	var clickXY=play.getClickPoint(e);
	var x=clickXY.x;
	var y=clickXY.y;
	if (x < 0 || x>8 || y < 0 || y > 9) return false;
	return (play.map[y][x] && play.map[y][x]!="0") ? play.map[y][x] : false;
}

play.showWin = function (my){
	play.isPlay = false;
	if (my===1){
		alert("Chuc mung ban da chien thang-line285");
	}else{
		alert("That tiec khi ban da thua-line287");
	}
}

