package com.suhong.post.service;

import com.suhong.post.domain.PostVO;
import com.suhong.post.dto.ListResultDTO;
import com.suhong.post.dto.PostDTO;
import com.suhong.post.dto.SearchParamDTO;
import com.suhong.post.mapper.PostMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

  private final PostMapper postMapper;
  private final ModelMapper modelMapper;

  @Override
  public ListResultDTO<PostDTO> getPosts(SearchParamDTO searchParamDTO) {
    List<PostVO> postVOList = postMapper.selectPosts(searchParamDTO);
    List<PostDTO> postDTOList = postVOList.stream()
            .map(postVO -> modelMapper.map(postVO, PostDTO.class))
            .collect(Collectors.toList());
    int postsCount = postMapper.selectPostsCount(searchParamDTO);
    return new ListResultDTO<PostDTO>(postDTOList, postsCount);
  }
}
