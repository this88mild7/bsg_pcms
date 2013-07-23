package com.bsg.pcms.excel.view;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractJExcelView;


/**
 * 브라우저 에서 Excel파일로 다운로드 받을 수 있게 해주는 뷰 클래스 이다.
 */
@Service
public class ExcelView extends AbstractJExcelView {

	Logger log = Logger.getLogger(getClass());
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model, WritableWorkbook myWorkbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		try {
			log.info("<statistic> EXCEL file making start!");
			String fileName = createFileName();
			setFileNameToResponse(request, response, fileName);

			WritableSheet mySheet = myWorkbook.createSheet("statistic", 0); 

			WritableCellFormat subtitleFormat = new WritableCellFormat(); 
																			
			subtitleFormat.setAlignment(Alignment.CENTRE); 
			subtitleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			subtitleFormat.setBackground(Colour.GREY_25_PERCENT);
			subtitleFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
																		
			WritableCellFormat stFormat = new WritableCellFormat(); 
			stFormat.setAlignment(Alignment.CENTRE); 
			stFormat.setVerticalAlignment(VerticalAlignment.CENTRE); 
																		

			WritableCellFormat count = new WritableCellFormat(); 
			count.setAlignment(Alignment.RIGHT); // 셀 가운데 정렬
			count.setVerticalAlignment(VerticalAlignment.CENTRE); // 셀 수직 가운데 정렬
			// nameFormat.setBorder(Border.BOTTOM, BorderLineStyle.HAIR); // 보더와
			// 보더라인스타일 설정
			// nameFormat.setBackground(Colour.GOLD); // 여름에 맞는 색깔 두번째 ? ^^

			// setCloumnView(몇번째 컬럼, 넓이)
			mySheet.setColumnView(0, 30);
			mySheet.setColumnView(1, 20);
			mySheet.setColumnView(2, 20);
			mySheet.setColumnView(3, 20);

			Label durationLabel = new Label(0, 0, "duration", subtitleFormat);
			mySheet.addCell(durationLabel);

			Label totalCountLabel = new Label(1, 0, "totalCount", subtitleFormat); 
			mySheet.addCell(totalCountLabel); 

			Label successCountLabel = new Label(2, 0, "successCount", subtitleFormat); 
			mySheet.addCell(successCountLabel); 

			Label failCountLabel = new Label(3, 0, "failCount", subtitleFormat); 
			mySheet.addCell(failCountLabel); 

			HashMap<String, Object> map = (HashMap<String, Object>) model.get("map");

			log.info("<statistic> EXCEL file making finished!");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

	private void setFileNameToResponse(HttpServletRequest request, HttpServletResponse response, String fileName) {
		String userAgent = request.getHeader("User-Agent");
		if (userAgent.indexOf("MSIE 5.5") >= 0) {
			response.setContentType("doesn/matter");
			response.setHeader("Content-Disposition", "filename=\"" + fileName + "\"");
		} else {
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		}
	}

	private String createFileName() {
		SimpleDateFormat fileFormat = new SimpleDateFormat("ddMMyyyy");
		return new StringBuilder("statistic").append("_").append(fileFormat.format(new Date())).append(".xls").toString();
	}

}
