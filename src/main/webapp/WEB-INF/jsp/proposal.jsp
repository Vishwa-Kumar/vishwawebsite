<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>love you</title>
<link
	href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/proposal.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<div class="bg_heart"></div>
	<div class="container">
		<span id="text1"></span>
	</div>
</body>
</html>
<script>
	var love = setInterval(
			function() {
				var r_num = Math.floor(Math.random() * 40) + 1;
				var r_size = Math.floor(Math.random() * 65) + 10;
				var r_left = Math.floor(Math.random() * 100) + 1;
				var r_bg = Math.floor(Math.random() * 30) + 100;
				var r_time = Math.floor(Math.random() * 5) + 5;
				$('.bg_heart').append(
						"<div class='heart' style='width:" + r_size
								+ "px;height:" + r_size + "px;left:" + r_left
								+ "%;background:rgba(200," + (r_bg - 25) + ","
								+ r_bg + ",1);-webkit-animation:love " + r_time
								+ "s ease;-moz-animation:love " + r_time+1
								+ "s ease;-ms-animation:love " + r_time
								+ "s ease;animation:love " + r_time
								+ "s ease'></div>");

				$('.bg_heart').append(
						"<div class='heart' style='width:" + (r_size - 10)
								+ "px;height:" + (r_size - 10) + "px;left:"
								+ (r_left + r_num) + "%;background:rgba(100,"
								+ (r_bg - 25) + "," + (r_bg + 25)
								+ ",1);-webkit-animation:love " + (r_time + 5)
								+ "s ease;-moz-animation:love " + (r_time + 5)
								+ "s ease;-ms-animation:love " + (r_time + 5)
								+ "s ease;animation:love " + (r_time + 5)
								+ "s ease'></div>");

			}, 500);

	var i = 0;
	var txt1 = "Hi Prachi.....!  << My sincere apology if any of this makes you uncomfortable, awakward or embarrasred in any way <<< " 
	+"but I have to express it as I cant hold it with me any longer else I will regret it for lifelong!  "+
	"> so the thing is you are not just any person whom I feel comfortable talking to < You are Special to me.  <<  "+
	"As the days goes < you get closer to me....! <<                           I don't know the reason why your thoughts always resonates inside my mind...!                                                     > Everything about you is always intresting for me...!                     << I am somewhat nervous Because I haven't said these words to anyone and I won't say to anyone in future...!                                                     > I Love my Parents so much than anything else in this world....!                    << Now You are the only person  whom I love equally with my parents....!                                                             >I Love U <SweetHeart.....! |                  <<<< Give me One chance to Prove my Love ...!";
	
	var speed = 80;
	typeWriter();
	function typeWriter() {
		if (i < txt1.length) {
			if (txt1.charAt(i) == '<')
				document.getElementById("text1").innerHTML += '</br>'
			else if (txt1.charAt(i) == '>')
				document.getElementById("text1").innerHTML = ''
			else if (txt1.charAt(i) == '|') {
				$(".bg_heart")
						.css("background-image","url('img/romantic_bg.jpg");

			} else
				document.getElementById("text1").innerHTML += txt1.charAt(i);
			i++;
			setTimeout(typeWriter, speed);
		}
	}
</script>