<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.springbook.biz.user.UserVO" %>
<%@ page import="com.springbook.biz.user.impl.UserDAO" %>

<% 
    // 1. 사용자 입력 정보 추출
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    // 2. DB 연동 처리
    UserVO vo = new UserVO();
    vo.setId(id);
    vo.setPassword(password);
    
    UserDAO userDAO = new UserDAO();
    UserVO user = userDAO.getUser(vo);
    
    // 3. 화면 네비게이션
    if(user !=null) {
    	session.setAttribute("userId",user.getId());
    	session.setAttribute("userName",user.getName());
    	response.sendRedirect("getBoardList.jsp");
    }else {
    	response.sendRedirect("login.jsp");
    }
    
    %>