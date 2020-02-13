package com.discoveri.heartihealth.repositoryImpl;

import java.util.ArrayList;
import java.util.List;

import org.discoveri.heartihealth.configuration.HibernateConfig;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.discoveri.heartihealth.dto.IntervalReportWeeklyDTO;
import com.discoveri.heartihealth.dto.LivePrediction;
import com.discoveri.heartihealth.dto.TotalPredictionWeeklyDTO;
import com.discoveri.heartihealth.exceptions.HeartiException;
import com.discoveri.heartihealth.repository.HeartInfoRepo;
import com.discoveri.heartihealth.repository.HeartLiveInfoRepo;

@Repository
public class HeartInfoRepoImpl implements HeartInfoRepo {

	@Autowired
	public HeartLiveInfoRepo heartLiveInfoRepo;

	@Override
	public List<IntervalReportWeeklyDTO> getWeeklyPredictionsReport() throws HeartiException {

		List<IntervalReportWeeklyDTO> weeklyPredictions = new ArrayList<IntervalReportWeeklyDTO>();

		Session sessionCon = null;
		Transaction transaction = null;
		try {
			sessionCon = HibernateConfig.buildSessionFactory().openSession();
			transaction = sessionCon.getTransaction();
			transaction.begin();

			String sqlQuery = "select DAYNAME(c.diagnoseddate) ,SUM(c.cardioarrestdetected), SUM(c.isrecovered) "
					+ "from Memberinfo m inner join CardioHistory c on m.member_id = c.memberinfo_member_id "
					+ "WHERE c.diagnoseddate > DATE_SUB(NOW(), INTERVAL 1 WEEK) and c.diagnoseddate <= Date(NOW()) GROUP BY Date(c.diagnoseddate)";

			List<Object[]> predictionObjects = sessionCon.createNativeQuery(sqlQuery).list();

			for (Object[] objects : predictionObjects) {
				IntervalReportWeeklyDTO prediction = new IntervalReportWeeklyDTO();
				prediction.setInterval(objects[0].toString());
				prediction.setCured(Integer.parseInt(objects[1].toString()));
				prediction.setPredicted(Integer.parseInt(objects[2].toString()));

				weeklyPredictions.add(prediction);

			}

		}

		catch (Exception e) {
			if (null != sessionCon.getTransaction()) {
				sessionCon.getTransaction().rollback();
			}

			throw new HeartiException(e.getMessage());
		} finally {
			if (sessionCon != null) {
				sessionCon.close();
			}
		}

		return weeklyPredictions;
	}

	@Override
	public List<TotalPredictionWeeklyDTO> getTotalPredictionByWeekly() throws HeartiException {
		List<TotalPredictionWeeklyDTO> weeklyPredictions = new ArrayList<TotalPredictionWeeklyDTO>();

		Session sessionCon = null;
		Transaction transaction = null;
		int prevPrediction = 1;
		boolean ignoreFirst = true;
		try {
			sessionCon = HibernateConfig.buildSessionFactory().openSession();
			transaction = sessionCon.getTransaction();
			transaction.begin();

			String sqlQuery = "SELECT DAYNAME(c.diagnoseddate),sum(c.cardioarrestdetected) from "
					+ "memberinfo m inner join cardiohistory c on m.member_id = c.memberinfo_member_id "
					+ "WHERE c.diagnoseddate >   DATE_SUB(NOW(), INTERVAL 8 day) and c.diagnoseddate <= Date(NOW())  "
					+ "group by Date(c.diagnoseddate)";

			List<Object[]> predictionObjects = sessionCon.createNativeQuery(sqlQuery).list();

			for (Object[] objects : predictionObjects) {
				TotalPredictionWeeklyDTO prediction = new TotalPredictionWeeklyDTO();

				prediction.setInterval(objects[0].toString());
				prediction.setTotalPrediction(Integer.parseInt(objects[1].toString()));
				prediction.setVariation(
						HeartiInfoRepoUtil.findVariation(prediction.getTotalPrediction(), prevPrediction));
				prediction.setUp(prediction.getVariation() < 0 ? false : true);

				prevPrediction = prediction.getTotalPrediction();

				ignoreFirst = ignoreFirst ? false : weeklyPredictions.add(prediction);
				ignoreFirst = false;

			}

		}

		catch (Exception e) {
			if (null != sessionCon.getTransaction()) {
				sessionCon.getTransaction().rollback();
			}

			throw new HeartiException(e.getMessage());
		} finally {
			if (sessionCon != null) {
				sessionCon.close();
			}
		}

		return weeklyPredictions;
	}

	@Override
	public List<LivePrediction> getLivePrediction() throws HeartiException {
		List<LivePrediction> livePredictions = new ArrayList<LivePrediction>();

		livePredictions.add(heartLiveInfoRepo.getLivePredictionByChestPain());
		livePredictions.add(heartLiveInfoRepo.getLivePredictionByBloodPressure());
		livePredictions.add(heartLiveInfoRepo.getLivePredictionByCholesterol());

		return livePredictions;
	}

}
