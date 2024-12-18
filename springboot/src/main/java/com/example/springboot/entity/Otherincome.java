package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

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
@ApiModel(value = "OtherIncome对象", description = "")
public class Otherincome implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("员工ID")
    private Integer employeeId;

    @ApiModelProperty("员工姓名")
    private String employee;

    @ApiModelProperty("卫生费")
    private Integer healthFee;

    @ApiModelProperty("政府津贴")
    private Integer goverFee;

    @ApiModelProperty("特殊津贴")
    private Integer specialFee;

    @ApiModelProperty("其他收入1")
    private Integer otherIncome1;

    @ApiModelProperty("其他收入2")
    private Integer otherIncome2;

    @ApiModelProperty("绩效")
    private Integer performance;

    @ApiModelProperty("其他收入日期")
    private String incomeDate;
}
