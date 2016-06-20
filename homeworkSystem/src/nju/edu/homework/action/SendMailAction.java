package nju.edu.homework.action;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 系统发送邮件 Action
 * @author cylong
 * @version 2016年6月20日 下午2:17:18
 */
public class SendMailAction {
	
	public static void main(String[] args) {
		SendMailAction mail = new SendMailAction();
		mail.sendMail("131250181@smail.nju.edu.cn", "JavaMail 测试6", "这是 JavaMail 测试邮件6");
	}

	/**
	 * @param address 收件人邮箱
	 * @param subject 邮件主题
	 * @param content 邮件内容
	 * @author cylong
	 * @version 2016年6月20日  下午7:23:39
	 */
	public void sendMail(String address, String subject, String content) {
		
		String user = "cylong1016@163.com";
		String pwd = "lsy940815";
		
		Properties props = new Properties();
		// 开启debug调试  
		props.setProperty("mail.debug", "true");
		// 发送服务器需要身份验证  
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器主机名  
		props.setProperty("mail.host", "smtp.163.com");
		// 发送邮件协议名称  
		props.setProperty("mail.transport.protocol", "smtp");

		// 设置环境信息  
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pwd);
			}
		});

		// 创建邮件对象  
		Message msg = new MimeMessage(session);
		try {
			// 设置邮件主题
			msg.setSubject(subject);
			// 设置邮件内容  
			msg.setText(content);
			// 设置发件人 
			msg.setFrom(new InternetAddress(user));
			// 设置收件人
			msg.setRecipient(RecipientType.TO, new InternetAddress(address));

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
