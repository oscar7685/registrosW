/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.controlador;

import com.udec.ejb.FacultadFacade;
import com.udec.ejb.ProgramaFacade;
import com.udec.ejb.RegistroFacade;
import com.udec.modelo.Facultad;
import com.udec.modelo.Programa;
import com.udec.modelo.Registro;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
public class Controlador extends HttpServlet {

    @EJB
    private RegistroFacade registroFacade;
    @EJB
    private ProgramaFacade programaFacade;
    @EJB
    private FacultadFacade facultadFacade;

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        String action = (String) request.getParameter("action");

        if (action.equals("inicio")) {
            String url = "/inicio.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else {
            if (action.equals("listarFacultades")) {
                String url = "/facultad/listar.jsp";
                sesion.setAttribute("listaF", facultadFacade.findAll());
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                if (action.equals("listarProgramas")) {
                    String url = "/programa/listar.jsp";
                    sesion.setAttribute("listaP", programaFacade.findAll());
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
                    if (action.equals("listarRegistros")) {
                        String url = "/registro/listar.jsp";
                        sesion.setAttribute("listaR", registroFacade.findAll());
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                    } else {
                        if (action.equals("crearFacultad")) {
                            String url = "/facultad/crear.jsp";
                            sesion.setAttribute("listaP", programaFacade.findAll());
                            RequestDispatcher rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                        } else {
                            if (action.equals("crearFacultad2")) {
                                String codigo = (String) request.getParameter("codigo");
                                String nombre = (String) request.getParameter("nombre");
                                Facultad f = new Facultad();
                                f.setIdfacultad(Integer.parseInt(codigo));
                                f.setNombre(nombre);
                                facultadFacade.create(f);
                            } else {
                                if (action.equals("editarFacultad")) {
                                    String url = "/facultad/editar.jsp";
                                    String id = request.getParameter("id");
                                    Facultad f = facultadFacade.find(Integer.parseInt(id));
                                    sesion.setAttribute("facultad", f);
                                    RequestDispatcher rd = request.getRequestDispatcher(url);
                                    rd.forward(request, response);
                                } else {
                                    if (action.equals("editarFacultad2")) {
                                        Facultad f = (Facultad) sesion.getAttribute("facultad");
                                        String nombre = (String) request.getParameter("nombre");
                                        String codigo = (String) request.getParameter("codigo");
                                        f.setIdfacultad(Integer.parseInt(codigo));
                                        f.setNombre(nombre);
                                        facultadFacade.edit(f);
                                    } else {
                                        if (action.equals("crearPrograma")) {
                                            String url = "/programa/crear.jsp";
                                            sesion.setAttribute("listaF", facultadFacade.findAll());
                                            RequestDispatcher rd = request.getRequestDispatcher(url);
                                            rd.forward(request, response);
                                        } else {
                                            if (action.equals("crearPrograma2")) {
                                                String codigo = (String) request.getParameter("codigo");
                                                String nombre = (String) request.getParameter("nombre");
                                                String modalidad = (String) request.getParameter("modalidad");
                                                String formacion = (String) request.getParameter("formacion");
                                                String facultad = (String) request.getParameter("facultad");
                                                Facultad fa = facultadFacade.find(Integer.parseInt(facultad));
                                                Programa p = new Programa();
                                                p.setIdprograma(Integer.parseInt(codigo));
                                                p.setNombre(nombre);
                                                p.setModalidad(modalidad);
                                                p.setTipoFormacion(formacion);
                                                p.setFacultadIdfacultad(fa);
                                                programaFacade.create(p);
                                            } else {
                                                if (action.equals("editarPrograma")) {
                                                    String url = "/programa/editar.jsp";
                                                    String id = request.getParameter("id");
                                                    Programa p = programaFacade.find(Integer.parseInt(id));
                                                    sesion.setAttribute("programa", p);
                                                    sesion.setAttribute("listaF", facultadFacade.findAll());
                                                    sesion.setAttribute("listaR", registroFacade.findAll());
                                                    RequestDispatcher rd = request.getRequestDispatcher(url);
                                                    rd.forward(request, response);
                                                } else {
                                                    if (action.equals("crearRegistro")) {
                                                        String url = "/registro/crear.jsp";
                                                        RequestDispatcher rd = request.getRequestDispatcher(url);
                                                        rd.forward(request, response);
                                                    } else {
                                                        if (action.equals("crearRegistro2")) {
                                                            String resolucion = (String) request.getParameter("resolucion");
                                                            String inicio = (String) request.getParameter("inicio");
                                                            String duracion = (String) request.getParameter("duracion");
                                                            String programa = (String) request.getParameter("programa");
                                                            Programa p = programaFacade.find(Integer.parseInt(programa));
                                                            Registro r = new Registro();
                                                            r.setResolucion(resolucion);
                                                            SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                                                            Date fechaI = null;
                                                            try {

                                                                fechaI = formatoDelTexto.parse(inicio);

                                                            } catch (Exception ex) {

                                                                ex.printStackTrace();

                                                            }

                                                            r.setFechaInicio(fechaI);
                                                            Calendar calendar = Calendar.getInstance();
                                                            calendar.setTime(fechaI);
                                                            calendar.add(Calendar.YEAR, Integer.parseInt(duracion));
                                                            Date ffinal = calendar.getTime();
                                                            r.setFechaVencimiento(ffinal);
                                                            r.setDuracion(Integer.parseInt(duracion));
                                                            r.setProgramaIdprograma(p);
                                                            registroFacade.create(r);
                                                            p.getRegistroList().add(r);
                                                            programaFacade.edit(p);
                                                        } else {
                                                            if (action.equals("editarRegistro")) {
                                                                String url = "/registro/editar.jsp";
                                                                String id = request.getParameter("id");
                                                                Registro r = registroFacade.find(Integer.parseInt(id));
                                                                sesion.setAttribute("registro", r);
                                                                sesion.setAttribute("listaP", programaFacade.findAll());
                                                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                rd.forward(request, response);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
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
