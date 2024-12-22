<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<style>



/* boardView (view.skin) */
#boardView{}
#boardView .inner_wrap{width: 100%; max-width: 1024px; margin: 0 auto; box-sizing: border-box; font-size: 0; word-break: keep-all;}

#boardView .view_info{padding: 40px 30px; box-sizing: border-box; border-top: 2px solid #333; border-bottom: 1px dashed #333; margin-bottom: 40px;}
#boardView .view_info .tit{font-size: 32px; font-weight: bold; margin-bottom:30px; }
#boardView .view_info .txt{display: flex; justify-content: space-between; align-items: flex-start}
#boardView .view_info .txt .txt_l{}
#boardView .view_info .txt .txt_l ul{display: flex;}
#boardView .view_info .txt .txt_l ul li{font-size: 18px; color: #666; font-weight: 500; margin: 0 47px 0 0;position: relative;}
#boardView .view_info .txt .txt_l ul li:last-child{margin:0; }


#boardView .view_info .txt .txt_l ul li b {font-weight:600;padding:0 5px 0 0;color:#333}



#boardView .view_info .txt .txt_r{}
#boardView .view_info .txt .txt_r ul{display: flex;}
#boardView .view_info .txt .txt_r ul li{margin: 0 10px 0 0;}
#boardView .view_info .txt .txt_r ul li a{font-size: 18px; color: #fff; background: #ffda0d; padding: 9.5px 20px; box-sizing: border-box; border-radius: 30px;font-weight:bold;}
#boardView .view_info .txt .txt_r ul li:nth-child(1) a{color:#513511;}
#boardView .view_info .txt .txt_r ul li:nth-child(2) a{background: #f55f4b;}
#boardView .view_info .txt .txt_r ul li:nth-child(3) a{background: #3983e4;}

#boardView .view_info .txt .txt_r ul li a::before{content: ''; background: url(../img/view_info_icon.png) 0 0 no-repeat; width: 15px; height: 16px; display: inline-block; vertical-align: middle; margin: 0 5px 4px 0;}
#boardView .view_info .txt .txt_r ul li:nth-child(2) a::before{background-position: -15px 0;}
#boardView .view_info .txt .txt_r ul li:nth-child(3) a::before{background-position: -30px 0;}


#boardView .view_content{font-size: 18px;line-height: 26px;padding-bottom: 70px; box-sizing: border-box; border-bottom: 2px solid #333;}
#boardView .view_content .down_btn{text-align: center; margin-bottom: 40px;}
#boardView .view_content .down_btn a{display: inline-block; background: #434343; color: #fff; font-size: 18px; font-weight: 600; padding: 20px 40px; box-sizing: border-box; border-radius: 10px;}
#boardView .view_content img{display: block; margin: 0 auto 30px;max-width:100%; border-radius:5px;} 

#boardView .view_btn{padding: 40px 0; box-sizing: border-box; display: flex; justify-content: center; width: 100%;}
#boardView .view_btn li{width: 100%; max-width: 190px; height: 64px; line-height: 64px; margin: 0 10px 0 0;}
#boardView .view_btn li:last-child{margin: 0;}
#boardView .view_btn li a{font-size: 18px; font-weight: 500; border: 1px solid #ccc; border-radius: 10px; display: block;   text-align: center}
#boardView .view_btn li:nth-child(1) a{color: #fff; background: #434343}

#boardView .comment_wrap{width: 100%;}
#boardView .comment_wrap .comment_w{margin-bottom: 30px;}
#boardView .comment_wrap .comment_w .w_cmnt{background: #f5f5f5; width: 100%; border-radius: 10px; border: none; min-height: 130px; padding:30px; box-sizing: border-box; font-size: 18px; line-height: 26px; color: #888; font-family: 'pretendard'; margin-bottom: 10px;}
#boardView .comment_wrap .comment_w .cmnt_btn{background: #454545; color: #fff; width: 92px; height: 36px; font-size: 16px; border-radius: 5px; display: block; margin-left: auto; font-weight: 500;}

