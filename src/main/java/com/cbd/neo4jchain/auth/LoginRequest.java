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
	private String name;

	@NotBlank
	private String password;

	public static LoginRequest of(String name, String password) {
		LoginRequest loginRequest = new LoginRequest();
		loginRequest.name = name;
		loginRequest.password = password;
		return loginRequest;
	}

}
