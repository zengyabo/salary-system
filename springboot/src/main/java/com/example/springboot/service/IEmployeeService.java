package com.example.springboot.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.entity.Employee;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface IEmployeeService extends IService<Employee> {
    List<Employee> selectList(QueryWrapper<Employee> queryWrapper);
}
