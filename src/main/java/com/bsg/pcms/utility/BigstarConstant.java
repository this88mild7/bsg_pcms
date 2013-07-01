//
// 상단,좌측 메뉴 순서 변경시 주의!
//

package com.bsg.pcms.utility;

import org.springframework.stereotype.Component;

@Component
public class BigstarConstant {

	// 헤더 네비 메뉴
	public static final int HEADER_MAIN = 0; 		// 메인
	public static final int HEADER_CP = 1;			// CP 업체관리
	public static final int HEADER_SALE_COMPANY = 2;		// 판매업체관리
	public static final int HEADER_BALANCE = 3;		// 통계
	public static final int HEADER_STATS = 4;		// 통계
	public static final int HEADER_SITE = 5;		// 사이트 관리( 관리자 계정 로그인시 보임 )
	
	
	// 좌측메뉴 > CP업체관리
	public static final int LEFT_CP = 0; 			// CP 업체리스트
	public static final int LEFT_CATEGORY = 1;		// 카테고리 관리
	public static final int LEFT_CONTENTS = 2;		// 콘텐츠 리스트
	public static final int LEFT_CONTRACTS = 3;		// 콘텐츠 계약리스트
	// 좌측메뉴 > 판매업체관리
	public static final int LEFT_SALE_COMPANY = 0;		// 판매업체 관리
	public static final int LEFT_SALE_COMPANY_CONTRACT = 1;		// 판매상품 관리
	// 좌측메뉴 > 정산관리
	public static final int LEFT_BALANCE_SALE = 0;		// 판매관리
	public static final int LEFT_BALANCE_CP = 1;		// 업체관리
	// 좌측메뉴 > 사이트 관리
	public static final int LEFT_MEMBER = 0;		// 회원관리
	public static final int LEFT_UNKNOWN = 1;		// 메뉴미정
	
	public static final String OB_LEFT_MENU_SEQ = 						"leftMenuSeq";
	public static final String OB_NAV_SEQ = 								"navSeq";
	public static final String VW_SALE_COMPANY_LIST = 					"sale-company-list";
	public static final String OB_SALE_COMPANY_LIST = 					"salCompanyList";
	public static final String VW_SALE_COMPANY_INFO = 					"sale-company-info";
	public static final String OB_SALE_COMPANY_DETTAIL = 					"saleCompany";
	public static final String OB_SALE_COMPANY_BANK_LIST = 				"bankList";
	
	
	public static final String VW_SALE_COMPANY_CONTRACT_LIST = 			"sale-company-contract-list";
	public static final String OB_SALE_COMPANY_CONTRACT_LIST = 			"saleContractList";
	public static final String OB_SALE_COMPANY_CONTRACTED_DEVICE = 		"contractedDeviceList";
	public static final String OB_CONTRACT_TYPE_LIST = 						"contractTypeList";
	public static final String OB_DEVICE_LIST = 			"deviceList";
	public static final String OB_LICENSE_LIST = 								"licenseList";
	
	public static final String VW_SALE_COMPANY_CONTRACT_INFO = 			"sale-company-contract-info";
	public static final String OB_SALE_COMPANY_CONTRACT_DETAIL = 			"saleContractDetail";
	public static final String OB_SALE_COMPANY_CONTRACT_INSTALLMENT = 	"installment";
	public static final String OB_SALE_COMPANY_CONTRACT_CONTENTS = 		"contentList";
	
	public static final String OB_CONTENT_TYPE_LIST = 					"contentTypeList";
	
	
}
