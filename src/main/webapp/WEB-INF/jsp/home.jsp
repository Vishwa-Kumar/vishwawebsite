<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Vishwa Kumar Deepak</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(window).on('beforeunload', function(){
     console.log("beforeUnload event!");
     $.post({
         url : 'http://localhost:8080/logout',
         data : $('form[name=loginForm]').serialize(),
         success : function(res) {
         
            if(res.validated){
              console.log("succcess"+res)
            
            }else{
            	 console.log("fail"+res)
            }
         }
		 })
 });


	    function logout() {
	    	
	    console.log("logout called")
	          $.post({
			         url : 'http://localhost:8080/logout',
			         data : $('form[name=loginForm]').serialize(),
			         success : function(res) {
			         
			            if(res.validated){
			              console.log("succcess"+res)
			              window.location.replace("http://localhost:8080/login");
			            
			            }else{
			            	 console.log("fail"+res)
			            }
			         }
     			 })
     			 window.location.replace("http://localhost:8080/");
	    }


</script>
		
		
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<h1>Vishwa</h1>
				<nav>
					<ul>
						<li><a href="#intro">Intro</a></li>
						<!-- <li><a href="#zero">zero</a></li> -->
						<!-- <li><a href="#one">First wish</a></li>
						<li><a href="#two">Second wish</a></li>
						<li><a href="#three">third wish</a></li>
						<li><a href="#four">fourth Wish</a></li>
						<li><a href="#five">fifth wish</a></li>
						<li><a href="#six">sixth wish</a></li>
						<li><a href="#work">last not least</a></li> -->
						<!-- <li><a href="#logout" onclick=logout()>logout</a></li> -->
					</ul>
				</nav>
			</header>

		<!-- Intro -->
			<section id="intro" class="main style1 dark fullscreen">
				<div class="content">
					<header>
						<h2>Hey !  </h2>
					</header>
					<p>Welcome to <strong>my website</strong> <br />
					I am working on it . Hope you visit soons</p>
					<footer>
						<a href="#zero" class="button style2 down">More</a>
					</footer>
				</div>
			</section>


<!-- zero -->
		 <!-- <section id="zero" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>1.Profession</h2>
					</header>
					<p>Professionaly I am software Devloper wokring with Micorosft presently</p>
					
				</div>
				 <div >
					<header>
						<h2>1.Profession</h2>
					</header>
					<p>Professionaly I am software Devloper wokring with Micorosft presently</p>
					
				</div>
				<a href="#one" class="button style2 down anchored">Next</a>
			</section>  -->
		
		<!-- One -->
			<!-- <section id="one" class="main style2 right dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>1.Most Creative Person &#10002;</h2>
					</header>
					<p>May the wing of your creativity grows stronger & stronger and you can fly the limitless sky</p>
				</div>
				<a href="#two" class="button style2 down anchored">Next</a>
			</section>
 -->
		<!-- Two -->
			<!-- <section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>2.Smile &#128519;</h2>
					</header>
					<p>may this smile stick to your face lifelong.</p>
				</div>
				<a href="#three" class="button style2 down anchored">Next</a>
			</section> -->
			
		<!-- Three -->	
			<!-- <section id="three" class="main style2 right dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>3.Dance &#128131;</h2>
					</header>
					<p>May your day dreaming about dance never fade away</p>
				</div>
				<a href="#four" class="button style2 down anchored">Next</a>
			</section> -->
			
		<!-- FOUR -->	
			<!-- <section id="four" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>4.Lots of tour &#128663;</h2>
					</header>
					<p>May you have a lots of tour (obviously after lockdown )</p>
				</div>
				<a href="#five" class="button style2 down anchored">Next</a>
			</section>
			 -->
			<!-- FIVE -->	
		<!-- 	<section id="five" class="main style2 right dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>5.Glow</h2>
					</header>
					<p>May you glow like this always</p>
				</div>
				<a href="#six" class="button style2 down anchored">Next</a>
			</section> -->
				<!-- SIX -->	
			<!-- <section id="six" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>6.Date &#128525;</h2>
					</header>
					<p>May you go on lots of date like this.</p>
				</div>
				<a href="#work" class="button style2 down anchored">Next</a>
			</section> -->

		<!-- Work -->
			<!-- <section id="work" class="main style3 primary">
				<div class="content">
					<header>
						<h2>Last but not the least</h2>
						<p><span style="color:white;font-size:50px">"</span>Wish you get all the happiness and joy in your life. You are born intelligent and creative, 
						Can achieve anything you wish for.</br>				
						I wish situation would be better so that we can take treat from you but dont worry I am maintaing list of all treats. &#128523;</br>
						Always keep the liveliness, joliness alive in you because these are what makes you more beautiful.</br>
						You are already lucky to have amazing people around you. And I wish you grow and achieve all the success in all aspects of life.<span style="color:white;font-size:30px">"</span> 
						
						
						
						
						 </p>
					</header>

					Gallery 
						<div class="gallery">
							<article class="from-left">
								<a href="images/fulls/cute.jpg" class="image fit"><img src="images/thumbs/cute.jpg" title="in Saree and on top this cute smile &#128076; " alt="" /></a>
							</article>
							<article class="from-right">
								<a href="images/fulls/smile2.jpg" class="image fit"><img src="images/thumbs/smile2.jpg" title="you are right , your random clicks are just.." alt="" /></a>
							</article>
							<article class="from-left">
								<a href="images/fulls/sarree2.jpg" class="image fit"><img src="images/thumbs/sarree2.jpg" title="simply stunning" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="images/fulls/saree3.jpg" class="image fit"><img src="images/thumbs/saree3.jpg" title="Is this your matrimonial Look ? &#128523;" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="images/fulls/cute6.jpg" class="image fit"><img src="images/thumbs/cute6.jpg" title="Day dreaming ???" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="images/fulls/ethnic3.jpg" class="image fit"><img src="images/thumbs/ethnic3.jpg" title="uffff Pose !!!!" alt="" /></a>
							</article>
						</div>

				</div>
			</section> -->



		<!-- Footer -->
			<footer id="footer" style="text-align:center">
								Crafted with  &#x1F498; ||  <%= new java.util.Date() %>
			</footer>
			<!-- <audio  autoplay loop>
								<source src="assets/music/kkhh.mp3" type="audio/mpeg">						
			</audio> -->
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>