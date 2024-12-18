package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
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
@ApiModel(value = "Leaverecords对象", description = "")
public class Leaverecords implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("请假ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("请假人姓名")
    private String name;

    @ApiModelProperty("请假理由")
    private String content;

    @ApiModelProperty("创建时间")
    private String createTime;

    @ApiModelProperty("请假起始日期")
    private String startDate;

    @ApiModelProperty("请假结束日期")
    private String endDate;

    @ApiModelProperty("详情图片")
    private String img;

    @ApiModelProperty("待审核，审核通过，审核不通过")
    private String state;


}
