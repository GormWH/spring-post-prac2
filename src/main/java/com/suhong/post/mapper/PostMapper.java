package com.suhong.post.mapper;

import com.suhong.post.domain.PostVO;
import com.suhong.post.dto.SearchParamDTO;

import java.util.List;

public interface PostMapper {

  List<PostVO> selectPosts(SearchParamDTO searchParamDTO);

  Integer selectPostsCount(SearchParamDTO searchParamDTO);

  void deletePost(Integer pno);
}
