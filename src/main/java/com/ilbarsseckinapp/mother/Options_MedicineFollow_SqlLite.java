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
public class Options_MedicineFollow_SqlLite extends SQLiteOpenHelper {
    static String DATABASE_NAME="ilactakip";
    public static final String TABLE_NAME="medicine";
    public static final String ID="id";
    public static final String NAME="name";
    public static final String ACTOK="actok";
    public static final String TIME="saat";
    public static final String DURUM="durum";

    private static String oldkg;
    private static String lastid="";
    public Options_MedicineFollow_SqlLite(Context context) {
        super(context, DATABASE_NAME, null, 1);

    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String CREATE_TABLE = "CREATE TABLE " + TABLE_NAME + "("
                + ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
                + NAME + " TEXT,"
                + ACTOK + " TEXT,"
                + TIME + " TEXT,"
                + DURUM + " TEXT" + ")";
        db.execSQL(CREATE_TABLE);


    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS "+TABLE_NAME);
        onCreate(db);

    }
    public int getcount(){
        SQLiteDatabase db = this.getReadableDatabase();
        String selectQuery = "SELECT COUNT(*)  FROM " + TABLE_NAME;
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
        return cursor.getColumnCount();
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

                }

                info.add(map);
            } while (cursor.moveToNext());
        }
        db.close();
        // return kitap liste

        return info;
    }
    public String gettime(String time){

        SQLiteDatabase db = this.getReadableDatabase();
        String selectQuery = "SELECT * FROM " + TABLE_NAME +" WHERE saat= '"+time+"'";
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
        // return kitap liste

        return data;
    }
    public int IDLastCount(){
        // MAX İD DEĞERİNİ BULUP ÇOKLU ALARMIN RQS ID BELİRLEMEM LAZIM

        //Bu methodda ise tablodaki tüm değerleri alıyoruz
        //ArrayList adı üstünde Array lerin listelendiği bir Array.Burda hashmapleri listeleyeceğiz
        //Herbir satırı değer ve value ile hashmap a atıyoruz. Her bir satır 1 tane hashmap arrayı demek.
        //olusturdugumuz tüm hashmapleri ArrayList e atıp geri dönüyoruz(return).

        SQLiteDatabase db = this.getReadableDatabase();
        String selectQuery = "SELECT * FROM " + TABLE_NAME+" ORDER BY id "+"DESC" ;
        Cursor cursor = db.rawQuery(selectQuery, null);
        ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();
        int count = 0;
        if (cursor.moveToFirst()) {
            do {
                HashMap<String, String> map = new HashMap<String, String>();
                for(int i=0; i<cursor.getColumnCount();i++)
                {
                    map.put(cursor.getColumnName(i), cursor.getString(i));

                    Log.e("merhabaxxx",cursor.getColumnName(i)+"   "+cursor.getString(i));
                    count=cursor.getCount();
                }

                info.add(map);
            } while (cursor.moveToNext());
        }
        db.close();
        // return kitap liste

        return count;
    }
    public void InfoOrder(){

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
    public String orderkg(){
        return oldkg;
    }



/*    public ArrayList update (String date,String kg){

        String selectQuery = "UPDATE "+TABLE_NAME+ " SET "+ KG +"= '"+kg +"'"+" WHERE date= '"+date+"'";
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL(selectQuery);

        ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();
        db.close();
        return info;
    }*/
public void delete(String id){

    SQLiteDatabase db = this.getReadableDatabase();
    String selectQuery = "DELETE  FROM " + TABLE_NAME +" WHERE id= '"+id+"'";
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

}
