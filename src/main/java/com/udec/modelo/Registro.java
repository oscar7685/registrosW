/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.modelo;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "registro", catalog = "registros", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Registro.findAll", query = "SELECT r FROM Registro r"),
    @NamedQuery(name = "Registro.findByIdregistro", query = "SELECT r FROM Registro r WHERE r.idregistro = :idregistro"),
    @NamedQuery(name = "Registro.findByResolucion", query = "SELECT r FROM Registro r WHERE r.resolucion = :resolucion"),
    @NamedQuery(name = "Registro.findByFechaInicio", query = "SELECT r FROM Registro r WHERE r.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "Registro.findByFechaVencimiento", query = "SELECT r FROM Registro r WHERE r.fechaVencimiento = :fechaVencimiento"),
    @NamedQuery(name = "Registro.findByDuracion", query = "SELECT r FROM Registro r WHERE r.duracion = :duracion"),
    @NamedQuery(name = "Registro.findByInicioUno", query = "SELECT r FROM Registro r WHERE r.inicioUno = :inicioUno"),
    @NamedQuery(name = "Registro.findByFinaUno", query = "SELECT r FROM Registro r WHERE r.finaUno = :finaUno"),
    @NamedQuery(name = "Registro.findByInicioDos", query = "SELECT r FROM Registro r WHERE r.inicioDos = :inicioDos"),
    @NamedQuery(name = "Registro.findByFinaDos", query = "SELECT r FROM Registro r WHERE r.finaDos = :finaDos"),
    @NamedQuery(name = "Registro.findByPresentacionAuto", query = "SELECT r FROM Registro r WHERE r.presentacionAuto = :presentacionAuto"),
    @NamedQuery(name = "Registro.findByRadicacion", query = "SELECT r FROM Registro r WHERE r.radicacion = :radicacion")})
