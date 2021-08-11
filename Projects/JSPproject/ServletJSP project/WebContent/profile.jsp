<%@page import="com.harsh128.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.harsh128.helper.ConnectionProvider"%>
<%@page import="com.harsh128.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.harsh128.entities.User"%>
<%@ page errorPage="error_page.jsp"%>
<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("login_page.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- start of css -->

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 76% 87%, 44% 97%, 0 99%, 0 0);
}
body{
background: url(./img/projectbg2.jpg);
background-size:cover;
background-attachment: fixed; 
}
</style>


<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/NewFile.css" rel="stylesheet" type="text/css" />


<!-- end of css -->











</head>
<body>
	<!-- navbar  -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
	<a class="navbar-brand" href="index.jsp"><span
		class="fa fa-asterisk"></span> Tech Blog</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#"><span
					class="fa fa-bell-o"></span> Learn code with Harsh <span
					class="sr-only">(current)</span></a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span class="fa fa-check-circle-o"></span>
					categories
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Programming language</a> <a
						class="dropdown-item" href="#">Project implementation</a>
					<div class="dropdown-divider">data structure</div>
					<a class="dropdown-item" href="#">Algoritham</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="fa fa-address-card"></span>contact</a></li>

			<li class="nav-item" data-toggle="modal"
				data-target="#add-post-modal"><a class="nav-link" href="#"><span
					class="fa fa-asterisk"></span>Do Post</a></li>



		</ul>
		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a class="nav-link" href="#!"
				data-toggle="modal" data-target="#profile-modal"><span
					class="fa fa-user-circle"></span><%=user.getName()%> </a></li>

			<li class="nav-item"><a class="nav-link" href="logoutServlet"><span
					class="fa fa-user-plus"></span>Logout</a></li>

		</ul>
	</div>
	</nav>



	<!-- end of navbar  -->

	<!-- Main body of page -->
	<main>

	<div class="container">
		<div class="row mt-4">
			<!--  first column -->

			<div class="col-md-4">
				<!--  categories -->
					
				<div class="list-group">
					<a href="#" onclick="getPost(0 , this)" class="c-link list-group-item list-group-item-action active">
						All Post </a> 
						
						<%
						PostDao p = new PostDao(ConnectionProvider.getConnection());
						 ArrayList<Category> list1 = p.getAllCategories();
						 for(Category cc : list1)
						 {
							 %>
							 <a href="#" onclick="getPost(<%=cc.getCid()%> , this)"
						class="c-link list-group-item list-group-item-action"> <%= cc.getName() %></a>
							 <% 
						 }
						%>
						
				</div>
			</div>

			<!--  second column -->
			<div class="col-md-8">
				<!-- post -->
				
				<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-3x fa-spin"></i>
					<h3 class="mt-2">Loading...</h3>
				</div>
				
				<div class="container-fluid" id="post-container"></div>


			</div>

		</div>
	</div>
	</main>


	<!--  end body of page -->


	<!-- start of profile model -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">


					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">

						<img style="height: 100px; width: 100px; border-radius: 50%"
							src="pics/<%=user.getProfile()%>" />
						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- Deatil -->

						<div id="profile-details">

							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered On:</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>





						<!-- Profile Edit -->

						<div id="profile-edit" style="display: none;">

							<h3 class="mt-2">Please Edit Carefully..</h3>
							<form action="EditServlet" method="post">

								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" name="user_email"
											class="form-control" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" name="user_name"
											class="form-control" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" name="user_password"
											class="form-control" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>Aboutt :</td>
										<td><textarea class="form-control" rows="4" name="about">
											
											<%=user.getAbout()%>
											</textarea></td>
									</tr>

									<!-- <tr>
											<td>New Profile: </td>
											<td>
												<input type="file" name="image" class="form-control">
											
											</td>
										</tr> -->




								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">
										Save</button>
								</div>



							</form>

						</div>











						<!-- detail finish -->

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end of profile model -->



	<!-- add post model -->

	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">



					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">

							<select class="form-control" name="cid">
								<option selected disabled>--select category--</option>

								<%
									PostDao postd = new PostDao(ConnectionProvider.getConnection());
									ArrayList<Category> List = postd.getAllCategories();

									for (Category c : List) {
								%>

								<option value="<%=c.getCid()%>"><%=c.getName()%>
								</option>



								<%
									}
								%>

							</select>


						</div>

						<div class="form-group">

							<input type="text" name="pTitle" placeholder="Enter Post Title"
								class="form-control">
						</div>
						<div class="form-group">

							<textarea type="text" style="height: 200px;" name="pContent"
								placeholder="Enter Post content" class="form-control"></textarea>
						</div>
						<div class="form-group">

							<textarea type="text" style="height: 200px;" name="pCode"
								placeholder="Enter Post Program (if any)" class="form-control"></textarea>
						</div>



						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- end post model -->











	<!-- javaascript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="js/javas.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
		
	</script>

	<script>
		$(document).ready(function() {

			let editStatus = false;
			$('#edit-profile-btn').click(function() {

				if (editStatus == false) {
					$('#profile-details').hide();

					$('#profile-edit').show();
					editStatus = true;
					$(this).text("back");
				} else {

					$('#profile-details').show();

					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit");

				}

				/* alert('button clicked');
				
				$('#profile-details').hide();
				
				$('#profile-edit').show(); */

			})
		});
	</script>



	<!-- now add post JS -->


	<script>
		$(document).ready(function(e) {

			$("#add-post-form").on("submit", function(event) {

				// this coede called when form submited ..

				event.preventDefault();
				console.log('clicked!');
				let form = new FormData(this);

				// now requesting to server

				$.ajax({

					url : "AddPostServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log("success");
						if (data.trim() == 'done') {
							swal("Good job!", "Save successfully", "success");

						} else {
							swal("Error", "something went wrong!", "error");

						}

					},

					error : function(jqXHR, textStatus, errorThrown) {
						swal("Error", "something went wrong!", "error");
					},

					processData : false,
					contentType : false

				})

			})

		})
	</script>
		
		
		<!-- Loading Post using Ajax -->
		<script>
		
		
		function getPost(catId , temp)
		{
			$("#loader").show();
			$("#post-container").hide();
			
			
			$(".c-link").removeClass('active')
			
			$.ajax({
				
				url:"Load_post.jsp",
				data:{cid:catId},
				success:function(data , textStatus , jqXHR)
				{
					console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$("#post-container").html(data);
					$(temp).addClass('active');
				}
				
			})
		}
			$(document).ready(function(e){
				
				let allposts =$('.c-link')[0]
					getPost(0 , allposts)
			})
		</script>











	<!-- End post JS -->

	<!-- javaascript -->

</body>
</html>