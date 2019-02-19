package com.inc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inc.domain.Board;
import com.inc.domain.Reply;
import com.inc.domain.User;
import com.inc.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService boardService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/board/notice/list", method=RequestMethod.GET)
	public String noticeGet(@RequestParam(defaultValue="1") int page, Model model) {
		model.addAttribute("pageHTML", boardService.getPaging(page));
		model.addAttribute("boardList", boardService.getBoardList(page));
		session.setAttribute("page", page);
		return "/board/notice/list";
	}
	
	@RequestMapping(value="/board/notice/insert", method=RequestMethod.GET)
	public String noticeAdd(Model model) {
		model.addAttribute("board", new Board());
		return "/board/notice/insert";
	}
	
	@RequestMapping(value="/board/notice/insert", method=RequestMethod.POST)
	public String noticeAddPost(@ModelAttribute @Valid  Board board,
								BindingResult result,
								@AuthenticationPrincipal User user) {
		if(result.hasErrors()) {
			return "/board/notice/insert";
		}
		board.setUsers_id(user.getId());
		board.setIp(request.getRemoteAddr());
		boardService.add(board);
		return "redirect:/board/notice/list";
	}
	
	@RequestMapping(value="/board/notice/view", method=RequestMethod.GET)
	public String view(@RequestParam int id, Model model) {
		boardService.hitUp(id);
		model.addAttribute("board", boardService.getBoard(id));
		return "/board/notice/view";
	}
	
	@RequestMapping(value="/board/notice/delete", method=RequestMethod.GET)
	public String delete(@RequestParam int id,
						 Model model,
						 @AuthenticationPrincipal User user) {
		Board board = boardService.getBoard(id);
		if(user.getId().equals(board.getUsers_id()) || "admin".equals(user.getId())) {
			boardService.deleteBoard(id);
			model.addAttribute("msg", "게시물이 삭제되었습니다.");
			model.addAttribute("url", "/board/notice/list");
		} else{
			model.addAttribute("msg", "잘못된 요청입니다.");
			model.addAttribute("url", "/board/view?id="+board.getId());
		}
		return "/common/result";
	}
	
	@RequestMapping(value="/board/notice/update", method=RequestMethod.GET)
	public String update(@RequestParam int id,
						 Model model,
						 @AuthenticationPrincipal User user) {
		Board board = boardService.getBoard(id);
		if(user.getId().equals(board.getUsers_id()) || "admin".equals(user.getId())) {
			model.addAttribute("board", board);
			return "/board/notice/update";
		} else{
			model.addAttribute("msg", "잘못된 요청입니다.");
			model.addAttribute("url", "/board/notice/view?id="+board.getId());
			return "/common/result";
		}
	}
	
	@RequestMapping(value="/board/notice/update", method=RequestMethod.POST)
	public String updatePost(@ModelAttribute @Valid Board board, 
							 BindingResult result,
							 Model model,
							 @AuthenticationPrincipal User user) {
		Board existboard = boardService.getBoard(board.getId());
		if(user.getId().equals(existboard.getUsers_id())) {
			if(result.hasErrors()) {
				return "/board/notice/update";
			}
			boardService.updateBoard(board);
			return "redirect:/board/view?id="+board.getId();
		} else{
			model.addAttribute("msg", "잘못된 요청입니다.");
			model.addAttribute("url", "/board/notice/view?id="+board.getId());
			return "/common/result";
		}
	}
	
	@RequestMapping(value="/reply/notice/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute Reply reply, @AuthenticationPrincipal User user) {
		reply.setUsers_id(user.getId());
		boardService.addReply(reply);
		return "redirect:/board/notice/view?id="+reply.getBoard_id();
	}
	
	@RequestMapping(value="/reply/notice/rereply", method=RequestMethod.POST)
	public String rereply(@ModelAttribute Reply reply, @AuthenticationPrincipal User user) {
		reply.setUsers_id(user.getId());
		boardService.addRereply(reply);
		return "redirect:/board/notice/view?id="+reply.getBoard_id();
	}
	
}
