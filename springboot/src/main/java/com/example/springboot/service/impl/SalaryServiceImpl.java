package com.example.springboot.service.impl;

import com.example.springboot.entity.Salary;
import com.example.springboot.mapper.SalaryMapper;
import com.example.springboot.service.ISalaryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class SalaryServiceImpl extends ServiceImpl<SalaryMapper, Salary> implements ISalaryService {

}
