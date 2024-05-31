package com.aja.member.mailtest;

import java.util.Properties;

public class MailSender {
	public static void main(String[] args) {
		String title = "메일보내기 test 메일";
		String content = "메일보내기 test 메일입니당";
		String user_name="ajaaja7979@naver.com";
		String password = "tjdwns0722@";
		
		SendMail sendMail = new SendMail();
		sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content);
		
	}
}
