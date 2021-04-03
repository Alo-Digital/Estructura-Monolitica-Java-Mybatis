package com.conmi.carta.administrador.utils;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component
public class Helper {
	boolean ValidadorPatron(String campo, String pattern) {
		// Pattern pat = Pattern.compile(pattern);
		// Matcher mat = pat.matcher(campo);
		// return mat.matches();
		return !Pattern.matches(pattern, campo);
	}

	boolean isEmail(String campo) {
		return !Pattern.matches("^(.+)@(\\S+)$$", campo);
	}

	boolean isText(String campo) {
		return !Pattern.matches("^[a-zA-Z\\s]{2,}(?: [a-zA-Z\\s]+){0,2}$", campo);
	}

	boolean isExists(String campo) {
		return !campo.trim().isEmpty();
	}	
	
	  boolean isNumeric(String str) {
		try {
			Double.parseDouble(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	boolean ValidadorSiNumero(String campo) {
		return !isNumeric(campo);
	}
}
