package com.discoveri.heartihealth.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the ecgreport database table.
 * 
 */
@Entity
@NamedQuery(name="Ecgreport.findAll", query="SELECT e FROM Ecgreport e")
public class Ecgreport implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="cardiodiagnosis_cardio_id")
	private int cardiodiagnosisCardioId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	@Id
	@Column(name="ecg_id")
	private int ecgId;

	private int restecg;

	public Ecgreport() {
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

	public int getEcgId() {
		return this.ecgId;
	}

	public void setEcgId(int ecgId) {
		this.ecgId = ecgId;
	}

	public int getRestecg() {
		return this.restecg;
	}

	public void setRestecg(int restecg) {
		this.restecg = restecg;
	}

}