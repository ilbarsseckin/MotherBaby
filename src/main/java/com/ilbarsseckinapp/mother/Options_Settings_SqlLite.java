package com.ilbarsseckinapp.mother;

import java.util.ArrayList;
import java.util.HashMap;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class Options_Settings_SqlLite extends SQLiteOpenHelper {

    // All Static variables
    // Database Version
    private static final int DATABASE_VERSION = 1;

    // Database Name
    private static final String DATABASE_NAME = "MOTHER";//database adı

    private static final String TABLE_NAME = "MYBABY";
    public static final String BABYNAME = "babyname";
    public static final String BABYSEX = "babysex";
    public static final String BABYKIN = "babykin";
    public static final String BABYGUESS = "babyguess";
    public static final String LASTADET = "lastadet";
    private String adi="";
    private String cinsiyet="";
    private String akraba="";
    private String tahmin="";
    private String sonadet="";
    public Options_Settings_SqlLite(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }


    @Override
    public void onCreate(SQLiteDatabase db) {  // Databesi oluşturuyoruz.Bu methodu biz çağırmıyoruz. Databese de obje oluşturduğumuzda otamatik çağırılıyor.
        String CREATE_TABLE = "CREATE TABLE " + TABLE_NAME + "("
                + BABYNAME + " TEXT,"
                + BABYSEX + " TEXT,"
                + BABYKIN + " TEXT,"
                + BABYGUESS + " TEXT,"
                + LASTADET + " TEXT" + ")";
        db.execSQL(CREATE_TABLE);
    }




/*    public void kitapSil(int id){ //id si belli olan row u silmek için

        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_NAME, KITAP_ID + " = ?",
                new String[] { String.valueOf(id) });
        db.close();
    }*/

    public void olustur(String name, String sex,String kin,String guess,String adet) {
        //kitapEkle methodu ise adı üstünde Databese veri eklemek için
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(BABYNAME, name);
        values.put(BABYSEX, sex);
        values.put(BABYKIN, kin);
        values.put(BABYGUESS, guess);
        values.put(LASTADET, adet);
        db.insert(TABLE_NAME, null, values);
        db.close(); //Database Bağlantısını kapattık*/
    }


/*    public HashMap<String, String> kitapDetay(int id){
        //Databeseden id si belli olan row u çekmek için.
        //Bu methodda sadece tek row değerleri alınır.

        //HashMap bir çift boyutlu arraydir.anahtar-değer ikililerini bir arada tutmak için tasarlanmıştır.
        //mesala map.put("x","300"); mesala burda anahtar x değeri 300.

        HashMap<String,String> kitap = new HashMap<String,String>();
        String selectQuery = "SELECT * FROM " + TABLE_NAME+ " WHERE id="+id;

        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);
        // Move to first row
        cursor.moveToFirst();
        if(cursor.getCount() > 0){
            kitap.put(KITAP_ADI, cursor.getString(1));
            kitap.put(KITAP_YAZARI, cursor.getString(2));
            kitap.put(KITAP_BASIM_YILI, cursor.getString(3));
            kitap.put(KITAP_FIYATI, cursor.getString(4));
        }
        cursor.close();
        db.close();
        // return kitap
        return kitap;
    }*/

    public  ArrayList<HashMap<String, String>> Info(){

        //Bu methodda ise tablodaki tüm değerleri alıyoruz
        //ArrayList adı üstünde Array lerin listelendiği bir Array.Burda hashmapleri listeleyeceğiz
        //Herbir satırı değer ve value ile hashmap a atıyoruz. Her bir satır 1 tane hashmap arrayı demek.
        //olusturdugumuz tüm hashmapleri ArrayList e atıp geri dönüyoruz(return).

        SQLiteDatabase db = this.getReadableDatabase();
        String selectQuery = "SELECT * FROM " + TABLE_NAME;
        Cursor cursor = db.rawQuery(selectQuery, null);
        ArrayList<HashMap<String, String>> info = new ArrayList<HashMap<String, String>>();

        if (cursor.moveToFirst()) {
            do {
                HashMap<String, String> map = new HashMap<String, String>();
                for(int i=0; i<cursor.getColumnCount();i++)
                {
                    map.put(cursor.getColumnName(i), cursor.getString(i));

                    Log.e("merhaba",cursor.getColumnName(i)+"   "+cursor.getString(i));

                //   inf=cursor.getColumnName(i)+"-"+cursor.getString(i);
                   if(cursor.getColumnName(i).equals("babyname"))adi=cursor.getString(i);
                    if(cursor.getColumnName(i).equals("babysex"))cinsiyet=cursor.getString(i);
                    if(cursor.getColumnName(i).equals("babykin"))akraba=cursor.getString(i);
                    if(cursor.getColumnName(i).equals("babyguess"))tahmin=cursor.getString(i);
                    if(cursor.getColumnName(i).equals("lastadet"))sonadet=cursor.getString(i);

                }

                info.add(map);
            } while (cursor.moveToNext());
        }
        db.close();
        // return kitap liste
        return info;
    }
        public String getBabyname(){ return adi; }
        public String getBabysex(){ return cinsiyet; }
        public String getBabyakraba(){ return akraba; }
        public String getBabytahmin(){ return tahmin; }
        public String getBabyadet(){ return sonadet; }
/*
    public void kitapDuzenle(String kitap_adi, String kitap_yazari,String kitap_basim_yili,String kitap_fiyat,int id) {
        SQLiteDatabase db = this.getWritableDatabase();
        //Bu methodda ise var olan veriyi güncelliyoruz(update)
        ContentValues values = new ContentValues();
        values.put(KITAP_ADI, kitap_adi);
        values.put(KITAP_YAZARI, kitap_yazari);
        values.put(KITAP_BASIM_YILI, kitap_basim_yili);
        values.put(KITAP_FIYATI, kitap_fiyat);

        // updating row
        db.update(TABLE_NAME, values, KITAP_ID + " = ?",
                new String[] { String.valueOf(id) });
    }
*/

    public int getRowCount() {
        // Bu method bu uygulamada kullanılmıyor ama her zaman lazım olabilir.Tablodaki row sayısını geri döner.
        //Login uygulamasında kullanacağız
        String countQuery = "SELECT  * FROM " + TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(countQuery, null);
        int rowCount = cursor.getCount();
        db.close();
        cursor.close();
        // return row count
        return rowCount;
    }


    public void resetTables(){
        //Bunuda uygulamada kullanmıyoruz. Tüm verileri siler. tabloyu resetler.
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_NAME, null, null);
        db.close();
    }

    @Override
    public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
        // TODO Auto-generated method stub

    }

}
