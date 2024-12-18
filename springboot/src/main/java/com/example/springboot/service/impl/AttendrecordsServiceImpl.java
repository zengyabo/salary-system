package com.example.springboot.service.impl;

import com.example.springboot.entity.Attendrecords;
import com.example.springboot.mapper.AttendrecordsMapper;
import com.example.springboot.service.IAttendrecordsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class AttendrecordsServiceImpl extends ServiceImpl<AttendrecordsMapper, Attendrecords> implements IAttendrecordsService {

}
