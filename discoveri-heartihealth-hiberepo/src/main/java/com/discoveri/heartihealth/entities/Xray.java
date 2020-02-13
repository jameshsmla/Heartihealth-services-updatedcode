package com.discoveri.heartihealth.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the xray database table.
 * 
 */
@Entity
@NamedQuery(name="Xray.findAll", query="SELECT x FROM Xray x")
public class Xray implements Serializable {
	private static final long serialVersionUID = 1L;

	

	private int ca;

	@Column(name="cardiodiagnosis_cardio_id")
	private int cardiodiagnosisCardioId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	@Id
	@Column(name="xray_id")
	private int xrayId;

	public Xray() {
	}

	public int getCa() {
		return this.ca;
	}

	public void setCa(int ca) {
		this.ca = ca;
	}

	public int getCardiodiagnosisCardioId() {
		return this.cardiodiagnosisCardioId;
	}

	public void setCardiodiagnosisCardioId(int cardiodiagnosisCardioId) {
		this.cardiodiagnosisCardioId = cardiodiagnosisCardioId;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getXrayId() {
		return this.xrayId;
	}

	public void setXrayId(int xrayId) {
		this.xrayId = xrayId;
	}

}