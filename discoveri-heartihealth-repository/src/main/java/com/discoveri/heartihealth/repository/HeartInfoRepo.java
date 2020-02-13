package com.discoveri.heartihealth.repository;

import java.util.List;

import com.discoveri.heartihealth.dto.TotalPredictionWeeklyDTO;
import com.discoveri.heartihealth.dto.IntervalReportWeeklyDTO;
import com.discoveri.heartihealth.dto.LivePrediction;
import com.discoveri.heartihealth.exceptions.HeartiException;

public interface HeartInfoRepo {

	List<IntervalReportWeeklyDTO> getWeeklyPredictionsReport() throws HeartiException;

	List<TotalPredictionWeeklyDTO> getTotalPredictionByWeekly() throws HeartiException;
	
	List<LivePrediction> getLivePrediction() throws HeartiException;
	
	

}
