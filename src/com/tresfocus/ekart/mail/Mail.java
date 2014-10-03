package com.tresfocus.ekart.mail;

import java.util.ArrayList;
import java.util.List;

public class Mail {
	private String fromAddress;
	private List<String> toAddress = new ArrayList<String>();
	private List<String> ccAddress = new ArrayList<String>();
	private List<String> bccAddress = new ArrayList<String>();
	private List<String> replyToAddress = new ArrayList<String>();
	
	private String subject;
	private String body;
	
	private boolean hasAttachements = false;
	private List<String> attachments;

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public List<String> getToAddress() {
		return toAddress;
	}

	public void setToAddress(List<String> toAddress) {
		this.toAddress = toAddress;
	}

	public List<String> getCcAddress() {
		return ccAddress;
	}

	public void setCcAddress(List<String> ccAddress) {
		this.ccAddress = ccAddress;
	}

	public List<String> getBccAddress() {
		return bccAddress;
	}

	public void setBccAddress(List<String> bccAddress) {
		this.bccAddress = bccAddress;
	}

	public List<String> getReplyToAddress() {
		return replyToAddress;
	}

	public void setReplyToAddress(List<String> replyToAddress) {
		this.replyToAddress = replyToAddress;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public List<String> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<String> attachments) {
		hasAttachements = true;
		this.attachments = attachments;
	}

	public boolean isHasAttachements() {
		return hasAttachements;
	}

	public void setHasAttachements(boolean hasAttachements) {
		this.hasAttachements = hasAttachements;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mail [fromAddress=");
		builder.append(fromAddress);
		builder.append(", toAddress=");
		builder.append(toAddress);
		builder.append(", ccAddress=");
		builder.append(ccAddress);
		builder.append(", bccAddress=");
		builder.append(bccAddress);
		builder.append(", replyToAddress=");
		builder.append(replyToAddress);
		builder.append(", subject=");
		builder.append(subject);
		builder.append(", body=");
		builder.append(body);
		builder.append(", attachments=");
		builder.append(attachments);
		builder.append("]");
		return builder.toString();
	}
}
