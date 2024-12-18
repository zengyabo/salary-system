package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
@ApiModel(value = "Employee对象", description = "")
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("员工姓名")
    private String name;

    @ApiModelProperty("所属部门ID")
    private Integer departmentId;

    @ApiModelProperty("所属部门")
//    @TableField(exist = false)
    private String departmenter;

    @ApiModelProperty("职位")
    private String position;

    @ApiModelProperty("入职日期")
    private LocalDate hireDate;


    @ApiModelProperty("电子邮件")
    private String email;

    @ApiModelProperty("电话号码")
    private String phoneNumber;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("创建时间")
    private String createdAt;

    @ApiModelProperty("更新时间")
    private String updatedAt;


}
