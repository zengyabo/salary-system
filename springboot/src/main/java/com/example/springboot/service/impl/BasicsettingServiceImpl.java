package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Basicsetting;
import com.example.springboot.mapper.BasicsettingMapper;
import com.example.springboot.service.IBasicsettingService;
import org.springframework.stereotype.Service;

@Service
public class BasicsettingServiceImpl extends ServiceImpl<BasicsettingMapper, Basicsetting> implements IBasicsettingService {
}
