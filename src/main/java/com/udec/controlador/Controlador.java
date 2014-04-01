/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.controlador;

import com.udec.ejb.AcreditacionFacade;
import com.udec.ejb.FacultadFacade;
import com.udec.ejb.ProgramaFacade;
import com.udec.ejb.RegistroFacade;
import com.udec.ejb.UsuariosFacade;
import com.udec.modelo.Acreditacion;
import com.udec.modelo.Facultad;
import com.udec.modelo.Programa;
import com.udec.modelo.Registro;
import com.udec.modelo.Usuarios;
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
    private AcreditacionFacade acreditacionFacade;
    @EJB
    private UsuariosFacade usuariosFacade;
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
                    String tipo = (String) sesion.getAttribute("tipo");
                    Usuarios us = (Usuarios) sesion.getAttribute("usuario");
                    if (tipo.equals("Decano")) {
                        sesion.setAttribute("listaP", programaFacade.findByList("facultadIdfacultad", us.getFacultadIdfacultad()));
                    } else {
                        if (tipo.equals("Director postgrado")) {
                            sesion.setAttribute("listaP", programaFacade.findByList("tipoFormacion", "Postgrado"));
                        } else {
                            sesion.setAttribute("listaP", programaFacade.findAll());
                        }

                    }

                    sesion.setAttribute("fechaActual", new Date());
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
                                                        sesion.setAttribute("listaP", programaFacade.findAll());
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
                                                            } else {
                                                                if (action.equals("editarRegistro2")) {
                                                                    Registro r = (Registro) sesion.getAttribute("registro");
                                                                    String resolucion = (String) request.getParameter("resolucion");
                                                                    String finicio = (String) request.getParameter("inicio");
                                                                    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                                                                    Date fechaI = null;
                                                                    try {

                                                                        fechaI = formatoDelTexto.parse(finicio);

                                                                    } catch (Exception ex) {

                                                                        ex.printStackTrace();

                                                                    }

                                                                    String duracion = (String) request.getParameter("duracion");
                                                                    String programa = (String) request.getParameter("programa");
                                                                    String inicioUno = (String) request.getParameter("inicioUno");
                                                                    String inicioDos = (String) request.getParameter("inicioDos");
                                                                    String finaDos = (String) request.getParameter("finaDos");
                                                                    String finaUno = (String) request.getParameter("finaUno");
                                                                    String presentacionAuto = (String) request.getParameter("presentacionAuto");
                                                                    String radicacion = (String) request.getParameter("radicacion");

                                                                    Date inicio_uno = null;
                                                                    if (!inicioUno.equals("")) {
                                                                        try {

                                                                            inicio_uno = formatoDelTexto.parse(inicioUno);

                                                                        } catch (Exception ex) {

                                                                            ex.printStackTrace();

                                                                        }
                                                                    }

                                                                    Date inicio_dos = null;
                                                                    if (!inicioDos.equals("")) {
                                                                        try {

                                                                            inicio_dos = formatoDelTexto.parse(inicioDos);

                                                                        } catch (Exception ex) {

                                                                            ex.printStackTrace();

                                                                        }
                                                                    }

                                                                    Date fina_uno = null;
                                                                    if (!finaUno.equals("")) {
                                                                        try {

                                                                            fina_uno = formatoDelTexto.parse(finaUno);

                                                                        } catch (Exception ex) {

                                                                            ex.printStackTrace();

                                                                        }
                                                                    }

                                                                    Date fina_dos = null;
                                                                    if (!finaDos.equals("")) {
                                                                        try {

                                                                            fina_dos = formatoDelTexto.parse(finaDos);

                                                                        } catch (Exception ex) {

                                                                            ex.printStackTrace();

                                                                        }
                                                                    }

                                                                    Date presentacion_auto = null;
                                                                    if (!presentacionAuto.equals("")) {
                                                                        try {

                                                                            presentacion_auto = formatoDelTexto.parse(presentacionAuto);

                                                                        } catch (Exception ex) {

                                                                            ex.printStackTrace();

                                                                        }
                                                                    }

                                                                    Date radica = null;
                                                                    if (!radicacion.equals("")) {
                                                                        try {

                                                                            radica = formatoDelTexto.parse(radicacion);

                                                                        } catch (Exception ex) {

                                                                            ex.printStackTrace();

                                                                        }
                                                                    }

                                                                    Calendar calendar = Calendar.getInstance();
                                                                    calendar.setTime(fechaI);
                                                                    calendar.add(Calendar.YEAR, Integer.parseInt(duracion));
                                                                    Date ffinal = calendar.getTime();

                                                                    r.setFechaVencimiento(ffinal);
                                                                    r.setResolucion(resolucion);
                                                                    r.setFechaInicio(fechaI);
                                                                    r.setDuracion(Integer.parseInt(duracion));
                                                                    r.setProgramaIdprograma(programaFacade.find(Integer.parseInt(programa)));
                                                                    r.setInicioUno(inicio_uno);
                                                                    r.setInicioDos(inicio_dos);
                                                                    r.setFinaUno(fina_uno);
                                                                    r.setFinaDos(fina_dos);
                                                                    r.setPresentacionAuto(presentacion_auto);
                                                                    r.setRadicacion(radica);
                                                                    registroFacade.edit(r);
                                                                } else {
                                                                    if (action.equals("listarDecanos")) {
                                                                        String url = "/decanos/listar.jsp";
                                                                        sesion.setAttribute("listaD", usuariosFacade.findByList("tipo", "Decano"));
                                                                        RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                        rd.forward(request, response);
                                                                    } else {
                                                                        if (action.equals("crearDecano")) {
                                                                            String url = "/decanos/crear.jsp";
                                                                            sesion.setAttribute("facultades", facultadFacade.findAll());
                                                                            RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                            rd.forward(request, response);
                                                                        } else {
                                                                            if (action.equals("crearDecano2")) {
                                                                                String codigo = (String) request.getParameter("codigo");
                                                                                String nombres = (String) request.getParameter("nombres");
                                                                                String apellidos = (String) request.getParameter("apellidos");
                                                                                String clave = (String) request.getParameter("clave");
                                                                                String facultad = (String) request.getParameter("facultad");
                                                                                Facultad fa = facultadFacade.find(Integer.parseInt(facultad));
                                                                                Usuarios decano = new Usuarios();
                                                                                decano.setApellidos(apellidos);
                                                                                decano.setCedula(Integer.parseInt(codigo));
                                                                                decano.setNombres(nombres);
                                                                                decano.setClave(clave);
                                                                                decano.setFacultadIdfacultad(fa);
                                                                                decano.setTipo("Decano");
                                                                                usuariosFacade.create(decano);
                                                                            } else {
                                                                                if (action.equals("editarDecano")) {
                                                                                    String url = "/decanos/editar.jsp";
                                                                                    Usuarios decano = null;
                                                                                    String iddecano = (String) request.getParameter("id");

                                                                                    if (iddecano != null) {
                                                                                        decano = usuariosFacade.find(Integer.parseInt(iddecano));
                                                                                    }
                                                                                    sesion.setAttribute("decano", decano);
                                                                                    sesion.setAttribute("facultades", facultadFacade.findAll());
                                                                                    RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                                    rd.forward(request, response);
                                                                                } else {
                                                                                    if (action.equals("editarDecano2")) {
                                                                                        String codigo = (String) request.getParameter("codigo");
                                                                                        String nombres = (String) request.getParameter("nombres");
                                                                                        String apellidos = (String) request.getParameter("apellidos");
                                                                                        String clave = (String) request.getParameter("clave");
                                                                                        String facultad = (String) request.getParameter("facultad");
                                                                                        Facultad fa = facultadFacade.find(Integer.parseInt(facultad));
                                                                                        Usuarios decano = usuariosFacade.find(Integer.parseInt(codigo));
                                                                                        decano.setApellidos(apellidos);
                                                                                        decano.setNombres(nombres);
                                                                                        decano.setClave(clave);
                                                                                        decano.setFacultadIdfacultad(fa);
                                                                                        usuariosFacade.edit(decano);
                                                                                    } else {
                                                                                        if (action.equals("listarAcreditaciones")) {
                                                                                            String url = "/acreditacion/listar.jsp";
                                                                                            sesion.setAttribute("listaA", acreditacionFacade.findAll());
                                                                                            RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                                            rd.forward(request, response);
                                                                                        } else {
                                                                                            if (action.equals("crearAcreditacion")) {
                                                                                                String url = "/acreditacion/crear.jsp";
                                                                                                sesion.setAttribute("listaP", programaFacade.findAll());
                                                                                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                                                rd.forward(request, response);
                                                                                            } else {
                                                                                                if (action.equals("crearAcreditacion2")) {
                                                                                                    String resolucion = (String) request.getParameter("resolucion");
                                                                                                    String inicio = (String) request.getParameter("inicio");
                                                                                                    String duracion = (String) request.getParameter("duracion");
                                                                                                    String programa = (String) request.getParameter("programa");
                                                                                                    Programa p = programaFacade.find(Integer.parseInt(programa));
                                                                                                    Acreditacion ac = new Acreditacion();
                                                                                                    ac.setResolucion(resolucion);
                                                                                                    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                                                                                                    Date fechaI = null;
                                                                                                    try {

                                                                                                        fechaI = formatoDelTexto.parse(inicio);

                                                                                                    } catch (Exception ex) {

                                                                                                        ex.printStackTrace();

                                                                                                    }

                                                                                                    ac.setFechaInicio(fechaI);
                                                                                                    Calendar calendar = Calendar.getInstance();
                                                                                                    calendar.setTime(fechaI);
                                                                                                    calendar.add(Calendar.YEAR, Integer.parseInt(duracion));
                                                                                                    Date ffinal = calendar.getTime();
                                                                                                    ac.setFechaVencimiento(ffinal);
                                                                                                    ac.setDuracion(Integer.parseInt(duracion));
                                                                                                    ac.setProgramaIdprograma(p);
                                                                                                    acreditacionFacade.create(ac);
                                                                                                    p.getAcreditacionList().add(ac);
                                                                                                    programaFacade.edit(p);
                                                                                                } else {
                                                                                                    if (action.equals("editarAcreditacion")) {
                                                                                                        String url = "/acreditacion/editar.jsp";
                                                                                                        String id = request.getParameter("id");
                                                                                                        Acreditacion ac = acreditacionFacade.find(Integer.parseInt(id));
                                                                                                        sesion.setAttribute("acreditacion", ac);
                                                                                                        sesion.setAttribute("listaP", programaFacade.findAll());
                                                                                                        RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                                                        rd.forward(request, response);
                                                                                                    } else {
                                                                                                        if (action.equals("editarAcreditacion2")) {
                                                                                                            Acreditacion r = (Acreditacion) sesion.getAttribute("acreditacion");
                                                                                                            String resolucion = (String) request.getParameter("resolucion");
                                                                                                            String finicio = (String) request.getParameter("inicio");
                                                                                                            SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                                                                                                            Date fechaI = null;
                                                                                                            try {

                                                                                                                fechaI = formatoDelTexto.parse(finicio);

                                                                                                            } catch (Exception ex) {

                                                                                                                ex.printStackTrace();

                                                                                                            }

                                                                                                            String duracion = (String) request.getParameter("duracion");
                                                                                                            String programa = (String) request.getParameter("programa");
                                                                                                            String inicioUno = (String) request.getParameter("inicioUno");
                                                                                                            String inicioDos = (String) request.getParameter("inicioDos");
                                                                                                            String finaDos = (String) request.getParameter("finaDos");
                                                                                                            String finaUno = (String) request.getParameter("finaUno");
                                                                                                            String presentacionAuto = (String) request.getParameter("presentacionAuto");
                                                                                                            String radicacion = (String) request.getParameter("radicacion");

                                                                                                            Date inicio_uno = null;
                                                                                                            if (!inicioUno.equals("")) {
                                                                                                                try {

                                                                                                                    inicio_uno = formatoDelTexto.parse(inicioUno);

                                                                                                                } catch (Exception ex) {

                                                                                                                    ex.printStackTrace();

                                                                                                                }
                                                                                                            }

                                                                                                            Date inicio_dos = null;
                                                                                                            if (!inicioDos.equals("")) {
                                                                                                                try {

                                                                                                                    inicio_dos = formatoDelTexto.parse(inicioDos);

                                                                                                                } catch (Exception ex) {

                                                                                                                    ex.printStackTrace();

                                                                                                                }
                                                                                                            }

                                                                                                            Date fina_uno = null;
                                                                                                            if (!finaUno.equals("")) {
                                                                                                                try {

                                                                                                                    fina_uno = formatoDelTexto.parse(finaUno);

                                                                                                                } catch (Exception ex) {

                                                                                                                    ex.printStackTrace();

                                                                                                                }
                                                                                                            }

                                                                                                            Date fina_dos = null;
                                                                                                            if (!finaDos.equals("")) {
                                                                                                                try {

                                                                                                                    fina_dos = formatoDelTexto.parse(finaDos);

                                                                                                                } catch (Exception ex) {

                                                                                                                    ex.printStackTrace();

                                                                                                                }
                                                                                                            }

                                                                                                            Date presentacion_auto = null;
                                                                                                            if (!presentacionAuto.equals("")) {
                                                                                                                try {

                                                                                                                    presentacion_auto = formatoDelTexto.parse(presentacionAuto);

                                                                                                                } catch (Exception ex) {

                                                                                                                    ex.printStackTrace();

                                                                                                                }
                                                                                                            }

                                                                                                            Date radica = null;
                                                                                                            if (!radicacion.equals("")) {
                                                                                                                try {

                                                                                                                    radica = formatoDelTexto.parse(radicacion);

                                                                                                                } catch (Exception ex) {

                                                                                                                    ex.printStackTrace();

                                                                                                                }
                                                                                                            }

                                                                                                            Calendar calendar = Calendar.getInstance();
                                                                                                            calendar.setTime(fechaI);
                                                                                                            calendar.add(Calendar.YEAR, Integer.parseInt(duracion));
                                                                                                            Date ffinal = calendar.getTime();

                                                                                                            r.setFechaVencimiento(ffinal);
                                                                                                            r.setResolucion(resolucion);
                                                                                                            r.setFechaInicio(fechaI);
                                                                                                            r.setDuracion(Integer.parseInt(duracion));
                                                                                                            r.setProgramaIdprograma(programaFacade.find(Integer.parseInt(programa)));
                                                                                                            r.setInicioUno(inicio_uno);
                                                                                                            r.setInicioDos(inicio_dos);
                                                                                                            r.setFinaUno(fina_uno);
                                                                                                            r.setFinaDos(fina_dos);
                                                                                                            r.setPresentacionAuto(presentacion_auto);
                                                                                                            r.setRadicacion(radica);
                                                                                                            acreditacionFacade.edit(r);
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
