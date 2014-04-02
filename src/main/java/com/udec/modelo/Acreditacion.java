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
@Table(name = "acreditacion", catalog = "registros", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Acreditacion.findAll", query = "SELECT a FROM Acreditacion a"),
    @NamedQuery(name = "Acreditacion.findByIdacreditacion", query = "SELECT a FROM Acreditacion a WHERE a.idacreditacion = :idacreditacion"),
    @NamedQuery(name = "Acreditacion.findByResolucion", query = "SELECT a FROM Acreditacion a WHERE a.resolucion = :resolucion"),
    @NamedQuery(name = "Acreditacion.findByFechaInicio", query = "SELECT a FROM Acreditacion a WHERE a.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "Acreditacion.findByFechaVencimiento", query = "SELECT a FROM Acreditacion a WHERE a.fechaVencimiento = :fechaVencimiento"),
    @NamedQuery(name = "Acreditacion.findByDuracion", query = "SELECT a FROM Acreditacion a WHERE a.duracion = :duracion"),
    @NamedQuery(name = "Acreditacion.findByInicioUno", query = "SELECT a FROM Acreditacion a WHERE a.inicioUno = :inicioUno"),
    @NamedQuery(name = "Acreditacion.findByFinaUno", query = "SELECT a FROM Acreditacion a WHERE a.finaUno = :finaUno"),
    @NamedQuery(name = "Acreditacion.findByInicioDos", query = "SELECT a FROM Acreditacion a WHERE a.inicioDos = :inicioDos"),
    @NamedQuery(name = "Acreditacion.findByFinaDos", query = "SELECT a FROM Acreditacion a WHERE a.finaDos = :finaDos"),
    @NamedQuery(name = "Acreditacion.findByPresentacionAuto", query = "SELECT a FROM Acreditacion a WHERE a.presentacionAuto = :presentacionAuto"),
    @NamedQuery(name = "Acreditacion.findByRadicacion", query = "SELECT a FROM Acreditacion a WHERE a.radicacion = :radicacion")})
public class Acreditacion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idacreditacion")
    private Integer idacreditacion;
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

    public Acreditacion() {
    }

    public Acreditacion(Integer idacreditacion) {
        this.idacreditacion = idacreditacion;
    }

    public Integer getIdacreditacion() {
        return idacreditacion;
    }

    public void setIdacreditacion(Integer idacreditacion) {
        this.idacreditacion = idacreditacion;
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

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public Date getInicioUno() {
        return inicioUno;
    }

    public void setInicioUno(Date inicioUno) {
        this.inicioUno = inicioUno;
    }

    public Date getFinaUno() {
        return finaUno;
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
    
    public Date fechaPrimeraAutoevaluacion() {
        Calendar c = Calendar.getInstance();
        c.setTime(this.getFechaVencimiento());
        if (this.duracion == 4) {
            c.add(Calendar.YEAR, -2);
        } else {
            if (this.duracion == 6) {
                c.add(Calendar.YEAR, -3);
            }
        }

        return c.getTime();
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
            faltan += " para el vencimiento de la acreditación";
        } else {
            if (endCalendar.before(startCalendar)) {
                faltan += "La acreditacion esta vencida hace ";
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
                faltan += "La acreditación vence hoy";
            }
        }

        return faltan;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idacreditacion != null ? idacreditacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Acreditacion)) {
            return false;
        }
        Acreditacion other = (Acreditacion) object;
        if ((this.idacreditacion == null && other.idacreditacion != null) || (this.idacreditacion != null && !this.idacreditacion.equals(other.idacreditacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.modelo.Acreditacion[ idacreditacion=" + idacreditacion + " ]";
    }
    
}
