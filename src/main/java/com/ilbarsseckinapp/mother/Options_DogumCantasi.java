package com.ilbarsseckinapp.mother;


import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.widget.Toolbar;
import androidx.core.content.ContextCompat;

import java.util.ArrayList;
import java.util.HashMap;


public class Options_DogumCantasi extends Activity implements View.OnClickListener  {

    private SQLiteDatabase dataBase;
    private ArrayList<String> ihtiyac = new ArrayList<String>();
    private ArrayList<String> status = new ArrayList<String>();
    private Options_DogumCantasi_SqlLite mHelper;
    private ListView alindi;
    private ListView alinmadi;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_dogumcantasi);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar3);
        toolbar.setTitle("Doğum Çantası");
        toolbar.setTitleTextColor(ContextCompat.getColor(getApplicationContext(), R.color.AppColor));
        initView();

        Log.e("nalan",mHelper.countgetdata());
        if((mHelper.countgetdata().equals("0"))){
            String data[]=  IhtiyacListData.dogumcantasilistesi.split(",");
            for(int i=0;i< data.length;i++){
                Log.e("nalan1",data[i]);
                saveData(data[i],"0");

            }
        }


        alinmadi.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> arg0, View view, int position, long arg3) {

                saveDataupdatealindi(alinmadi.getItemAtPosition(position).toString(),"1");
                displayDataalinacak("0");
                displayDataalindi("1");
            }

        });
        alindi.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> arg0, View view, int position, long arg3) {
                saveDataupdatealindi(alindi.getItemAtPosition(position).toString(),"0");
                displayDataalinacak("0");
                displayDataalindi("1");
            }

        });
    }

    @Override
    protected void onResume() {
        displayDataalinacak("0");
        displayDataalindi("1");
        super.onResume();
    }


    private void displayDataalinacak(String durum) {
        dataBase = mHelper.getReadableDatabase();
        ArrayList<String > results  = new ArrayList<>();

        Cursor mCursor = dataBase.rawQuery("SELECT * FROM dogumcantasi WHERE durum= ? ",new String[]{durum});
        ihtiyac.clear();
        status.clear();
        if (mCursor != null ) {
            if  (mCursor.moveToFirst()) {
                do {  results.add(mCursor.getString(mCursor.getColumnIndex("ihtiyac")));
                }while (mCursor.moveToNext());
            }
        }
        ArrayAdapter adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, results);

        alinmadi.setAdapter(adapter);

        mCursor.close();



    }

    private void displayDataalindi(String durum) {
        dataBase = mHelper.getReadableDatabase();
        ArrayList<String > results  = new ArrayList<>();

        Cursor mCursor = dataBase.rawQuery("SELECT * FROM dogumcantasi WHERE durum= ? ",new String[]{durum});
        ihtiyac.clear();
        status.clear();
        if (mCursor != null ) {
            if  (mCursor.moveToFirst()) {
                do {  results.add(mCursor.getString(mCursor.getColumnIndex("ihtiyac")));
                }while (mCursor.moveToNext());
            }
        }
        ArrayAdapter adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, results);

        alindi.setAdapter(adapter);

        mCursor.close();



    }
    private void displayDataalindi1() {
        dataBase = mHelper.getWritableDatabase();
        Cursor mCursor = dataBase.rawQuery("SELECT * FROM "
                + Options_DogumCantasi_SqlLite.TABLE_NAME, null);

        ihtiyac.clear();
        status.clear();

        if (mCursor.moveToFirst()) {
            do {
                ihtiyac.add(mCursor.getString(mCursor.getColumnIndex(Options_DogumCantasi_SqlLite.IHTIYAC)));
                status.add(mCursor.getString(mCursor.getColumnIndex(Options_DogumCantasi_SqlLite.STATUS)));


            } while (mCursor.moveToNext());
        }
        Options_DisplayAdapter_DogumCantasi disadpt= new Options_DisplayAdapter_DogumCantasi(this,ihtiyac, status);
        alindi.setAdapter(disadpt);
        mCursor.close();
    }

    private void saveData(String ihtiyac,String durum){
        dataBase=mHelper.getWritableDatabase();
        ContentValues values=new ContentValues();
        values.put(Options_DogumCantasi_SqlLite.IHTIYAC,ihtiyac );
        values.put(Options_DogumCantasi_SqlLite.STATUS,durum);

        dataBase.insert(Options_DogumCantasi_SqlLite.TABLE_NAME, null, values);
        dataBase.close();

    }


    private void saveDataupdatealindi(String ihtiyac,String durum){
        dataBase=mHelper.getWritableDatabase();
        ContentValues values=new ContentValues();

        values.put(Options_DogumCantasi_SqlLite.IHTIYAC,ihtiyac );
        values.put(Options_DogumCantasi_SqlLite.STATUS,durum);
        System.out.println("");

        dataBase.update(Options_DogumCantasi_SqlLite.TABLE_NAME, values, "ihtiyac='" + ihtiyac+"'", null);

        dataBase.close();

    }
    private void saveDataupdatealinmadi(String ihtiyac,String durum){
        dataBase=mHelper.getWritableDatabase();
        ContentValues values=new ContentValues();

        values.put(Options_DogumCantasi_SqlLite.IHTIYAC,ihtiyac );
        values.put(Options_DogumCantasi_SqlLite.STATUS,durum);
        System.out.println("");

        dataBase.update(Options_DogumCantasi_SqlLite.TABLE_NAME, values, "ihtiyac='" + ihtiyac+"'", null);

        dataBase.close();

    }


    private void initView() {
        alinmadi = (ListView) findViewById(R.id.alinacaklistview);
        alindi=(ListView) findViewById(R.id.alindilistview);
        mHelper = new Options_DogumCantasi_SqlLite(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            default:
                break;
        }
    }
    public HashMap<String, String> kitapDetay(int id){
        //Databeseden id si belli olan row u çekmek için.
        //Bu methodda sadece tek row değerleri alınır.

        //HashMap bir çift boyutlu arraydir.anahtar-değer ikililerini bir arada tutmak için tasarlanmıştır.
        //mesala map.put("x","300"); mesala burda anahtar x değeri 300.

        HashMap<String,String> kitap = new HashMap<String,String>();
        String selectQuery = "SELECT * FROM " + Options_DogumCantasi_SqlLite.TABLE_NAME+ " WHERE durum="+id;

        SQLiteDatabase db = mHelper.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);
        // Move to first row
        cursor.moveToFirst();
        if(cursor.getCount() > 0){
            kitap.put("ihtiyac", cursor.getString(1));
            kitap.put("durum", cursor.getString(2));

        }
        cursor.close();
        db.close();
        // return kitap
        return kitap;
    }
    @Override
    public void onBackPressed()
    {
        if(MainActivity.mainback==true){
            Intent intent = new Intent(Options_DogumCantasi.this, MainActivity.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }else {
            Intent intent = new Intent(Options_DogumCantasi.this, Options.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }
    }
}
