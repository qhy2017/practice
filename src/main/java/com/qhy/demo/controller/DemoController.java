package com.qhy.demo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qhy.demo.pojo.Student;
import com.qhy.demo.service.StudentService;

@Controller
public class DemoController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private ProcessEngine processEngine;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	RepositoryService repositoryService;

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

	@ResponseBody
	@RequestMapping("/initActiviti")
	public String initActiviDb() {
		JSONObject json = new JSONObject();
		try {
			ProcessEngineConfiguration conf = ProcessEngineConfiguration.createStandaloneProcessEngineConfiguration();
			// 设置数据源信息
			conf.setJdbcDriver("com.mysql.jdbc.Driver");
			conf.setJdbcUrl("jdbc:mysql://localhost:3306/ssm");
			conf.setJdbcUsername("root");
			conf.setJdbcPassword("root");
			// 设置自动建表
			conf.setDatabaseSchemaUpdate("true");
			// 创建一个流程引擎对象，在创建流程引擎对象过程中会自动建表
			ProcessEngine processEngine = conf.buildProcessEngine();
			json.put("message", "success");
			json.put("code", "1");
			return json.toJSONString();
		} catch (Exception e) {
			json.put("message", "fail");
			json.put("code", "0");
			return json.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/getBpmnList")
	public Object getBpmnList() {
		List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().list();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		for (ProcessDefinition item : list) {
			jsonObject = new JSONObject();
			jsonObject.put("Category", item.getCategory());
			jsonObject.put("DeploymentId", item.getDeploymentId());
			jsonObject.put("Description", item.getDescription());
			jsonObject.put("DiagramResourceName", item.getDiagramResourceName());
			jsonObject.put("EngineVersion", item.getVersion());
			jsonObject.put("id", item.getId());
			jsonObject.put("Key", item.getKey());
			jsonObject.put("name", item.getName());
			jsonObject.put("TenantId", item.getTenantId());
			jsonObject.put("version", item.getVersion());
			jsonObject.put("Suspended", item.isSuspended());
			jsonObject.put("GraphicalNotation", item.hasGraphicalNotation());
			jsonObject.put("StartFormKey", item.hasStartFormKey());
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
}
