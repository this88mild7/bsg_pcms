package com.bsg.pcms.sale.company;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyContractService;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.view.PmsView;

@Controller
@RequestMapping( value = "saleCompany/contract" )
public class CompanyContractController {

	private Logger _logger = LoggerFactory.getLogger(CompanyContractController.class);
	
	@Autowired
	BigstarConstant _bigstarConstant; 
	
	@Autowired
	CompanyService _saleCompanyService; 
	
	@Autowired
	CompanyContractService _saleContractService;
	
	
	@Autowired
	PmsView _pmsView;
	
	@RequestMapping( value = "list.do", method = RequestMethod.GET )
	public ModelAndView list() {
		List<CompanyContractDTOEx> saleCompanyContractList = _saleContractService.list();
		return _pmsView.getSaleCompanyContractListView(saleCompanyContractList);
	}
	
	@RequestMapping( value = "search.do", method = RequestMethod.GET )
	public ModelAndView search(CompanyContractDTOEx companyDTO) {
		_logger.info(companyDTO.getSearchQuery());
		if(StringUtils.isBlank(companyDTO.getSearchQuery())){
			companyDTO.setSearchType(null);
		}
		List<CompanyContractDTOEx> saleCompanyContractList = _saleContractService.search(companyDTO);
		return _pmsView.getSaleCompanyContractListView(saleCompanyContractList);
	}
	
	
	@RequestMapping( value = "createView.do", method = RequestMethod.GET )
	public ModelAndView contractView() {
		List<CompanyDTOEx> saleCompanyList = _saleCompanyService.list();
		List<String> deviceList = _saleContractService.deviceList();
		List<CompanyContractDTOEx> contractTypeList = _saleContractService.saleTypeList();
		return _pmsView.getSaleCompanyCreateContractView(saleCompanyList, deviceList, contractTypeList);
	}
	
	@RequestMapping( value = "detail.do", method = RequestMethod.GET )
	public ModelAndView contractDetail(CompanyContractDTOEx saleCompany, HttpServletRequest request) {
		CompanyContractDTOEx saleContractDetail = _saleContractService.detail(saleCompany);
		List<CompanyContractDTOEx> contractTypeList = _saleContractService.saleTypeList();
		
		request.getSession().setAttribute("selectedContentsList", saleContractDetail.getContentsList());
		
		return _pmsView.getSaleCompanyContractDetailView(saleContractDetail, contractTypeList);
	}
	
	@RequestMapping( value = "create.do", method = RequestMethod.POST )
	public String create(CompanyContractDTOEx companyDTO, HttpServletRequest request) {
		
		List<String> sessionContentsList = getSessionContentList(request);
		
		_saleContractService.create(companyDTO, sessionContentsList);
		
		return "redirect:/saleCompany/contract/list.do";
	}


	@RequestMapping( value = "delete.do", method = RequestMethod.POST )
	public String delete(@RequestParam(value="contract_mgmtno", required=true)
			List<String> deleteContractList, HttpServletRequest request) {
		
		_saleContractService.delete(deleteContractList);
		
		return "redirect:/saleCompany/contract/list.do";
	}
	
	@RequestMapping( value = "modify.do", method = RequestMethod.POST )
	public String modify(CompanyContractDTOEx companyDTO, HttpServletRequest request){
		List<String> sessionContentsStringList = getSessionContentList(request);
		_logger.info("{}", companyDTO.getContract_type());
		if(sessionContentsStringList.size() > 0){
			_logger.info("{}", sessionContentsStringList);
			_saleContractService.modify(companyDTO, sessionContentsStringList);
		}else{
			List<CompanyContentsDTOEx> sessionContentsList = (List<CompanyContentsDTOEx>)request.getSession().getAttribute("selectedContentsList");
			companyDTO.setContentsList(sessionContentsList);
			_saleContractService.modify(companyDTO);
		}
		
		return "redirect:/saleCompany/contract/list.do";
	}

	private List<String> getSessionContentList(HttpServletRequest request) {
		
		List<String> sessionContentsList = (List<String>)request.getSession().getAttribute("contentsList");
		
		if(sessionContentsList == null){
			sessionContentsList = new ArrayList<String>();
		}
		request.getSession().removeAttribute("contentsList");
		
		return sessionContentsList;
	}
//	
//	
	
	/**
	 * group/createAction.do 먼저 호출 된 후에 아래 메소드가 실행 되야
	 * 패키지 판매 상품을 등록 할 수 있다.
	 * 
	 * @param companyDTO
	 * @return
	 */
	
	

	
	
	/**
	 * @param customer
	 * @return
	 * @throws SQLException
	 */
//	@RequestMapping( value = "createAction.do", method = RequestMethod.POST )
//	public ModelAndView contractSaleCompany(CompanyDTOEx customer) throws SQLException {
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName( "customer-list" );
//		mav.addObject( "leftMenuSeq", _bigstarConstant.getLEFT_CUSTOMER() );
//		mav.addObject( "navSeq", _bigstarConstant.getHEADER_PRODUCT() );
//		
//		//판매형태 그룹작업 JSON -> LIST -> GROUP
//		int group_id = groupService.createGroup(customer);
//		
//		int result = _saleCompanyService.createSaleCompany(customer);
//		
//		List<CompanyDTO> customerList = _saleCompanyService.getSaleCompany(null);
//		mav.addObject( "customerList", customerList );
//		
//		return mav;
//	}
	
	
	
//	@RequestMapping( value = "detail.do", method = RequestMethod.GET )
//	public ModelAndView detail(CompanyDTOEx customer) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName( "customer-detail" );
//		mav.addObject( "leftMenuSeq", bigstarConstant.getLEFT_CUSTOMER() );
//		mav.addObject( "navSeq", bigstarConstant.getHEADER_PRODUCT() );
//		
//		CompanyDTO _customer = saleCompanyService.getCustomerDetail(customer);
//		mav.addObject( "customer", _customer );
//		
//		// 은행 목록
//		List<BankDTO> bankList = bankListMaker.getBankList();
//		mav.addObject( "bankList", bankList);
//		
//		return mav;
//	}
	
//	@RequestMapping( value = "deleteAction.do" )
//	public  ModelAndView deleteAction(CompanyDTOExtend customer) {
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName( "customer-list" );
//		mav.addObject( "leftMenuSeq", bigstarConstant.getLEFT_CUSTOMER() );
//		mav.addObject( "navSeq", bigstarConstant.getHEADER_PRODUCT() );
//		
//		String resultMsg = "판매처 삭제에 성공하였습니다.";
//		int rst = 0;
//		try {
//			rst = saleCompanyService.deleteCustomer(customer);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		if( rst == 0 ) {
//			resultMsg = "판매처 삭제에 실패하였습니다.";
//		}
//		mav.addObject( "resultMsg", resultMsg );
//		
//		List<CompanyDTOExtend> customerList = saleCompanyService.getSaleCompany(null);
//		mav.addObject( "customerList", customerList );
//		
//		return mav;
//		
//	}
	
	
}
