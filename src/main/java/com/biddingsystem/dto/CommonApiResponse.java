package com.biddingsystem.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonApiResponse {

	private String responseMessage;
	
	private boolean isSuccess;

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public boolean isSuccess() {
		return isSuccess;
	}

	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	public static Builder builder() {
		return new Builder();
	}

	public static class Builder {
		private String responseMessage;
		private boolean isSuccess;

		public Builder responseMessage(String responseMessage) {
			this.responseMessage = responseMessage;
			return this;
		}

		public Builder isSuccess(boolean isSuccess) {
			this.isSuccess = isSuccess;
			return this;
		}

		public Builder success(boolean isSuccess) {
			this.isSuccess = isSuccess;
			return this;
		}

		public CommonApiResponse build() {
			CommonApiResponse response = new CommonApiResponse();
			response.setResponseMessage(this.responseMessage);
			response.setSuccess(this.isSuccess);
			return response;
		}
	}

}
