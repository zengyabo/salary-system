package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Otherincome;
import com.example.springboot.mapper.OtherIncomeMapper;
import com.example.springboot.service.IOtherIncomeService;
import org.springframework.stereotype.Service;

@Service
public class OtherIncomeServiceImpl extends ServiceImpl<OtherIncomeMapper, Otherincome> implements IOtherIncomeService {


}
