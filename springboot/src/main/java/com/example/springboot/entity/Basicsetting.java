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
@ApiModel(value = "Basicsetting对象", description = "")
public class Basicsetting implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("员工ID")
    private Integer employeeId;

    @ApiModelProperty("员工姓名")
    private String employee;

    @ApiModelProperty("基本岗位工资")
    private Integer positionFee;

    @ApiModelProperty("基本薪级工资")
    private Integer scaleFee;

    @ApiModelProperty("基本津贴")
    private Integer basicBonus;

    @ApiModelProperty("养老保险")
    private Integer pensionInsurance;

    @ApiModelProperty("失业保险")
    private Integer unemploymentInsurance;

    @ApiModelProperty("公积金")
    private Integer providentFund;

    @ApiModelProperty("基本工资日期")
    private String basicDate;
}
