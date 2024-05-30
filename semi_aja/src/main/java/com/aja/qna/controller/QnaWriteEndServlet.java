package com.aja.qna.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.qna.model.dto.Qna;
import com.aja.qna.service.QnaService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class QnaWriteEndServlet
 */
@WebServlet("/qna/qnawriteend.do")
public class QnaWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//파일 업로드 경로 가져오기
		String path=getServletContext().getRealPath("/upload/qna");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		
		//인코딩
		String encode="UTF-8";
		//파일크기
		int maxSize=1024*1024*10;
		//리네임
		DefaultFileRenamePolicy dfrp=new DefaultFileRenamePolicy();
		
		MultipartRequest mr=new MultipartRequest(
				request,path,maxSize,encode,dfrp);
		
		//나머지 정보들 가져오기
		String title=mr.getParameter("title");
		String content=mr.getParameter("content");
		
		//업로드된 파일 정보
		//원본파일명
		String oriname=mr.getOriginalFileName("upfile");
		//리네임 파일명
		String rename=mr.getFilesystemName("upfile");
		
		System.out.println(title+content+oriname+rename);
		
		Qna q=Qna.builder()
				.qnaTitle(title)
				.qnaContent(content)
				.filePath(rename)
				.build();
		
		int result=new QnaService().insertQna(q);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
