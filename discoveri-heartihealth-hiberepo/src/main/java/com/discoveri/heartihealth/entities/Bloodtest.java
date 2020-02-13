package com.discoveri.heartihealth.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the bloodtest database table.
 * 
 */
@Entity
@NamedQuery(name = "Bloodtest.findAll", query = "SELECT b FROM Bloodtest b")
public class Bloodtest implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "blood_id")
	private int bloodId;

	private int bloodpressure;

	@Column(name = "cardiodiagnosis_cardio_id")
	private int cardiodiagnosisCardioId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	private int fbs;

	private int serumcholesterol;

	private int thal;

	public Bloodtest() {
	}

	public int getBloodId() {
		return this.bloodId;
	}

	public void setBloodId(int bloodId) {
		this.bloodId = bloodId;
	}

	public int getBloodpressure() {
		return this.bloodpressure;
	}

	public void setBloodpressure(int bloodpressure) {
		this.bloodpressure = bloodpressure;
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

	public int getFbs() {
		return this.fbs;
	}

	public void setFbs(int fbs) {
		this.fbs = fbs;
	}

	public int getSerumcholesterol() {
		return this.serumcholesterol;
	}

	public void setSerumcholesterol(int serumcholesterol) {
		this.serumcholesterol = serumcholesterol;
	}

	public int getThal() {
		return this.thal;
	}

	public void setThal(int thal) {
		this.thal = thal;
	}

}