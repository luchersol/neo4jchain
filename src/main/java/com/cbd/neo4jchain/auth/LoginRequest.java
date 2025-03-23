package com.cbd.neo4jchain.auth;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginRequest {

	@NotBlank
	private String username;

	@NotBlank
	private String password;

	public static LoginRequest of(String username, String password) {
		LoginRequest loginRequest = new LoginRequest();
		loginRequest.username = username;
		loginRequest.password = password;
		return loginRequest;
	}

}
