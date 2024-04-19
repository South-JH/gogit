package com.kh.gogit.common.websockethandler.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class WebSocketController {

	@RequestMapping("alam.ws")
	public void test() {
		System.out.println("ss");
	}
}
