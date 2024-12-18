package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@ApiModel(value = "Deduction对象", description = "")
public class Deduction implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("员工ID")
    private Integer employeeId;

    @ApiModelProperty("员工姓名")
    private String employee;

    @ApiModelProperty("扣款金额")
    private Integer deductionFee;

    @ApiModelProperty("扣款原由")
    private String reason;

    @ApiModelProperty("扣款日期")
    private String deductionDate;
}
