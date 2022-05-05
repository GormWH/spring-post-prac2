package com.suhong.post.dto;

import lombok.Data;

import java.util.List;

@Data
public class ListResultDTO<DTO> {

  List<DTO> list;
  Integer total;

  public ListResultDTO(List<DTO> list, Integer total) {
    this.list = list;
    this.total = total;
  }

}
