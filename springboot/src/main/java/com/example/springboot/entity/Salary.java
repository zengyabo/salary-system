package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 
 */
@Getter
@Setter
@ApiModel(value = "Salary对象", description = "")
public class Salary implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("员工ID")
    private Integer employeeId;

    @ApiModelProperty("员工姓名")
    private String employee;

    @ApiModelProperty("工资日期")
    private String salaryDate;

    @ApiModelProperty("基本工资")
    private Integer basicSalary;

    @ApiModelProperty("其他收入")
    private Integer bonus;

    @ApiModelProperty("扣款")
    private Integer deduction;

    @ApiModelProperty("总工资")
    private Integer totalSalary;


}
