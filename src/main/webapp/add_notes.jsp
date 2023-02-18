<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>

    <%@include file="all_js_css.jsp" %>

</head>
<body>

	<div class ="container">
	
		<!-- This will bring the nav-bar content from the NavBar.jsp file under this container -->
		<%@include file="NavBar.jsp" %>
		
		<br>
		<h1>Please fill your note details</h1>
		<br>
		
		<!-- This form is to add the notes -->
		
		<form action="SaveNoteServlet" method="post">
		  <div class="form-group">
		    <label for="exampleInputEmail1">Note Title</label>
		    <input
		    	name = "title"
		    	required 
		    	type="text" 
		    	class="form-control" 
		    	id="exampleInputEmail1" 
		    	aria-describedby="emailHelp" 
		    	placeholder="Enter title of your note" />
		    <small id="emailHelp" class="form-text text-muted">Make sure to give informative title to your Note.</small>
		  </div>
		  
		  <div class="form-group">
		    <label for="content">Note Content</label>
		    <textarea required
		    	name = "content" 
		    	id="content" 
		    	placeholder="Enter your content here"
		    	class="form-control"
		    	style ="min-height:200px; max-height:300px;">
		    </textarea>
		  </div>
		 
		 <div class="container text-center">
		 	 <button type="submit" class="btn btn-primary">ADD</button>
		 </div>
		 
	</form>

	</div>

</body>
</html>