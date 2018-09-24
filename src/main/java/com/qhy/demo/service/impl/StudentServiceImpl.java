package com.qhy.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhy.demo.mapper.StudentMapper;
import com.qhy.demo.pojo.Student;
import com.qhy.demo.pojo.StudentExample;
import com.qhy.demo.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	 @Autowired
	 private StudentMapper studentMapper;

	@Override
	public List<Student> listStudent() {
		 List<Student> result = studentMapper.selectByExample(new StudentExample());
		return result;
	}

}
