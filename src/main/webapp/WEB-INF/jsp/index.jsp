<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>

<!-- Metas -->
<meta name="fragment" content="!">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="keywords" content="Vishwa Kumar Deepak" />
<meta name="description"
	content="Vishwa Kumar Deepak Website, which contains showcase of his work and blogs" />
<meta name="author" content="Vishwa Kumar Deepak" />

<meta property="og:title" content="Vishwa Kumar Deepak" />
<meta property="og:type" content="blog:author" />
<meta property="og:image:height" content="1000" />
<meta property="og:url" content="www.vishwakumardeepak.com" />
<meta property="og:image" content="https://www.vishwakumardeepak.com/img/hero.jpg" />
 
<title>Vishwa Kumar Deepak</title>
<link rel="shortcut icon" href="img/favicon.png" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700,800"
	rel="stylesheet">

<!-- Plugins -->
<link rel="stylesheet" href="css/plugins.css" />

<!-- Core Style Css -->
<link rel="stylesheet" href="css/style.css" />
<script src="js/modernizr-custom.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var ip;
				var details={};
				$.getJSON("https://api.ipify.org?format=jsonp&callback=?",
						function(data) {
							console.log(JSON.stringify(data, null, 2));

							ip = data.ip;
							$.ajax({
								url : "https://freegeoip.app/json/"+ip,
								success : function(dataFull) {
									//alert(JSON.stringify(dataFull, null, 2));
									console.log(JSON.stringify(dataFull, null, 2));

									details["country"] = dataFull.country_name;
									details["countryCode"] = dataFull.country_code;
									details["regionName"] = dataFull.region_name;
									details["timezone"] = dataFull.time_zone;
									details["region"] = dataFull.region_code;
									details["zip"] = dataFull.zip_code;
									details["city"] = dataFull.city;
									details["lat"] = dataFull.latitude;
									details["lon"] = dataFull.longitude;
									details["query"] = dataFull.ip;
									console.log(JSON.stringify(details, null, 2));
									sendMail(details);
								},
								error : function(dataFull) {
									console.log(JSON.stringify(dataFull, null, 2));

									details["country"] = "NA";
									details["region"] = "NA";
									details["zip"] = "NA";
									details["city"] = "NA";
									console.log(JSON.stringify(details, null, 2));
									sendMail(details);
								}
							});
						});
				
				console.log("ready!");
				var day = new Date();
				var wish = "Hi";
				var hr = day.getHours();
				if (hr >= 0 && hr < 12) {
					wish = "Good Morning !";
				} else if (hr == 12) {
					wish = "Good Noon!";
				} else if (hr >= 12 && hr <= 17) {
					wish = "Good AferNoon !";
				} else {
					wish = "Good Evening !";
				}
				$('.wish').text(wish + " ");

				function sendMail(input) {

					$
							.ajax({
								type : "POST",
							  url: "https://www.vishwakumardeepak.com/sendmail",
						 /* 	 url : "http://localhost:8080/sendmail",   */
								contentType : "application/json",
								data : JSON.stringify(input),
								dataType : 'json',
								success : function(data_response) {

									console.log("success data_response"
											+ JSON.stringify(data_response));
									$("#visitorCount").text(
											data_response["errorCode"]);
									/*  $( "#loader").hide();
									 $( "#success").slideDown( "slow" ); */
									setTimeout(function() {
										$("#success").slideUp("slow");
									}, 3000);
								},
								error : function(data_response) {
									console.log("error data_response"
											+ JSON.stringify(data_response))
									/*  $( "#loader").hide();
									 $( "#error").slideDown( "slow" ); */
									setTimeout(function() {
										$("#error").slideUp("slow");
									}, 3000);
								}
							});
				}

			});
</script>

</head>