#boardView .comment_wrap .comment_v{width: 100%}
#boardView .comment_wrap .comment_v .item{display: flex; padding: 30px 0; box-sizing: border-box; border-bottom: 1px dashed #ccc; position: relative;}
#boardView .comment_wrap .comment_v_l{width: calc(100% - 240px - 30px); margin-right: 30px;}
#boardView .comment_wrap .comment_v_l p.writer{font-size: 18px;font-weight: 600; position: relative; margin-bottom: 20px;padding-left: 55px; }
#boardView .comment_wrap .comment_v_l p.writer::before{content: ''; background: url(../img/writer_icon.png)0 0 no-repeat; width: 45px; height: 45px; position: absolute; top:-2px; left: 0px;}
#boardView .comment_wrap .comment_v_l p.writer span.date{color: #666;display: block; font-size: 16px; }
#boardView .comment_wrap .comment_v_l .cmnt{font-size: 16px; line-height: 26px; color: #666; padding-left: 55px;}

#boardView .comment_wrap .comment_v_r{width: 100%; max-width: 240px; display: flex; flex-direction: column; justify-content: space-between;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_t{width: 100%;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_t .btn_icon{background: url(../img/cmnt_btn_t_icon.png)0 0 no-repeat; width: 20px; height: 20px; display: block; margin: 10px 0; margin-left: auto; cursor: pointer; position: relative; }
#boardView .comment_wrap .comment_v_r .cmnt_btn_t ul{width: 92px; position: absolute; top: 100%; right: 0; box-shadow: 0 0 10px rgba(0,0,0,.15); border-radius: 5px; padding: 12px 0; box-sizing: border-box; background: #fff; display: none; z-index: 10}
#boardView .comment_wrap .comment_v_r .cmnt_btn_t ul li{}
#boardView .comment_wrap .comment_v_r .cmnt_btn_t ul li a{display: block; font-size: 16px; color: #999; text-align: center; padding: 8px 0; font-weight: 500;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_t ul li a:hover{font-weight: bold;}

#boardView .comment_wrap .comment_v_r .cmnt_btn_b{width: 100%;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul{width: 100%; display: flex; justify-content: flex-end;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul li{margin: 0 10px 0 0;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul li a{font-size: 18px; font-weight: 500; color: #f55f4b; border: 1px solid #f55f4b; padding: 8px 20px; box-sizing: border-box; border-radius: 30px;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul li:last-child a{color: #3983e4; border-color: #3983e4; }


#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul li a::before{content: ''; background: url(../img/cmnt_btn_b_icon.png)0 0 no-repeat; width:16px; height: 15px; display: inline-block; margin: 0 5px 0 0 ;}
#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul li:last-child a::before{background-position: -16px 0;}


@media all and (max-width:1200px){
	#boardView .inner_wrap{width: 98%;}
}

@media all and (max-width:1000px){
	#boardView .view_info .tit{text-align: center;}
	#boardView .view_info .txt{flex-direction: column;align-items: center;}	
	#boardView .view_info .txt .txt_l{margin-bottom: 30px;}
	#boardView .view_info .txt .txt_r ul{width: 100%;}
	#boardView .view_info .txt .txt_r ul li a{font-size: 15px; padding: 8px 18px;}
}


