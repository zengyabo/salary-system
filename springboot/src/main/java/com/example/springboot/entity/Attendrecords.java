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
@ApiModel(value = "Attendrecords对象", description = "")
public class Attendrecords implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("员工ID")
    private Integer employeeId;

    @ApiModelProperty("员工")
    private String employee;

    @ApiModelProperty("出勤日期")
    private String attendanceDate;

    @ApiModelProperty("上班时间")
    private String startTime;

    @ApiModelProperty("下班时间")
    private String endTime;

    @ApiModelProperty("出勤状态")
    private String status;


}