public class Registro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idregistro")
    private Integer idregistro;
    @Size(max = 255)
    @Column(name = "resolucion")
    private String resolucion;
    @Column(name = "fecha_inicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Column(name = "fecha_vencimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaVencimiento;
    @Column(name = "duracion")
    private Integer duracion;
    @Column(name = "inicio_uno")
    @Temporal(TemporalType.DATE)
    private Date inicioUno;
    @Column(name = "fina_uno")
    @Temporal(TemporalType.DATE)
    private Date finaUno;
    @Column(name = "inicio_dos")
    @Temporal(TemporalType.DATE)
    private Date inicioDos;
    @Column(name = "fina_dos")
    @Temporal(TemporalType.DATE)
    private Date finaDos;
    @Column(name = "presentacion_auto")
    @Temporal(TemporalType.DATE)
    private Date presentacionAuto;
    @Column(name = "radicacion")
    @Temporal(TemporalType.DATE)
    private Date radicacion;
    @JoinColumn(name = "programa_idprograma", referencedColumnName = "idprograma")
    @ManyToOne(optional = false)
    private Programa programaIdprograma;

    public Registro() {
    }

    public Registro(Integer idregistro) {
        this.idregistro = idregistro;
    }

    public Integer getIdregistro() {
        return idregistro;
    }

    public void setIdregistro(Integer idregistro) {
        this.idregistro = idregistro;
    }

    public String getResolucion() {
        return resolucion;
    }

    public void setResolucion(String resolucion) {
        this.resolucion = resolucion;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public Integer getDuracion() {
        return duracion;
    }

    public Date diezMesesAntes() {
        Calendar c = Calendar.getInstance();
        c.setTime(this.getFechaVencimiento());
        c.add(Calendar.MONTH, -10);
        return c.getTime();
    }

    public Date unAnioAntes() {
        Calendar c = Calendar.getInstance();
        c.setTime(this.getFechaVencimiento());
        c.add(Calendar.YEAR, -1);
        return c.getTime();
    }

    public Date getInicioUno() {
        return inicioUno;
    }

    public Date fechaSegundaAutoevaluacion() {
        Calendar c = Calendar.getInstance();
        c.setTime(this.getFechaVencimiento());
        if (this.duracion == 7) {
            c.add(Calendar.YEAR, -2);
        } else {
            if (this.duracion == 5) {
                c.add(Calendar.YEAR, -2);
            }
        }

        return c.getTime();
    }

    public void setInicioUno(Date inicioUno) {
        this.inicioUno = inicioUno;
    }

    public Date fechaPrimeraAutoevaluacion() {
        Calendar c = Calendar.getInstance();
        c.setTime(this.getFechaVencimiento());
        if (this.duracion == 7) {
            c.add(Calendar.YEAR, -4);
        } else {
            if (this.duracion == 5) {
                c.add(Calendar.YEAR, -4);
            }
        }

        return c.getTime();
    }

    public String DiferenciaEnDiasMesesYAnos() {
        String faltan = "";
        Calendar startCalendar = new GregorianCalendar();
        startCalendar.setTime(new java.util.Date());
        Calendar endCalendar = new GregorianCalendar();
        endCalendar.setTime(this.getFechaVencimiento());

        int diffYear = endCalendar.get(Calendar.YEAR) - startCalendar.get(Calendar.YEAR);
        int diffMonth = endCalendar.get(Calendar.MONTH) - startCalendar.get(Calendar.MONTH);
        int diffDias = endCalendar.get(Calendar.DAY_OF_MONTH) - startCalendar.get(Calendar.DAY_OF_MONTH);
        if (endCalendar.after(startCalendar)) {
            faltan = "Falta(n) ";
            if (diffYear > 0) {
                if (diffMonth == 1) {
                    faltan += diffYear + " año ";
                } else {
                    faltan += diffYear + " años ";
                }

            }
            if (diffMonth > 0) {
                if (diffMonth == 1) {
                    faltan += diffMonth + " mes ";
                } else {
                    faltan += diffMonth + " meses ";
                }

            }
            if (diffDias > 0) {
                if (diffDias == 1) {
                    faltan += diffDias + " dia ";
                } else {
                    faltan += diffDias + " dias ";
                }

            }
            faltan += " para el vencimiento del registro calificado";
        } else {
            if (endCalendar.before(startCalendar)) {
                faltan += "El registro calificado esta vencido hace ";
                if (diffYear > 0) {
                    if (diffMonth == 1) {
                        faltan += diffYear + " año ";
                    } else {
                        faltan += diffYear + " años ";
                    }

                }
                if (diffMonth > 0) {
                    if (diffMonth == 1) {
                        faltan += diffMonth + " mes ";
                    } else {
                        faltan += diffMonth + " meses ";
                    }

                }
                if (diffDias > 0) {
                    if (diffDias == 1) {
                        faltan += diffDias + " dia ";
                    } else {
                        faltan += diffDias + " dias ";
                    }

                }
            } else {
                faltan += "El registro calificado vence hoy";
            }
        }

        return faltan;
    }

    public Date getFinaUno() {
        return finaUno;
    }

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public void setFinaUno(Date finaUno) {
        this.finaUno = finaUno;
    }

    public Date getInicioDos() {
        return inicioDos;
    }

    public void setInicioDos(Date inicioDos) {
        this.inicioDos = inicioDos;
    }

    public Date getFinaDos() {
        return finaDos;
    }

    public void setFinaDos(Date finaDos) {
        this.finaDos = finaDos;
    }

    public Date getPresentacionAuto() {
        return presentacionAuto;
    }

    public void setPresentacionAuto(Date presentacionAuto) {
        this.presentacionAuto = presentacionAuto;
    }

    public Date getRadicacion() {
        return radicacion;
    }

    public void setRadicacion(Date radicacion) {
        this.radicacion = radicacion;
    }

    public Programa getProgramaIdprograma() {
        return programaIdprograma;
    }

    public void setProgramaIdprograma(Programa programaIdprograma) {
        this.programaIdprograma = programaIdprograma;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idregistro != null ? idregistro.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Registro)) {
            return false;
        }
        Registro other = (Registro) object;
        if ((this.idregistro == null && other.idregistro != null) || (this.idregistro != null && !this.idregistro.equals(other.idregistro))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.modelo.Registro[ idregistro=" + idregistro + " ]";
    }

}
