package com.kh.mars.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class FollowDto {
 private int followWho;
 private int followTarget;
 private Date followDate;
 private int followConfirm;
 private int followCheck;
}
