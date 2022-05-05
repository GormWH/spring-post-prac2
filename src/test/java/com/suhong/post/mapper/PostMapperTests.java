package com.suhong.post.mapper;

import com.suhong.post.domain.PostVO;
import com.suhong.post.dto.SearchParamDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
@ExtendWith(SpringExtension.class)
public class PostMapperTests {

  @Autowired(required = false)
  private PostMapper postMapper;

  @Test
  public void testSelectBoardList() {
    SearchParamDTO searchParamDTO = new SearchParamDTO();
    searchParamDTO.setPage(2);
    searchParamDTO.setSize(15);
    searchParamDTO.setKeyword("30");
    searchParamDTO.setType("t");

    List<PostVO> postVOList = postMapper.selectBoardList(searchParamDTO);
    postVOList.forEach(postVO -> System.out.println(postVO));
  }

}
