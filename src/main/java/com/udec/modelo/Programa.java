/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "programa", catalog = "registros", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Programa.findAll", query = "SELECT p FROM Programa p"),
    @NamedQuery(name = "Programa.findByIdprograma", query = "SELECT p FROM Programa p WHERE p.idprograma = :idprograma"),
    @NamedQuery(name = "Programa.findByNombre", query = "SELECT p FROM Programa p WHERE p.nombre = :nombre"),
    @NamedQuery(name = "Programa.findByModalidad", query = "SELECT p FROM Programa p WHERE p.modalidad = :modalidad"),
    @NamedQuery(name = "Programa.findByTipoFormacion", query = "SELECT p FROM Programa p WHERE p.tipoFormacion = :tipoFormacion")})
public class Programa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idprograma")
    private Integer idprograma;
    @Size(max = 255)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 255)
    @Column(name = "modalidad")
    private String modalidad;
    @Size(max = 255)
    @Column(name = "tipo_formacion")
    private String tipoFormacion;
    @JoinColumn(name = "facultad_idfacultad", referencedColumnName = "idfacultad")
    @ManyToOne(optional = false)
    private Facultad facultadIdfacultad;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "programaIdprograma")
    private List<Registro> registroList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "programaIdprograma")
    private List<Acreditacion> acreditacionList;

    public Programa() {
    }

    public Programa(Integer idprograma) {
        this.idprograma = idprograma;
    }

    public Integer getIdprograma() {
        return idprograma;
    }

    public void setIdprograma(Integer idprograma) {
        this.idprograma = idprograma;
    }

    public Registro getUltimoRegistro() {
        if (this.getRegistroList().isEmpty()) {
            return null;
        } else {
            Registro r = this.getRegistroList().get(0);
            for (Registro registro : registroList) {
                if (registro.getFechaInicio().after(r.getFechaInicio())) {
                    r = registro;
                }
            }
            return r;
        }
    }
    
    public Acreditacion getUltimaAcreditacion() {
        if (this.getAcreditacionList().isEmpty()) {
            return null;
        } else {
            Acreditacion a = this.getAcreditacionList().get(0);
            for (Acreditacion acreditacion : acreditacionList) {
                if (acreditacion.getFechaInicio().after(a.getFechaInicio())) {
                    a = acreditacion;
                }
            }
            return a;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public String getTipoFormacion() {
        return tipoFormacion;
    }

    public void setTipoFormacion(String tipoFormacion) {
        this.tipoFormacion = tipoFormacion;
    }

    public Facultad getFacultadIdfacultad() {
        return facultadIdfacultad;
    }

    public void setFacultadIdfacultad(Facultad facultadIdfacultad) {
        this.facultadIdfacultad = facultadIdfacultad;
    }

    @XmlTransient
    public List<Registro> getRegistroList() {
        return registroList;
    }

    public void setRegistroList(List<Registro> registroList) {
        this.registroList = registroList;
    }

    @XmlTransient
    public List<Acreditacion> getAcreditacionList() {
        return acreditacionList;
    }

    public void setAcreditacionList(List<Acreditacion> acreditacionList) {
        this.acreditacionList = acreditacionList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idprograma != null ? idprograma.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Programa)) {
            return false;
        }
        Programa other = (Programa) object;
        if ((this.idprograma == null && other.idprograma != null) || (this.idprograma != null && !this.idprograma.equals(other.idprograma))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.modelo.Programa[ idprograma=" + idprograma + " ]";
    }

    public boolean comparar(Date d1, Date d2) {
        return d1.before(d2);
    }
}
