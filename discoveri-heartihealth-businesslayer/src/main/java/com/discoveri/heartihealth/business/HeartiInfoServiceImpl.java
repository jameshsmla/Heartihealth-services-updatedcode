package com.discoveri.heartihealth.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discoveri.heartihealth.dto.IntervalReportWeeklyDTO;
import com.discoveri.heartihealth.dto.LivePrediction;
import com.discoveri.heartihealth.dto.TotalPredictionWeeklyDTO;
import com.discoveri.heartihealth.exceptions.HeartiException;
import com.discoveri.heartihealth.repository.HeartInfoRepo;

@Service
public class HeartiInfoServiceImpl implements HeartiInfoService {

	@Autowired
	public HeartInfoRepo heartInfoRepo;

	@Override
	public List<TotalPredictionWeeklyDTO> getTotaPredictionByWeekly() throws HeartiException {

		return heartInfoRepo.getTotalPredictionByWeekly();
	}

	@Override
	public List<IntervalReportWeeklyDTO> getWeeklyPredictionsReport() throws HeartiException {
		// TODO Auto-generated method stub
		return heartInfoRepo.getWeeklyPredictionsReport();
	}

	@Override
	public List<LivePrediction> getLivePrediction() throws HeartiException {
		// TODO Auto-generated method stub
		return heartInfoRepo.getLivePrediction();
	}

}