<body>


	<!-- =====================================
        ==== Start Loading -->

	<div class="loading valign text-center">
		<div class="full-width">
			<img src="img/loading.svg" alt="">
		</div>
	</div>

	<!-- End Loading ====
        ======================================= -->



	<!-- =====================================
        ==== Start Navbar -->

	<nav class="pages-nav">
		<div class="logo">
			<a href="#0"> Vishwa Kumar Deepak<!-- <img src="img/logo.png" alt=""> -->
			</a>
		</div>
		<div class="pages-nav__item nav__list-item">
			<a class="link link--page hover-target" href="#page-home">Home</a>
		</div>
		<div class="pages-nav__item nav__list-item">
			<a class="link link--page hover-target" href="#page-about">About</a>
		</div>
		<div class="pages-nav__item nav__list-item">
			<a class="link link--page hover-target" href="#page-resume">Resume</a>
		</div>
		<!-- <div class="pages-nav__item nav__list-item"><a class="link link--page hover-target" href="#page-work">Portfolio</a></div> -->
		<div class="pages-nav__item nav__list-item">
			<a class="link link--page hover-target" href="#page-blog">Blog</a>
		</div>
		<div class="pages-nav__item nav__list-item">
			<a class="link link--page hover-target" href="#page-contact">Contact</a>
		</div>
	</nav>

	<!-- End Navbar ====
        ======================================= -->



	<!-- =====================================
        ==== Start pages-stack -->

	<div class="pages-stack">

		<!-- Home -->
		<div class="page home" id="page-home">
			<div class="container-fluid">
				<div class="row">

					<div class="col-md-4">
						<div class="img valign">
							<div class="pattern">
								<img src="img/hero.jpg" alt="">
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="content section-padding valign">
							<div class="caption">
								<h6>Hey there!</h6>
								<p class="wish"></p>
								<h1>I'm Vishwa</h1>
								<p>I am Vishwa Kumar Deepak. Graduated in Computer Science
									Engineering from KIIT University, Bhubaneswar. Six Year plus
									industry experience in software industry. Presently working
									with Microsoft Hyderabad. Always eager and curious about
									technology around.</p>


								<a target="_blank"
									href="https://docs.google.com/document/d/1UhOzvWJq2NgnIwoH39frLTkwYajW3a_M6d3PKwDs2w4/edit?usp=sharing"
									class="butn butn-bg mt-30"> <span>Download C.V</span>
								</a>
								<div class="social">
									<a target="_blank"
										href="https://www.linkedin.com/in/vishwakumardeepak/"
										class="icon"> <i class="fab fa-linkedin"></i>
									</a> <a target="_blank"
										href="https://www.facebook.com/vishusmplydbst" class="icon">
										<i class="fab fa-facebook-f"></i>
									</a> <a target="_blank"
										href="https://www.instagram.com/vishwa_kumar/" class="icon">
										<i class="fab fa-instagram"></i>
									</a> </a> <a target="_blank"
										href="https://youtube.com/channel/UCQPPJ7MptfP9rgKjUoyK6wA"
										class="icon"> <i class="fab fa-youtube"></i>
									</a>
									<!-- <a href="#0" class="icon">
                                            <i class="fas fa-basketball-ball"></i>
                                        </a> -->
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /Home -->

		<!-- About -->
		<div class="page about" id="page-about">
			<div class="container-fluid">
				<div class="row">

					<div class="col-lg-7">
						<div class="content section-padding">

							<div class="section-head">
								<h5>
									<span>A</span>bout Me
								</h5>
								<h3>About</h3>
							</div>

							<div class="text-center">
								<h5 class="intro">
									I am a <b>software engineer</b> from India, Hyderabad.
								</h5>
								<p class="mb-15">Proficient in the data structure,
									algorithms, design patterns, and other computer science
									fundamentals. Six years plus experience in developing products
									and hands-on web, cloud, microservice architecture, etc.
									Presently working with Microsoft on keeping billions of devices
									running on the Windows operating system up to date and secure</p>
								<a target="_blank"
									href="https://docs.google.com/document/d/1UhOzvWJq2NgnIwoH39frLTkwYajW3a_M6d3PKwDs2w4/edit?usp=sharing"
									class="butn butn-bg"> <span>Download C.V</span>
								</a>
								<!--  <a href="#0" class="butn butn-bord">
                                        <span>Hire Me!</span>
                                    </a> -->
							</div>

							<div class="inform">
								<div class="row">
									<!--  <div class="col-md-4 col-sm-6">
                                            <div class="item mb-sm30">
                                                <span class="icon"><i class="fas fa-phone"></i></span>
                                                <div class="cont">
                                                    <h6>Phone</h6>
                                                    <p>+20 010 251 789 18</p>
                                                </div>
                                            </div>
                                        </div> -->
									<div class="col-md-12 col-sm-12">
										<div class="item mb-md30">
											<span class="icon"><i class="fas fa-envelope"></i></span>
											<div class="cont">
												<h6>Email</h6>
												<p>viskumdee@gmail.com</p>
											</div>
										</div>
									</div>
									<!--     <div class="col-md-4 col-sm-6 offset-md-0 offset-sm-3">
                                            <div class="item">
                                                <span class="icon"><i class="fas fa-check-circle"></i></span>
                                                <div class="cont">
                                                    <h6>Freelancer</h6>
                                                    <p>Available</p>
                                                </div>
                                            </div>
                                        </div> -->
								</div>
							</div>

							<div class="services mt-80">
								<div class="sub-head mb-50">
									<h5>
										What <span>I Do</span> ?
									</h5>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="item">
											<span class="icon ti-desktop"></span>
											<div class="cont">
												<h6>Software Engineering</h6>
												<p>Professionally, I am Software Engineer, working
													presently with Microsoft in making windows operating system
													more productive and secure which is running on billion of
													devices around the globe.</p>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="item">
											<span class="icon ti-palette"></span>&nbsp;<span
												class="icon ti-desktop"></span>
											<div class="cont">
												<h6>Web Design & Development</h6>
												<p>Web interest me a lot, the way web is changing out
													lives making it feasible to get things done with a click is
													remarkable</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="item">
											<span class="icon ti-shield"></span>
											<div class="cont">
												<h6>Travel & Food</h6>
												<p>
													When I am not working, I might be travelling or thinking
													about travelling or Food.<br> My <a
														href="https://www.instagram.com/vishwa_kumar"
														target="_blank">instagram</a> is more evident of this
													fact.
												</p>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="item">
											<span class="icon ti-pencil"></span>
											<div class="cont">
												<h6>Blog/Vlog</h6>
												<p>
													I so wanted to create technical blogs and travel vlogs, but
													somehow its not getting done.<br> But I am very much
													sure its going to be there soon. Please subscribe to be
													updated.
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!--   <div class="price mt-50">
                                    <div class="sub-head mb-50">
                                        <h5>My <span>Offers</span></h5>
                                    </div>

                                    <div class="pricing-tables text-center full-width">

                                        <div class="row">
                
                                            <div class="col-md-6">
                                                <div class="item mb-sm50">
                                                    <div class="type">
                                                        <h5>Basic</h5>
                                                    </div>
                
                                                    <div class="value">
                                                        <h3><span>$</span>10</h3>
                                                        <span class="per">/ Mo</span>
                                                        <p>Lorem Ipsum is simply text.</p>
                                                    </div>
                
                                                    <div class="features">
                                                        <ul>
                                                            <li>10 GB Disk Space</li>
                                                            <li>15 Domain Names</li>
                                                            <li>Enhanced Security</li>
                                                            <li class="del">Unlimited Support</li>
                                                        </ul>
                                                    </div>
                
                                                    <div class="order">
                                                        <a href="#0" class="butn butn-bord">
                                                            <span>Get Started</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                
                                            <div class="col-md-6">
                                                <div class="item active">
                
                                                    <div class="best">
                                                        <span>Best Value</span>
                                                    </div>
                
                                                    <div class="type">
                                                        <h5>Standard</h5>
                                                    </div>
                
                                                    <div class="value">
                                                        <h3><span>$</span>30</h3>
                                                        <span class="per">/ Mo</span>
                                                        <p>Lorem Ipsum is simply text.</p>
                                                    </div>
                
                                                    <div class="features">
                                                        <ul>
                                                            <li>100 GB Disk Space</li>
                                                            <li>30 Domain Names</li>
                                                            <li>Enhanced Security</li>
                                                            <li>Unlimited Support</li>
                                                        </ul>
                                                    </div>
                
                                                    <div class="order">
                                                        <a href="#0" class="butn butn-bg">
                                                            <span>Get Started</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->

							<!--              <div class="testimonials mt-80">
                                    <div class="sub-head mb-50">
                                        <h5><span>Testi</span>monials</h5>
                                    </div>

                                    <div class="owl-carousel owl-theme">
                                        <div class="item">
                                                <p><span class="icon ti-quote-left"></span> " Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condi tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu ad litora. " <span class="icon ti-quote-right"></span></p>
                                            <div class="client-area">
                                                <h6>Alex Smith</h6>
                                                <span>Envato Customer</span>
                                            </div>
                                        </div>
                                        <div class="item">
                                                <p><span class="icon ti-quote-left"></span> " Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condi tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu ad litora. " <span class="icon ti-quote-right"></span></p>
                                            <div class="client-area">
                                                <h6>Sam Smith</h6>
                                                <span>Envato Customer</span>
                                            </div>
                                        </div>
                                        <div class="item">
                                                <p><span class="icon ti-quote-left"></span> " Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condi tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu ad litora. " <span class="icon ti-quote-right"></span></p>
                                            <div class="client-area">
                                                <h6>Alex Martin</h6>
                                                <span>Envato Customer</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div> -->

							<div class="numbers mt-80">
								<div class="sub-head mb-50">
									<h5>
										Fun <span>Facts</span>
									</h5>
								</div>

								<div class="facts">
									<div class="row">
										<div class="col-md-12 col-sm-12">
											<div class="item text-center mb-sm30">
												<span class="icon ti-heart"></span>
												<h4 class="count" id="visitorCount">..</h4>
												<p>You are visitor number</p>
											</div>
										</div>

										<!-- <div class="col-md-4 col-sm-6">
                                                <div class="item text-center mb-md30">
                                                    <span class="icon ti-layers-alt"></span>
                                                    <h4 class="count">937</h4>
                                                    <p>Projects Compleated</p>
                                                </div>
                                            </div>
                        
                                            <div class="col-md-4 col-sm-6 offset-md-0 offset-sm-3">
                                                <div class="item text-center">
                                                    <span class="icon ti-import"></span>
                                                    <h4 class="count">438</h4>
                                                    <p>Files Downloaded</p>
                                                </div>
                                            </div> -->
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="col-lg-5 simg bg-img" data-background="img/1.jpg"></div>

				</div>
			</div>
		</div>
		<!-- /About -->

		<!-- Resume -->
		<div class="page resume" id="page-resume">
			<div class="container-fluid">
				<div class="row">

					<div class="col-lg-7">
						<div class="content section-padding">

							<div class="section-head">
								<h5>
								<a href="https://docs.google.com/document/d/1UhOzvWJq2NgnIwoH39frLTkwYajW3a_M6d3PKwDs2w4/edit?usp=sharing" target="_blank">	<span>R</span>esume </a>
								</h5>
								
							</div>

							<div class="clmn">

								<div class="sub-head mb-50">
									<h5>
										<span>Exper</span>ience
									</h5>
								</div>

								<div class="exp">
									<div>
										<div class="row">
											<div class="col-md-5 col-sm-3">
												<span class="date">2019 - <b>Current</b></span>
											</div>
											<div class="col-md-7 col-sm-9 right">
												<h6>Software Engineer 2</h6>
												<h4>Microsoft IDC, Hyderabad</h4>
												<p>Keeping billions of devices running on the Windows
													operating system up to date and secure. This is the first
													time I am exploring system-level programming in C++</p>
											</div>
										</div>
									</div>
									<div>
										<div class="row">
											<div class="col-md-5 col-sm-3">
												<span class="date">2018 - <b>2019</b></span>
											</div>
											<div class="col-md-7 col-sm-9 right">
												<h6>Developer - Technology</h6>
												<h4>Delhivery, Hyderabad</h4>
												<p>
													Developing Delhivery mid-mile/line haul system using
													event-driven architecture and event sourcing which will
													optimize its operations in terms of cost, time and best
													utilization of resources.<br> This project is based on
													a microservice architecture with 9 components out of which
													I have full ownership of four components starting from
													designing, development, enhancement, and support.<br>
													Tech Stack: Java, Apache Kafka, AWS Dynamo DB, AWS Kinesis,
													AWS SQS, Gradle, Redis, AWS Lambda, Python, RabbitMQ,
													Celery, Postgres DB, Elastic Search, sentry, supervisor,
													Nginx, Angular, Linux, etc
												</p>
											</div>
										</div>
									</div>
									<div>
										<div class="row">
											<div class="col-md-5 col-sm-3">
												<span class="date">2017 - <b>2018</b></span>
											</div>
											<div class="col-md-7 col-sm-9 right">
												<h6>Software Developer Engineer</h6>
												<h4>Kony</h4>
												<p>
													Product Development<br> Role and Responsibility: To
													develop services for admin console application which
													configures the product, services, roles, permissions etc to
													Kony Retail Banking Application
												</p>
											</div>
										</div>
									</div>
									<div>
										<div class="row">
											<div class="col-md-5 col-sm-3">
												<span class="date">2014 - <b>2017</b></span>
											</div>
											<div class="col-md-7 col-sm-9 right">
												<h6>System Engineer</h6>
												<h4>TCS</h4>
												<p>Application Development<br> Developed Tata Docomo
													Recharge and postpaid bill payment application,
													specifically payment integration module with BillDesk which
													enable fast and smooth revenue collection for Tata Docomo.</p>
											</div>
										</div>
									</div>

								</div>
							</div>

							<div class="clmn">

								<div class="sub-head mb-50">
									<h5>
										Educ<span>ation</span>
									</h5>
								</div>

								<div class="edu">
									<div>
										<div class="row">
											<div class="col-md-5 col-sm-3">
												<span class="date">2010 - <b>2014</b></span>
											</div>
											<div class="col-md-7 col-sm-9 right">
												<h6>B.Tech in Computer Science & Engineering</h6>
												<h4>KIIT University</h4>
												<p>CGPA : 7.41</p>
											</div>
										</div>
									</div>
									<div>
									<!-- 	<div class="row">
											<div class="col-md-5 col-sm-3">
												<span class="date">2008 - <b>2010</b></span>
											</div>
											<div class="col-md-7 col-sm-9 right">
												<h6>at Playground Design</h6>
												<h4>Design and Art</h4>
												<p>All the Lorem Ipsum on the Internet tend to repeat
													chunks as necessary, making this on the Internet generator.</p>
											</div>
										</div> -->
									</div>

								</div>
							</div>

							<!-- <div class="skills mt-80">
								<div class="sub-head mb-50">
									<h5>
										Best <span>Skills</span>
									</h5>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="skill mb-md50">
											<div class="skill-item">
												<h5>Web Design</h5>
												<div class="skill-progress">
													<div class="progres" data-value="90%"></div>
												</div>
											</div>
											<div class="skill-item">
												<h5>Branding</h5>
												<div class="skill-progress">
													<div class="progres" data-value="75%"></div>
												</div>
											</div>
											<div class="skill-item">
												<h5>Development</h5>
												<div class="skill-progress">
													<div class="progres" data-value="85%"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="skill">
											<div class="skill-item">
												<h5>HTML / jQuery</h5>
												<div class="skill-progress">
													<div class="progres" data-value="95%"></div>
												</div>
											</div>
											<div class="skill-item">
												<h5>WordPress</h5>
												<div class="skill-progress">
													<div class="progres" data-value="85%"></div>
												</div>
											</div>
											<div class="skill-item">
												<h5>Php / Mysql</h5>
												<div class="skill-progress">
													<div class="progres" data-value="75%"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> -->

						</div>
					</div>
					<div class="col-lg-5 simg bg-img" data-background="img/2.jpg"></div>

				</div>
			</div>
		</div>
		<!-- /Resume -->

		<!-- Portfolio -->
		<div class="page portfolio" id="page-work">
			<div class="container-fluid">
				<div class="row">

					<div class="col-lg-7">
						<div class="content section-padding">

							<div class="section-head">
								<h5>
									<span>P</span>ortfolio
								</h5>
								<h3>Works</h3>
							</div>

							<!-- filter links -->
							<div class="filtering text-right full-width">
								<div class="filter">
									<span data-filter='*' class="active">All</span> <span
										data-filter='.brand'>Brand</span> <span data-filter='.web'>Design</span>
									<span data-filter='.graphic'>Graphic</span>
								</div>
							</div>

							<!-- gallery -->
							<div class="gallery row">

								<!-- gallery item -->
								<div class="items col-md-6 graphic">
									<div class="item-img">
										<img src="img/portfolio/1.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/1.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<!-- gallery item -->
								<div class="items col-md-6 web">
									<div class="item-img">
										<img src="img/portfolio/2.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/2.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<!-- gallery item -->
								<div class="items col-md-6 brand">
									<div class="item-img">
										<img src="img/portfolio/3.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/3.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<!-- gallery item -->
								<div class="items col-md-6 graphic">
									<div class="item-img">
										<img src="img/portfolio/4.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/4.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<!-- gallery item -->
								<div class="items col-md-6 web">
									<div class="item-img">
										<img src="img/portfolio/5.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/5.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<!-- gallery item -->
								<div class="items col-md-6 brand">
									<div class="item-img">
										<img src="img/portfolio/6.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/6.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<!-- gallery item -->
								<div class="items col-md-6 brand">
									<div class="item-img">
										<img src="img/portfolio/7.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/7.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<!-- gallery item -->
								<div class="items col-md-6 graphic">
									<div class="item-img">
										<img src="img/portfolio/8.jpg" alt="image">
										<div class="item-img-overlay">
											<div class="overlay-info full-width">
												<div class="des">
													<p>Logo | Branding</p>
													<h6>Creative Web Design</h6>
												</div>
												<a href="img/portfolio/8.jpg" class="popimg"> <span
													class="icon"><i class="fas fa-long-arrow-alt-right"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>
					</div>
					<div class="col-lg-5 simg bg-img" data-background="img/3.jpg"></div>

				</div>
			</div>
		</div>
		<!-- /Portfolio -->

		<!-- blog -->
		<div class="page blog" id="page-blog">
			<div class="container-fluid">
				<div class="row">

					<div class="col-lg-7">
						<div class="content section-padding">

							<div class="section-head">
								<h5>
									<span>B</span>log
								</h5>
								<h3>Blog</h3>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="item">
										<div class="post-img">
											<img src="img/blog/comingsoon.png" alt=""> <a href="#0"
												class="date"> <span>06</span> <span>August</span>
											</a>
										</div>
										<div class="cont">
											<a href="#0" class="tags">#first blog</a>
											<h4>Coming soon</h4>
											<p></p>
											<a href="#0" class="more">Read More</a>
										</div>
									</div>
								</div>
								<!--          <div class="col-md-12">
                                        <div class="item">
                                            <div class="post-img">
                                                <img src="img/blog/2.jpg" alt="">
                                                <a href="#0" class="date">
                                                    <span>06</span>
                                                    <span>August</span>
                                                </a>
                                            </div>
                                            <div class="cont">
                                                <a href="#0" class="tags">#WordPress</a>
                                                <h4>International Women’s Day: Celebrating Women In Design</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                                <a href="#0" class="more">Read More</a>
                                            </div>
                                        </div>
                                    </div> -->
								<!--     <div class="col-md-12">
                                        <div class="item">
                                            <div class="post-img">
                                                <img src="img/blog/3.jpg" alt="">
                                                <a href="#0" class="date">
                                                    <span>06</span>
                                                    <span>August</span>
                                                </a>
                                            </div>
                                            <div class="cont">
                                                <a href="#0" class="tags">#WordPress</a>
                                                <h4>How Designers Are Amplifying Their Portfolios in 2019</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                                <a href="#0" class="more">Read More</a>
                                            </div>
                                        </div>
                                    </div> -->
								<!--         <div class="col-md-12">
                                        <div class="item mb-0">
                                            <div class="post-img">
                                                <img src="img/blog/4.jpg" alt="">
                                                <a href="#0" class="date">
                                                    <span>06</span>
                                                    <span>August</span>
                                                </a>
                                            </div>
                                            <div class="cont">
                                                <a href="#0" class="tags">#WordPress</a>
                                                <h4>Master These Awesome New Skills in April 2019</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                                <a href="#0" class="more">Read More</a>
                                            </div>
                                        </div>
                                    </div> -->

							</div>

						</div>
					</div>
					<div class="col-lg-5 simg bg-img" data-background="img/4.jpg"></div>

				</div>
			</div>
		</div>
		<!-- /blog -->

		<!-- Contact -->
		<div class="page contact" id="page-contact">
			<div class="container-fluid">
				<div class="row">

					<div class="col-lg-7">
						<div class="content section-padding">

							<div class="section-head">
								<h5>
									<span>C</span>ontact Me
								</h5>
								<h3>Contact</h3>
							</div>

							<div class="contact-info">
								<div class="sub-head mb-50">
									<h5>
										Contact <span> Info</span>
									</h5>
								</div>

								<div class="row">
									<!-- <div class="col-sm-6">
                                            <div class="item">
                                                <span class="icon"><i class="fas fa-phone"></i></span>
                                                <div class="cont">
                                                    <h6>Phone</h6>
                                                    <p>+20 010 251 789 18 , 251 789 18</p>
                                                </div>
                                            </div>
                                        </div> -->
									<div class="col-sm-6">
										<div class="item">
											<span class="icon"><i class="fas fa-envelope"></i></span>
											<div class="cont">
												<h6>Email</h6>
												<p>viskumdee@gmail.com</p>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="item">
											<span class="icon"><i class="fas fa-map-marker-alt"></i></span>
											<div class="cont">
												<h6>Address</h6>
												<p>Hyderabad, India</p>
											</div>
										</div>
									</div>
									<!-- <div class="col-sm-6">
                                            <div class="item">
                                                <span class="icon"><i class="fas fa-check-circle"></i></span>
                                                <div class="cont">
                                                    <h6>Freelancer</h6>
                                                    <p>Available</p>
                                                </div>
                                            </div>
                                        </div> -->
								</div>

							</div>

							<form class="form" id="contact-form" method="post"
								action="contact.php">

								<div class="sub-head mb-50 mt-30">
									<h5>
										Get <span> In </span> Touch
									</h5>
								</div>

								<div class="messages"></div>

								<div class="controls">

									<div class="row">

										<div class="col-lg-6">
											<div class="form-group">
												<input id="form_name" type="text" name="name"
													placeholder="Name" required="required">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<input id="form_email" type="email" name="email"
													placeholder="Email" required="required">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input id="form_subject" type="text" name="subject"
													placeholder="Subject">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<textarea id="form_message" name="message"
													placeholder="Message" rows="4" required="required"></textarea>
											</div>
										</div>

										<div class="col-md-12">
											<button type="submit" class="butn butn-bg">
												<span>Send Message</span>
											</button>
										</div>

									</div>
								</div>
							</form>

						</div>
					</div>
					<div class="col-lg-5 simg bg-img" data-background="img/5.jpg"></div>

				</div>
			</div>
		</div>
		<!-- /Contact -->

	</div>

	<!-- End pages-stack ====
        ======================================= -->



	<!-- =====================================
        ==== Start nav-button -->

	<div class="nav-button">
		<button class="menu-button menu-icon hover-target" id="menu-button">
			<span>Menu</span>
		</button>
	</div>

	<!-- End nav-button ====
        ======================================= -->



	<!-- =====================================
        ==== Start cursor -->

	<div class='cursor' id="cursor"></div>
	<div class='cursor2' id="cursor2"></div>
	<div class='cursor3' id="cursor3"></div>

	<!-- End cursor ====
        ======================================= -->



	<!-- jQuery -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery-migrate-3.0.0.min.js"></script>

	<!-- popper.min -->
	<script src="js/popper.min.js"></script>

	<!-- bootstrap -->
	<script src="js/bootstrap.min.js"></script>

	<!-- classie -->
	<script src="js/classie.js"></script>

	<!-- Main -->
	<script src="js/main.js"></script>

	<!-- jquery.waypoints.min -->
	<script src="js/jquery.waypoints.min.js"></script>

	<!-- jquery.counterup.min -->
	<script src="js/jquery.counterup.min.js"></script>

	<!-- owl carousel -->
	<script src="js/owl.carousel.min.js"></script>

	<!-- isotope.pkgd.min js -->
	<script src="js/isotope.pkgd.min.js"></script>

	<!-- jquery.magnific-popup.min js -->
	<script src="js/jquery.magnific-popup.min.js"></script>

	<!-- validator js -->
	<script src="js/validator.js"></script>

	<!-- custom scripts -->
	<script src="js/scripts.js"></script>

</body>
</html>
