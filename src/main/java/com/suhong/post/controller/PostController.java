package com.suhong.post.controller;


import com.suhong.post.dto.ListResultDTO;
import com.suhong.post.dto.PaginationDTO;
import com.suhong.post.dto.PostDTO;
import com.suhong.post.dto.SearchParamDTO;
import com.suhong.post.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {

  private final PostService postService;

  @GetMapping("")
  public String root() {
    return "/post/root";
  }

  @GetMapping("/list")
  public void list(SearchParamDTO searchParamDTO, Model model) {
    ListResultDTO<PostDTO> posts = postService.getPosts(searchParamDTO);
    PaginationDTO paginationDTO = new PaginationDTO(searchParamDTO, posts.getTotal());
    model.addAttribute("posts", posts);
    model.addAttribute("pagination", paginationDTO);
  }
}
