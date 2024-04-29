package com.kh.gogit.common.websockethandler.handler;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.gogit.common.websockethandler.model.dao.AlarmListDao;
import com.kh.gogit.common.websockethandler.model.vo.AlarmList;
import com.kh.gogit.member.model.vo.Member;

@Component
@RequestMapping("alarm.ws")
public class WebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private AlarmListDao aDao = new AlarmListDao();
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Member m = new Member();

	private HashMap<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();

	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		// System.out.println("시작 :" +session);
		Map<String, Object> httpSession = session.getAttributes();
		m = (Member) httpSession.get("loginUser");

		map.put(m.getMemId(), session);

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지

		String[] arr = (message.getPayload()).split(",");

		if (arr[4].equals("project")) {
			String rmemId = aDao.selectMemid(sqlSession, arr[2]);
			AlarmList al = new AlarmList();
			al.setMemId(arr[0]);
			al.setAlarmTitle(arr[1]);
			al.setRmemId(rmemId);
			al.setAlarmContentNo(Integer.parseInt(arr[3]));
			al.setAlarmType(arr[4]);

			aDao.insertAlarm(sqlSession, al);
		} else if (arr[4].equals("zoom")) {

			ArrayList<String> memId = aDao.selectTeamid(sqlSession, arr[2]);

			ArrayList<String> type = aDao.checkMemId(sqlSession, arr[0]);
			if (type.size() == 0) {

				for (int i = 0; i < memId.size(); i++) {
					AlarmList al = new AlarmList();
					al.setMemId(arr[0]);
					al.setRmemId(memId.get(i));
					if (al.getMemId().equals(al.getRmemId())) {
						al.setAlarmTitle(arr[5]);
					} else {
						al.setAlarmTitle(arr[6]);
					}
					al.setAlarmType(arr[4]);

					aDao.rinsertAlarm(sqlSession, al);
				}

			}

		} else if (arr[4].equals("calendar")) {
			ArrayList<String> memId = aDao.selectTeamid(sqlSession, arr[2]);

			for (int i = 0; i < memId.size(); i++) {

				AlarmList al = new AlarmList();
				al.setMemId(arr[0]);
				al.setRmemId(memId.get(i));
				al.setAlarmTitle(arr[1]);
				al.setAlarmContentNo(Integer.parseInt(arr[3]));
				al.setAlarmType(arr[4]);
				aDao.insertAlarm(sqlSession, al);
			}
		} else if (arr[4].equals("ucalendar")) {
			ArrayList<String> memId = aDao.selectTeamid(sqlSession, arr[2]);

			for (int i = 0; i < memId.size(); i++) {

				AlarmList al = new AlarmList();
				al.setMemId(arr[0]);
				al.setRmemId(memId.get(i));
				al.setAlarmTitle(arr[1]);
				al.setAlarmContentNo(Integer.parseInt(arr[3]));
				al.setAlarmType(arr[4]);
				aDao.rinsertAlarm(sqlSession, al);

			}
		} else if (arr[4].equals("dcalendar")) {
			ArrayList<String> memId = aDao.selectTeamid(sqlSession, arr[2]);

			for (int i = 0; i < memId.size(); i++) {

				AlarmList al = new AlarmList();
				al.setMemId(arr[0]);
				al.setRmemId(memId.get(i));
				al.setAlarmTitle(arr[1]);
				al.setAlarmContentNo(Integer.parseInt(arr[3]));
				al.setAlarmType(arr[4]);
				aDao.rinsertAlarm(sqlSession, al);

			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {// 연결 해제

		map.remove(m.getMemId());
		sessions.remove(session);
	}

}
