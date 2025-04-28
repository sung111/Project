package project.service.Maintitle_service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dao.Maintitle.dao.Maintitle_DAO;
import project.dto.Products_DTO;
import project.dto.maintitle_DTO;

@Repository
public class Maintitle_serviceimpl implements Maintitle_service {
	

	@Autowired 
	Maintitle_DAO dao;

	@Override
	public List<maintitle_DTO> titleAnnouncement() {
		List<maintitle_DTO> list = null;
		try {
			list = dao.titleAnnouncement();
			System.out.println("titleAnnouncement 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<maintitle_DTO> titleGeneralBulletinBoard() {
		List<maintitle_DTO> list = null;
		try {
			list = dao.titleGeneralBulletinBoard();
			System.out.println("titleGeneralBulletinBoard 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<maintitle_DTO> titleFinishedProduct() {
		List<maintitle_DTO> list = null;
		try {
			list = dao.titleFinishedProduct();
			System.out.println("titleFinishedProduct 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<maintitle_DTO> titleQualityControl() {
		List<maintitle_DTO> list = null;
		try {
			list = dao.titleQualityControl();
			System.out.println("titleQualityControl 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}



	
	
	

	



}
