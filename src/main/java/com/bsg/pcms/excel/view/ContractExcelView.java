package com.bsg.pcms.excel.view;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import com.bsg.pcms.provision.contract.ContractDTOEx;


/**
 * 브라우저 에서 Excel파일로 다운로드 받을 수 있게 해주는 뷰 클래스 이다.
 */
@Component
public class ContractExcelView extends AbstractJExcelView {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	int CP_COMPANY = 0;
	int SERIES = 1;
	int PERIOD = 2;
	int TYPE = 3;
	int PRICE = 4;
	int RATE = 5;
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model, WritableWorkbook myWorkbook, HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			logger.info("<ContentsExcelView> EXCEL file making start!");
			
			String fileName = createExcelFileName("Contracts");
			setFileNameToResponse(request, response, fileName);


			//부제 셋팅
			WritableCellFormat subtitleFormat = new WritableCellFormat(); 
			subtitleFormat.setAlignment(Alignment.CENTRE); 
			subtitleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			subtitleFormat.setBackground(Colour.GREY_25_PERCENT);
			subtitleFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
				
			//데이터 셋팅
			WritableCellFormat dataFormat = new WritableCellFormat(); 
			//dataFormat.setAlignment(Alignment.RIGHT); 
																		
			WritableSheet sheet = myWorkbook.createSheet("contents", 0); 

			// setCloumnView(몇번째 컬럼, 넓이)
			sheet.setColumnView(CP_COMPANY, 20);
			sheet.setColumnView(SERIES, 30);
			sheet.setColumnView(PERIOD, 40);
			sheet.setColumnView(TYPE, 15);
			sheet.setColumnView(PRICE, 15);
			sheet.setColumnView(RATE, 15);

			sheet.addCell(new Label(CP_COMPANY, 0, "CP업체", subtitleFormat));
			sheet.addCell(new Label(SERIES, 0, "시리즈", subtitleFormat)); 
			sheet.addCell(new Label(PERIOD, 0, "계약기간", subtitleFormat)); 
			sheet.addCell(new Label(TYPE, 0, "계약종류", subtitleFormat)); 
			sheet.addCell(new Label(PRICE, 0, "금액", subtitleFormat)); 
			sheet.addCell(new Label(RATE, 0, "수익률", subtitleFormat)); 

			List<ContractDTOEx> contractList = (List<ContractDTOEx>)model.get("contractList");
			logger.info("size {}", contractList.size());
			int row = 1;
			for(ContractDTOEx cde : contractList) {
				sheet.addCell(new Label(CP_COMPANY, row, cde.getCompany_name(), dataFormat));
				sheet.addCell(new Label(SERIES, row, cde.getSeries_name(), dataFormat)); 
				sheet.addCell(new Label(PERIOD, row, cde.getStr_date().toString() + " ~ " + cde.getEnd_date().toString(), dataFormat)); 
				sheet.addCell(new Label(TYPE, row, cde.getContract_type(), dataFormat)); 
				sheet.addCell(new Label(PRICE, row, "" + cde.getSale_price(), dataFormat)); 
				sheet.addCell(new Label(RATE, row, cde.getSale_profit_rate() + " %", dataFormat)); 
				row ++;
			}

			logger.info("<ContentsExcelView> EXCEL file making finished!");
		} catch (Exception e) {
			e.printStackTrace();
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

	/** 파라미터로 받은 파일이름 뒤에 날짜를 더해 돌려준다. 
	 * 예) Contents_20130724.xls
	 * @param fileName
	 * @return fileName_yyyyMMdd 
	 */
	public String createExcelFileName(String fileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String excelFileName = String.format("%s_%s.xls", fileName, sdf.format(new Date()) );
		return excelFileName;
	}

}
