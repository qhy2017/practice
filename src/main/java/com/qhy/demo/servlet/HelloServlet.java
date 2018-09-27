package com.qhy.demo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	private static final long serialVersionUID = -5198355103851479739L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// resp.setHeader("Content-type", "application/json;charset=UTF-8");// 返回json
		resp.setHeader("Content-type", "text/html;charset=UTF-8");// 返回网页
		PrintWriter writer = resp.getWriter();
		writer.write("<h1 style='color: red'>hello world,打开世界的大门</h1></br>"
				+ "<img style='width:200px;height=200px' src='https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537767283793&di=a6974f0572625b5d9f8e307b3e98abf4&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201306%2F17%2F20130617152751_zKc8Q.jpeg' />");
		writer.flush();
		writer.close();
	}

}
