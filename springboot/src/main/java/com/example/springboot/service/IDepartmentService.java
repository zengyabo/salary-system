package com.example.springboot.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.entity.Department;
import com.baomidou.mybatisplus.extension.service.IService;


public interface IDepartmentService extends IService<Department> {
   Department selectOne(QueryWrapper<Department> queryWrapper) ;

}
