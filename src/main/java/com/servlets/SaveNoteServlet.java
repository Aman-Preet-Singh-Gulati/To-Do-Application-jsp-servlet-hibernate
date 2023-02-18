package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			
			// Fetching Title and Content
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note( title, content, new Date());
			/*
			 * System.out.println(note.getId()); 
			 * System.out.println(note.getTitle());
			 */
			
			                            // HIBERNATE : save() 
			/*
			 * Calling the getFactory method from FactoryProvider
			 * helper class that we created so that we don't have to create factory again
			 * and again and then on the same factory we are opening the session as well -
			 * openSession()
			 */
			Session s = FactoryProvider.getFactory().openSession();
			
			/* Transaction - so that the data/record is added in database as well */
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			
			/* So that we can tell the browser that we are sending the HTML type of data */
			response.setContentType("text/html");
			
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center'> Note is added sucessfully </h1>");
			out.println("<h1 style='text-align:center'> <a href='all_notes.jsp'>View All Notes</a></h1>");
			
			
			s.close();
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
	}

}
