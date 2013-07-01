//
// 상단,좌측 메뉴 순서 변경시 주의!
//

package com.bsg.pcms.utility;

import org.springframework.stereotype.Component;

@Component
public class BigstarConstant {

	// 헤더 네비 메뉴
	private final int HEADER_MAIN = 0; 			// 메인
	private final int HEADER_CP = 1;			// CP 업체관리
	private final int HEADER_SALE_COMPANY = 2;	// 판매업체관리
	private final int HEADER_BALANCE = 3;		// 통계
	private final int HEADER_STATS = 4;			// 통계
	private final int HEADER_SITE = 5;			// 사이트 관리( 관리자 계정 로그인시 보임 )
	
	
	// 좌측메뉴 > CP업체관리
	private final int LEFT_CP = 0; 				// CP 업체리스트
	private final int LEFT_CATEGORY = 1;		// 카테고리 관리
	private final int LEFT_CONTENTS = 2;		// 콘텐츠 리스트
	private final int LEFT_CONTRACTS = 3;		// 콘텐츠 계약리스트
	// 좌측메뉴 > 판매업체관리
	private final int LEFT_SALE_COMPANY = 0;			// 판매업체 관리
	private final int LEFT_SALE_COMPANY_CONTRACT = 1;	// 판매상품 관리
	// 좌측메뉴 > 정산관리
	private final int LEFT_BALANCE_SALE = 0;	// 판매관리
	private final int LEFT_BALANCE_CP = 1;		// 업체관리
	// 좌측메뉴 > 통계
	private final int LEFT_STATISTICS_SALE_COMPANY = 0;		// 판매처통계
	private final int LEFT_STATISTICS_PRODUCT = 1;			// 상품통계
	// 좌측메뉴 > 사이트 관리
	private final int LEFT_MEMBER = 0;		// 회원관리
	private final int LEFT_UNKNOWN = 1;		// 메뉴미정
	
	
	public int getLEFT_STATISTICS_SALE_COMPANY() {
		return LEFT_STATISTICS_SALE_COMPANY;
	}
	public int getLEFT_STATISTICS_PRODUCT() {
		return LEFT_STATISTICS_PRODUCT;
	}
	public int getHEADER_BALANCE() {
		return HEADER_BALANCE;
	}
	public int getHEADER_MAIN() {
		return HEADER_MAIN;
	}
	public int getHEADER_CP() {
		return HEADER_CP;
	}
	public int getHEADER_STATS() {
		return HEADER_STATS;
	}
	public int getLEFT_CP() {
		return LEFT_CP;
	}
	public int getLEFT_CATEGORY() {
		return LEFT_CATEGORY;
	}
	public int getLEFT_CONTENTS() {
		return LEFT_CONTENTS;
	}
	public int getLEFT_CONTRACTS() {
		return LEFT_CONTRACTS;
	}
	public int getLEFT_SALE_COMPANY() {
		return LEFT_SALE_COMPANY;
	}
	public int getLEFT_BALANCE_SALE() {
		return LEFT_BALANCE_SALE;
	}
	public int getLEFT_BALANCE_CP() {
		return LEFT_BALANCE_CP;
	}
	public int getLEFT_SALE_COMPANY_CONTRACT() {
		return LEFT_SALE_COMPANY_CONTRACT;
	}
	public int getHEADER_SITE() {
		return HEADER_SITE;
	}
	public int getLEFT_MEMBER() {
		return LEFT_MEMBER;
	}
	public int getLEFT_UNKNOWN() {
		return LEFT_UNKNOWN;
	}
	public int getHEADER_SALE_COMPANY() {
		return HEADER_SALE_COMPANY;
	}
	
	
	
}