@media all and (max-width:768px){
	#boardView .view_info{padding: 40px 15px;}
	#boardView .view_info .tit{font-size: 28px; text-align: center; margin-bottom:20px }
	#boardView .view_info .txt{flex-direction: column;align-items: center;}
	#boardView .view_info .txt .txt_l ul li{font-size: 16px;}
	#boardView .view_info .txt .txt_r ul{width: 100%;}
	#boardView .view_info .txt .txt_r ul li a{font-size: 15px; padding: 8px 18px;}
	
	#boardView .view_content{font-size: 16px;}
	#boardView .view_content .down_btn a{font-size: 16px;}
	
	#boardView .view_btn li a{font-size: 16px;}
	
	#boardView .comment_wrap .comment_w .w_cmnt{font-size: 16px;}
	#boardView .comment_wrap .comment_w .cmnt_btn{font-size: 14px;}
	
	#boardView .comment_wrap .comment_v_l p.writer{font-size: 16px;}
	#boardView .comment_wrap .comment_v_l .cmnt{font-size: 15px; line-height: 24px}
	#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul li a{font-size: 15px;}
	
	#boardView .comment_wrap .comment_v_r .cmnt_btn_t ul li a
	{font-size: 14px;}
	
}

@media all and (max-width:640px){
	
	#boardView .view_info .txt .txt_l ul{flex-direction: column; align-items: center;}
	#boardView .view_info .txt .txt_l ul li{margin: 0 0 7px 0;}
	#boardView .view_info .txt .txt_l ul li::after{display: none;}
	
	#boardView .comment_wrap .comment_v .item{flex-direction: column; width: 100%;  }
	#boardView .comment_wrap .comment_v_l{width: 100%; margin: 0; }
	#boardView .comment_wrap .comment_v_l .cmnt{margin-bottom: 20px;}
	#boardView .comment_wrap .comment_v_r{max-width: none;}
	#boardView .comment_wrap .comment_v_r .cmnt_btn_b ul{}
	#boardView .comment_wrap .comment_v_r .cmnt_btn_t .btn_icon{position: absolute; top:10px; right: 0}
}


@media all and (max-width:450px){
		
	#boardView .view_btn li{height: 50px; line-height: 50px;}
	
	#boardView .comment_wrap .comment_v_l p.writer::before{width: 30px; height: 30px; background-size: cover; }
	#boardView .comment_wrap .comment_v_l p.writer{padding-left: 38px; margin-bottom: 10px;}
	#boardView .comment_wrap .comment_v_l .cmnt{padding-left: 38px;}
}






#boardView .attachment {padding:25px;background:#ecf1f5;border-radius:5px;}
#boardView .attachment p.a_tit {font-weight:bold;font-size:18px;}

#boardView .attachment ul.a_list li {padding:5px;}
#boardView .attachment ul.a_list li a {font-size:16px;}





#content .con_inner {width:100%;max-width:1400px;margin:0 auto}



@media all and (max-width:1400px){

#content .con_inner {width:98%}


}


ul li {list-style:none}


</style>








<%




Class.forName("com.mysql.cj.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/post";
String DB_ID = "root";
String DB_PW = "901217";
Connection conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);


String bo_id = request.getParameter("bo_id");

String sql = "select * from board where bo_id=?";
PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, bo_id);

ResultSet rs = pstmt.executeQuery();




%>



<% while(rs.next()) {  %>

<div id="boardView">
		<div class="inner_wrap">
			<div class="view_info">
				<p class="tit">타이틀</p>
				<div class="txt">
					<div class="txt_l">
						<ul>
						<li><b>작성일</b> <%=rs.getString("bo_datetime") %></li>
						<li><b>작성자</b> <%=rs.getString("bo_writer") %></li>
						</ul>
					</div>
 					<div class="txt_r">
					</div>
				</div>
			</div>
			<!--//view_info-->

			<div class="view_content">

			<div id="EditorViewer">

			<%=rs.getString("bo_content") %>
						
			</div>		



			




			</div>
			<!--//view_content-->

			<ul class="view_btn">
			
				<li><a href="post_modify.jsp?bo_id=<%=rs.getString("bo_id") %>">수정</a></li>
				<li><a href="post_list.jsp">목록으로</a></li>
							</ul>
			<!--//view_btn-->

		
		</div>
		<!--//inner_wrap-->
	</div>
	
	<% } //end-while %>
	
	
</body>
</html>