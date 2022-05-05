package com.suhong.post.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PostDTO {

  private Integer pno;
  private String title;
  private String content;
  private String writer;
  private LocalDateTime regDate;
  private LocalDateTime updateDate;

}
