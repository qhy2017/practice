package com.qhy.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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

	@Transactional
	@Override
	public int saveObject() {
		Student student = new Student();
		student.setAge(12);
		student.setUsername("quhongyuan");
		int insertSelective = studentMapper.insertSelective(student);
		return insertSelective;
	}

}
