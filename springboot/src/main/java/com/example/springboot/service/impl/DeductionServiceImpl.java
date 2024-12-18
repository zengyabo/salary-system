package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Deduction;
import com.example.springboot.mapper.DeductionMapper;
import com.example.springboot.service.IDeductionService;
import org.springframework.stereotype.Service;

@Service
public class DeductionServiceImpl extends ServiceImpl<DeductionMapper,Deduction> implements IDeductionService{
}
