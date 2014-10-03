package com.tresfocus.ekart.test;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.tresfocus.ekart.OrderNumberGenerator;

public class Main {
	public static void main(String[] args) throws Exception {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); 
		System.out.println(passwordEncoder.encode("Welcome123"));
		System.out.println(passwordEncoder.matches("Welcome123", "$2a$10$uMR24niNDhokLLwoeDn2ZeLAPiFkswEvCDwJ8lMm1yd/jmVoLa2V6"));
		String hashed = BCrypt.hashpw("Welcome123", BCrypt.gensalt(12));

		// Check that an unencrypted password matches one that has
		// previously been hashed
		if (BCrypt.checkpw("Welcome123", hashed))
			System.out.println("It matches");
		else
			System.out.println("It does not match");
	}
		
}
//$2a$12$LGxvTk57AruBhaUYj9EfROg55BfGJzbby7VTVYX4ySK64HPmJnrSW

//$2a$10$0MEghn/S2cTO.NcgdfRSXeQkJxRLrr6Ge3mm7XpG3Mfefucp4sWL2

//$2a$10$29fHPlcl5kBTvhYhcWXV9uc8YACPNnC6NmRk8FKA1HHkGiIcyhSEm