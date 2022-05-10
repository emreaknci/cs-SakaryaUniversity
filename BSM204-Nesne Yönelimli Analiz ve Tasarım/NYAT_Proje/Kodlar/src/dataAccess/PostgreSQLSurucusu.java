package dataAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import core.dataAccess.IDbRepository;
import entity.Kullanici;

public class PostgreSQLSurucusu implements IDbRepository {

	private Connection baglan() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SmartDeviceDB", "postgres", "123456");

		} catch (Exception e) {
			System.out.println("Veritabanina baglanti girisimi basarisiz!");
			e.printStackTrace();
		}
		return conn;
	}

	@Override
	public Kullanici kullaniciDondur(String ad, String sifre) {
		Kullanici kullanici = new Kullanici();
		Connection conn = this.baglan();

		try {
			String sql = "SELECT *  FROM \"users\" WHERE \"UserName\"='" + ad + "' AND \"Password\"='" + sifre + "'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				kullanici.setId(rs.getInt("Id"));
				kullanici.setKullaniciAdi(rs.getString("UserName"));
				kullanici.setSifre(rs.getString("Password"));
			}

			conn.close();
			rs.close();
			stmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return kullanici;

	}

	@Override
	public boolean kullaniciAdiDogrula(String ad) {
		Connection conn = this.baglan();

		try {
			String sql = "SELECT count(*)  FROM \"users\" WHERE \"UserName\"='" + ad + "'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			int count = 0;
			while (rs.next())
				count = rs.getInt("count");

			if (count == 1)
				return true;

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean sifreDogrula(String ad, String sifre) {

		Connection conn = this.baglan();

		try {

			String sql = "SELECT count(*) FROM \"users\" WHERE \"UserName\"='" + ad + "' AND \"Password\"='" + sifre
					+ "'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			int count = 0;
			while (rs.next())
				count = rs.getInt("count");

			if (count == 1)
				return true;

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public void durumGuncelle(int durum, Kullanici kullanici) {
		Connection conn = this.baglan();

		try {
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO \"statusChangeLogs\"(\"StatusId\",\"UserId\")" + "VALUES (" + durum + ", "
					+ kullanici.getId() + ")";
			stmt.executeUpdate(sql);

			conn.close();
			stmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int mevcutDurumGonder() {
		int durum = 2; // veritabaninda hic veri yoksa kapali sayilacak
						// (veritabaninda kapali durumunun id'si 2)
		Connection conn = this.baglan();

		try {
			String sql = "select * from \"statusChangeLogs\" join \"statuses\" "
					+ " on \"statuses\".\"Id\"= \"statusChangeLogs\".\"StatusId\" "
					+ "order by \"statusChangeLogs\".\"Date\" desc limit 1";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			conn.close();

			while (rs.next()) {
				durum = rs.getInt("StatusId");
			}

			rs.close();
			stmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return durum;
	}

} 
