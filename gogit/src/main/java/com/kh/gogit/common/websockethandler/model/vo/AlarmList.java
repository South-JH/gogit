package com.kh.gogit.common.websockethandler.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AlarmList {
	private int alarmNo;
	private String alarmTitle;
	private String alarmType;
	private String memId;
	private String rmemId;
	private int alarmContentNo;
	private String alarmDate;
	private String alarmYn;
	private String status;
	private String gitNick;
}
