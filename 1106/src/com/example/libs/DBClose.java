package com.example.libs;

import java.sql.Connection;
import java.sql.SQLException;

public class DBClose {
	public static void close(Connection conn) {
		try {
			conn.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
}
