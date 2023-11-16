package com.sportylight.domain;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GatherVO {
    private int gatheringId;
    private int membersId;
    private String title;
    
    private Date dateTime;
    private String description;
    private int headCount;
    private String address;
    private EnumVO type;
}