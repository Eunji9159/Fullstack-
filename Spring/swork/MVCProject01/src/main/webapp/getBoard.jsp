<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page import="com.springbook.biz.board.impl.BoardDAO"%>
<%@ page import="com.springbook.biz.board.BoardVO"%>

<%
 // 1. 검색할 게시글 번호 추출
 String seq = request.getParameter("seq");
 
// 2. DB 연동 처리
BoardVO vo = new BoardVO();
vo.setSeq(Integer.parseInt(seq));

BoardDAO boardDAO = new BoardDAO();
BoardVO board = boardDAO.getBoard(vo);

// 3. 응답 화면 구성
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
.listtable{width:60%; margin:0 auto; border:1px solid black; border-collapse:collapse;}
tr,td,th{border:1px solid black;}
p{text-align:center;}
a{text-align:center;}
h1{text-align:center;}
.ipst{width:100%;}
</style>
</head>
<body>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>글 상세</h1>     
	<p><a href="logout_proc.jsp">Log-out</a></p>
  </div>
</div>


<form action="updateBoard_proc.jsp" method="post">
<input name="seq" type="hidden" value="<%=board.getSeq()%>">
<table class="listtable">
	<tr>
		<td>제목</td>
		<td><input class="ipst" name="title" type="text" value="<%= board.getTitle() %>"></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=board.getWriter() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea class="ipst" name="content" cols="50" rows="10"><%=board.getContent() %></textarea></td>
	</tr>	
	<tr>
		<td>등록일</td>
		<td><%=board.getRegDate() %></td>
	</tr>	
	<tr>
		<td>조회수</td>
		<td><%=board.getCnt() %></td>
	</tr>	
</table><br>
<p><input type="submit" class="btn btn-info" value="글 수정"></p>
</form>
<p><a href="insertBoard.jsp" style="padding:0 20px;">글등록</a>&nbsp;|
<a href="deleteBoard_proc.jsp?seq=<%=board.getSeq() %>" style="padding:0 20px;">글삭제</a>&nbsp;|
<a href="getBoardList.jsp" style="padding:0 20px;">글목록</a></p>
</body>
</html>