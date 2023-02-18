<%@page import="javax.persistence.Transient"%>
<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker : Update</title>

	<%@include file="all_js_css.jsp" %>

</head>
<body>

	<div class ="container">
	
		<!-- This will bring the NAV-bar content from the NavBar.jsp file under this container -->
		<%@include file="NavBar.jsp" %>
		<br>
		
		<h1 class="text-uppercase">Edit Page</h1>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			
			Session s = FactoryProvider.getFactory().openSession();
	
			/*
			 * As Update function required a object to passed as parameter for that we will
			 * first load the "Note" object.
			 */
			
			Transaction tx = s.beginTransaction();
			Note note = s.get(Note.class, noteId);
					 
			s.close();
		%>
		
		<!-- This form is to edit/update the notes -->
		
		<form action="UpdateServlet" method="post">
		
			<input value="<%= note.getId() %>" name = "noteId" type="hidden" />
			
			  <div class="form-group">
			    <label for="exampleInputEmail1">Note Title</label>
			    <input
			    	name = "title"
			    	required 
			    	type="text" 
			    	class="form-control" 
			    	id="exampleInputEmail1" 
			    	aria-describedby="emailHelp" 
			    	placeholder="Enter title of your note" 
			    	value ="<%= note.getTitle() %>"/>
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
			    	<%= note.getContent() %>
			    	
			    </textarea>
			  </div>
			 
			 <div class="container text-center">
			 	 <button type="submit" class="btn btn-primary">Update</button>
			 </div>
		 
		</form>
		
		
	</div>

</body>
</html>