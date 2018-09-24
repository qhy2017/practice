package com.qhy.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qhy.demo.pojo.Student;
import com.qhy.demo.service.StudentService;

@Controller
public class DemoController {
	@Autowired
	private StudentService studentService;

	@ResponseBody
	@RequestMapping(value = "/getHello")
	public Object getHello() {
		PageHelper.startPage(0, 10);
		List<Student> listStudent = studentService.listStudent();
		PageInfo<Student> pageInfo = new PageInfo<Student>(listStudent);
		JSONObject json = new JSONObject();
		json.put("message", "message,中国你好");
		json.put("data", pageInfo);
		return json;
	}

}
