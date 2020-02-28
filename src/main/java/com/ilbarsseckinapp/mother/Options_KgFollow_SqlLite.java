package com.ilbarsseckinapp.mother;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * sqlite database helper to create table into SQLite database
 * @author ketan(Visit my <a
 *         href="http://androidsolution4u.blogspot.in/">blog</a>)
 */
public class Options_KgFollow_SqlLite extends SQLiteOpenHelper {
	static String DATABASE_NAME="motherkg";
	public static final String TABLE_NAME="kg";
	public static final String DATE="date";
	public static final String DAY="day";
	public static final String CHANGE="change";
	public static final String KG="kg";
	public static final String ID="id";
	private static String oldkg;
	private static int getcount;
	private static int datecount;
	public static String kginfo="0";
	public static String month1="0";
	public static String month2="0";
	public static String month3="0";
	public static String month4="0";
	public static String month5="0";
	public static String month6="0";
	public static String month7="0";
	public static String month8="0";
	public static String month9="0";
	public Options_KgFollow_SqlLite(Context context) {
		super(context, DATABASE_NAME, null, 1);
		
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		String CREATE_TABLE = "CREATE TABLE " + TABLE_NAME + "("
				+ ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ DAY + " TEXT,"
				+ CHANGE + " TEXT,"
				+ KG + " TEXT,"
				+ DATE + " TEXT" + ")";
		db.execSQL(CREATE_TABLE);


	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		db.execSQL("DROP TABLE IF EXISTS "+TABLE_NAME);
		onCreate(db);

	}
	public ArrayList Info(String date){

		//Bu methodda ise tablodaki tüm değerleri alıyoruz
		//ArrayList adı üstünde Array lerin listelendiği bir Array.Burda hashmapleri listeleyeceğiz
		//Herbir satırı değer ve value ile hashmap a atıyoruz. Her bir satır 1 tane hashmap arrayı demek.
		//olusturdugumuz tüm hashmapleri ArrayList e atıp geri dönüyoruz(return).

		SQLiteDatabase db = this.getReadableDatabase();
		String selectQuery = "SELECT * FROM " + TABLE_NAME +" WHERE date= '"+date+"'";
		Cursor cursor = db.rawQuery(selectQuery, null);
		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();

		if (cursor.moveToFirst()) {
			do {
				HashMap<String, String> map = new HashMap<String, String>();
				for(int i=0; i<cursor.getColumnCount();i++)
				{
					map.put(cursor.getColumnName(i), cursor.getString(i));

					Log.e("merhabaxxx",cursor.getColumnName(i)+"   "+cursor.getString(i));
					Log.e("merhabaxxxy", String.valueOf(cursor.getColumnCount()));
				}

				info.add(map);
			} while (cursor.moveToNext());
		}
		db.close();
		// return kitap liste

		return info;
	}
	public void delete(){

		SQLiteDatabase db = this.getReadableDatabase();
		String selectQuery = "DELETE  FROM " + TABLE_NAME;
		Cursor cursor = db.rawQuery(selectQuery, null);
		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();
		String data = "";
		if (cursor.moveToFirst()) {
			do {
				HashMap<String, String> map = new HashMap<String, String>();
				for(int i=0; i<cursor.getColumnCount();i++)
				{
					map.put(cursor.getColumnName(i), cursor.getString(i));

					Log.e("merhabaxxx",cursor.getColumnName(i)+"   "+cursor.getString(i));
					data=cursor.getString(1)+"-"+cursor.getString(2);
				}

				info.add(map);
			} while (cursor.moveToNext());
		}
		db.close();

	}
	public void updatedatecount(String date) {

		SQLiteDatabase db = this.getReadableDatabase();
		String selectQuery = "SELECT * FROM " + TABLE_NAME + " WHERE date= '" + date + "'";
		Cursor cursor = db.rawQuery(selectQuery, null);
		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();

		if (cursor.moveToFirst()) {
			do {
				HashMap<String, String> map = new HashMap<String, String>();
				for (int i = 0; i < cursor.getColumnCount(); i++) {
					map.put(cursor.getColumnName(i), cursor.getString(i));

					Log.e("merhabaxxx", cursor.getColumnName(i) + "   " + cursor.getString(i));
					Log.e("merhabaxxxy", String.valueOf(cursor.getCount()));
					datecount=cursor.getCount();
				}

				info.add(map);
			} while (cursor.moveToNext());
		}
		db.close();



	}
	public void InfoOrdercountone(){

		//Bu methodda ise tablodaki tüm değerleri alıyoruz
		//ArrayList adı üstünde Array lerin listelendiği bir Array.Burda hashmapleri listeleyeceğiz
		//Herbir satırı değer ve value ile hashmap a atıyoruz. Her bir satır 1 tane hashmap arrayı demek.
		//olusturdugumuz tüm hashmapleri ArrayList e atıp geri dönüyoruz(return).

		SQLiteDatabase db = this.getReadableDatabase();

		Cursor cursor = db.rawQuery("SELECT kg FROM " + TABLE_NAME+" ORDER BY date DESC LIMIT 1 OFFSET 1", null);
		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();

		if (cursor.moveToFirst()) {
			do {
				HashMap<String, String> map = new HashMap<String, String>();
				for(int i=0; i<cursor.getColumnCount();i++)
				{
					map.put(cursor.getColumnName(i), cursor.getString(i));

					//Log.e("merhabaxxxy",cursor.getColumnName(i)+"   "+cursor.getString(i));

				}
				oldkg= (cursor.getString(0));
				Log.e("asasas",cursor.getString(0));
				info.add(map);
			} while (cursor.moveToNext());
		}
		db.close();
		// return kitap liste

		return;
	}
	public void InfoOrderweek(){

		//Bu methodda ise tablodaki tüm değerleri alıyoruz
		//ArrayList adı üstünde Array lerin listelendiği bir Array.Burda hashmapleri listeleyeceğiz
		//Herbir satırı değer ve value ile hashmap a atıyoruz. Her bir satır 1 tane hashmap arrayı demek.
		//olusturdugumuz tüm hashmapleri ArrayList e atıp geri dönüyoruz(return).

		SQLiteDatabase db = this.getReadableDatabase();

		Cursor cursor = db.rawQuery("SELECT * FROM " + TABLE_NAME, null);
		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();

		if (cursor.moveToFirst()) {
			do {
				HashMap<String, String> map = new HashMap<String, String>();
				for(int i=0; i<cursor.getColumnCount();i++)
				{
					map.put(cursor.getColumnName(i), cursor.getString(i));

				Log.e("merhabakgg",cursor.getColumnName(i)+"   "+cursor.getString(i));

				}
				oldkg= (cursor.getString(0));
				kginfo=cursor.getString(1)+"-"+cursor.getString(0);
				Log.e("asasas",cursor.getString(1)+"-"+cursor.getString(3));
				String realweek[] =cursor.getString(1).split("\\.");
				Log.e("fare",realweek[0]);
				if(realweek[0].equals("0")||realweek[0].equals("1")||realweek[0].equals("2")||realweek[0].equals("3")||realweek[0].equals("4")){

					month1=cursor.getString(3);
				}
				if(realweek[0].equals("5")||realweek[0].equals("6")||realweek[0].equals("7")||realweek[0].equals("8")){

					month2=cursor.getString(3);
				}
				if(realweek[0].equals("9")||realweek[0].equals("10")||realweek[0].equals("11")||realweek[0].equals("12")){

					month3=cursor.getString(3);
				}
				if(realweek[0].equals("13")||realweek[0].equals("14")||realweek[0].equals("15")||realweek[0].equals("16")){

					month4=cursor.getString(3);
				}
				if(realweek[0].equals("17")||realweek[0].equals("18")||realweek[0].equals("19")||realweek[0].equals("20")){

					month5=cursor.getString(3);
				}
				if(realweek[0].equals("21")||realweek[0].equals("22")||realweek[0].equals("23")||realweek[0].equals("24")){

					month6=cursor.getString(3);
				}
				if(realweek[0].equals("25")||realweek[0].equals("26")||realweek[0].equals("27")||realweek[0].equals("28")){

					month7=cursor.getString(3);
				}
				if(realweek[0].equals("29")||realweek[0].equals("30")||realweek[0].equals("31")||realweek[0].equals("32")){

					month8=cursor.getString(3);
				}
				if(realweek[0].equals("33")||realweek[0].equals("34")||realweek[0].equals("35")||realweek[0].equals("36")){

					month9=cursor.getString(3);
				}
				if(realweek[0].equals("37")||realweek[0].equals("38")||realweek[0].equals("39")||realweek[0].equals("40")){

					month9=cursor.getString(3);
				}
				info.add(map);
			} while (cursor.moveToNext());
		}
		db.close();
		// return kitap liste

		return ;
	}
	public static String infokg(){
		return kginfo;
	}
	public void InfoOrder(){

		//Bu methodda ise tablodaki tüm değerleri alıyoruz
		//ArrayList adı üstünde Array lerin listelendiği bir Array.Burda hashmapleri listeleyeceğiz
		//Herbir satırı değer ve value ile hashmap a atıyoruz. Her bir satır 1 tane hashmap arrayı demek.
		//olusturdugumuz tüm hashmapleri ArrayList e atıp geri dönüyoruz(return).

		SQLiteDatabase db = this.getReadableDatabase();

		Cursor cursor = db.rawQuery("SELECT kg FROM " + TABLE_NAME+" ORDER BY id DESC LIMIT 1 OFFSET 0", null);
		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();

		if (cursor.moveToFirst()) {
			do {
				HashMap<String, String> map = new HashMap<String, String>();
				for(int i=0; i<cursor.getColumnCount();i++)
				{
					map.put(cursor.getColumnName(i), cursor.getString(i));

					//Log.e("merhabaxxxy",cursor.getColumnName(i)+"   "+cursor.getString(i));

				}
				oldkg= (cursor.getString(0));
				Log.e("asasas",cursor.getString(0));
				info.add(map);
			} while (cursor.moveToNext());
		}
		db.close();
		// return kitap liste

		return;
	}
	public int getcountkg(){
		return getcount;
	}
	public String orderkg(){
		return oldkg;
	}


	public void getcountt(){
		SQLiteDatabase db = this.getReadableDatabase();
		Cursor cursor = db.rawQuery("SELECT kg FROM " + TABLE_NAME, null);
		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();
		if (cursor.moveToFirst()) {
			do {
				HashMap<String, String> map = new HashMap<String, String>();
				for(int i=0; i<cursor.getColumnCount();i++)
				{
					map.put(cursor.getColumnName(i), cursor.getString(i));
				getcount=cursor.getCount();
				Log.e("tumkg", String.valueOf(getcount));
				}
				info.add(map);
			} while (cursor.moveToNext());
		}
		db.close();
		return;
	}

	public ArrayList update (String date,String kg){

		String selectQuery = "UPDATE "+TABLE_NAME+ " SET "+ KG +"= '"+kg +"'"+" WHERE date= '"+date+"'";
		SQLiteDatabase db = this.getWritableDatabase();
		db.execSQL(selectQuery);

		ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();
		db.close();
		return info;
	}

	public int getDatecount(){
		return datecount;
	}
}
