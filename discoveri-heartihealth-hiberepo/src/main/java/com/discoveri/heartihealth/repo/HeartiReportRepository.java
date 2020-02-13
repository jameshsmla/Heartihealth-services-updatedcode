package com.discoveri.heartihealth.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.discoveri.heartihealth.dto.IntervalReportDTO;
import com.discoveri.heartihealth.entities.Cardiohistory;

@Repository
public interface HeartiReportRepository extends CrudRepository<Cardiohistory, Integer> {

	@Query("select new  com.discoveri.heartihealth.dto.IntervalReportYearlyDTO( DAYNAME(c.diagnosedDate) ,SUM(c.cardioArrestDetected), SUM(c.isRecovered))  "
			+ "from com.discoveri.heartihealth.entities.Memberinfo m inner join com.discoveri.heartihealth.entities.Cardiohistory c on m.memberId = c.memberInfoMemberId "
			+ "WHERE c.diagnosedDate > DATE_SUB(NOW(), INTERVAL 1 WEEK) and c.diagnosedDate <= Date(NOW()) GROUP BY Date(c.diagnosedDate);")
	List<IntervalReportDTO> retrieveWeeklyPredictionsReport();

	/*@Query("SELECT new  com.discoveri.heartihealth.dto.IntervalReportYearlyDTO(YEAR(c.date),  "
			+ "sum(c.cardioarrestdetected), sum(d.isrecovered)) "
			+ "from com.discoveri.heartihealth.entities.Memberinfo m inner join com.discoveri.heartihealth.entities.Cardiodiagnosi c "
			+ "on m.memberId = c.memberinfoMemberId inner join com.discoveri.heartihealth.entities.Diseasedetail d "
			+ "on c.cardioId = d.cardiodiagnosisCardioId "
			+ "WHERE c.date > '2019-01-22 07:32:25' GROUP BY year(c.date)")
	List<IntervalReportYearlyDTO> retrieveYearlyPredictionsReport();*/

}
//@AutoWired
// private HeartiReportRepository heartiReportRepository