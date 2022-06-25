package com.recyclebin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recyclebin.domain.ChatRoomVO;
import com.recyclebin.mapper.ChatRoomMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService{
	private ChatRoomMapper mapper;
	
	@Override
	public int createChatRoom(ChatRoomVO vo) {
		// TODO Auto-generated method stub
		return mapper.createChatRoom(vo);
	}
	
	@Override
	public List<ChatRoomVO> getChatRooms(String id) {
		// TODO Auto-generated method stub
		mapper.updateUnreadCount();
		return mapper.getChatRooms(id);
	}
	
	@Override
	public ChatRoomVO selectChatRoom(Long cno) {
		// TODO Auto-generated method stub
		return mapper.selectChatRoom(cno);
	}


	@Override
	public ChatRoomVO searchChatRoom(String userId, String masterId) {
		// TODO Auto-generated method stub
		return mapper.searchChatRoom(userId, masterId);
	}

	

}
