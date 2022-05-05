package com.suhong.post.service;

import com.suhong.post.dto.ListResultDTO;
import com.suhong.post.dto.PostDTO;
import com.suhong.post.dto.SearchParamDTO;

import java.util.List;

public interface PostService {
  ListResultDTO<PostDTO> getPosts(SearchParamDTO searchParamDTO);

}
