/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.controlador;

import com.udec.ejb.UsuariosFacade;
import com.udec.modelo.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ususario
 */
public class Login extends HttpServlet {
  
    @EJB
    private UsuariosFacade usuariosFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getParameter("action");
        String accion = (String) request.getParameter("accion");
        if (action != null) {
            request.getSession().invalidate();
        } else {
            if (accion != null && accion.equals("redirectCentro")) {
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vista/centro/index.jsp");
                rd.forward(request, response);
            } else {
                if (accion != null && accion.equals("redirectDecano")) {
                    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vista/decanos/index.jsp");
                    rd.forward(request, response);
                } else {
                    String un = (String) request.getParameter("un");
                    String pw = (String) request.getParameter("pw");
                    String tp = (String) request.getParameter("tp");
                    HttpSession session = request.getSession();

                    response.setContentType("text/plain");
                    PrintWriter out = response.getWriter();
                    Usuarios usuario;
                    if (tp != null && un != null && pw != null) {

                        List<Usuarios> aux = usuariosFacade.findByList2("cedula", Integer.parseInt(un), "tipo", tp);
                        if (aux != null && aux.size() > 0) {
                            for (int i = 0; i < aux.size(); i++) {
                                usuario = aux.get(i);
                                if (usuario != null && usuario.getClave().equals(pw)) {
                                    out.println(0);
                                    session.setAttribute("tipo", usuario.getTipo());
                                    session.setAttribute("usuario", usuario);
                                } else {
                                    if (i + 1 == aux.size()) {
                                        out.println(1);
                                    }

                                }
                            }
                        }

                    }
                }
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
