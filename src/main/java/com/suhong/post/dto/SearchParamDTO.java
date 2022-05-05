package com.suhong.post.dto;

import lombok.Data;
import lombok.Getter;

@Data
public class SearchParamDTO {

  private Integer page;
  private Integer size;
  private String type;
  private String keyword;

  public SearchParamDTO() {
    page = 1;
    size = 10;
  }

  public int getSkip() {
    return (page - 1) * size;
  }

  public String[] getTypes() {
    return type.split("");
  }

}
