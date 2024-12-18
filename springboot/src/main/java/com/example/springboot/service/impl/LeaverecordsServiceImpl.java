package com.example.springboot.service.impl;

import com.example.springboot.entity.Leaverecords;
import com.example.springboot.mapper.LeaverecordsMapper;
import com.example.springboot.service.ILeaverecordsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class LeaverecordsServiceImpl extends ServiceImpl<LeaverecordsMapper, Leaverecords> implements ILeaverecordsService {

}
