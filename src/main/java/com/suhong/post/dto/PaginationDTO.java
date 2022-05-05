package com.suhong.post.dto;

import lombok.Data;

@Data
public class PaginationDTO {

  private Integer page, size;
  private Integer start, end;
  private Integer total;
  private boolean prev, next;

  public PaginationDTO(SearchParamDTO searchParam, Integer total) {
    page = searchParam.getPage();
    size = searchParam.getSize();
    this.total = total;
    start = ((page - 1) / 10) * 10 + 1;
    int tempEnd = start + 9;
    int totalEnd = (total - 1) / 10 + 1;
    end = Math.min(totalEnd, tempEnd);
    prev = start != 1;
    next = totalEnd > end;
  }

}
