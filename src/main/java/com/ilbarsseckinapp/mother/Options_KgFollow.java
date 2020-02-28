package com.ilbarsseckinapp.mother;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.widget.Toolbar;
import androidx.core.content.ContextCompat;

import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;
import com.shashank.sony.fancygifdialoglib.FancyGifDialog;
import com.shashank.sony.fancygifdialoglib.FancyGifDialogListener;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * activity to display all records from SQLite database
 * @author ketan(Visit my <a
 *         href="http://androidsolution4u.blogspot.in/">blog</a>)
 */
public class Options_KgFollow extends Activity {

    private Options_KgFollow_SqlLite mHelper;
    private SQLiteDatabase dataBase;

    private ArrayList<String> userId = new ArrayList<String>();
    private ArrayList<String> day = new ArrayList<String>();
    private ArrayList<String> degisim = new ArrayList<String>();
    private ArrayList<String> kg = new ArrayList<String>();
    private ArrayList<String> date = new ArrayList<String>();
    private ListView userList;
    private AlertDialog.Builder build;
    Options_Settings_Service settingsinfo;
    private TextView enterkg;
    private static Button clean;
    private static  YoYo.YoYoString rope;
    private Intent intent;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_kgfollow);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar3);
        toolbar.setTitle("Kilo Takip");
        toolbar.setTitleTextColor(ContextCompat.getColor(getApplicationContext(), R.color.AppColor));

        userList = (ListView) findViewById(R.id.List);
        enterkg=(TextView)findViewById(R.id.enterkgtxt);
        clean=(Button)findViewById(R.id.kgclean);

        mHelper = new Options_KgFollow_SqlLite(this);
        if(FileTask.readData("motherkg").equals("") || FileTask.readData("motherkg").equals(null)){
         firstkg();
        }
        //add new record
        findViewById(R.id.btnAdd).setOnClickListener(new OnClickListener() {

            public void onClick(View v) {

                if (enterkg.getText().toString().length() > 1) {
                    Date tarih = new Date();
                    SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");
                    String gun = info(getApplicationContext());

                    String date = bugun.format(tarih);
                    Log.e("sonra", date);
                    String kg = enterkg.getText().toString();
                    dataBase = mHelper.getWritableDatabase();
                    ContentValues values = new ContentValues();

                    String difdate = String.valueOf(mHelper.Info("10/02/2020"));
                    mHelper.updatedatecount("11/02/2020");

                    Log.e("sonray", String.valueOf(mHelper.getDatecount()));
                    mHelper.getDatecount();
                    mHelper.InfoOrder();
                    int girilen = Integer.valueOf(kg);
                    mHelper.getcountt();
                    Log.e("sonraz", String.valueOf(mHelper.getcountkg()));

                    if (mHelper.getDatecount() == 0) {//aynı tarih yoksa ekle
                        int oncekikg = Integer.valueOf(mHelper.orderkg());
                        int sonuc = girilen - oncekikg;
                        saveData(gun + ".hafta", String.valueOf(sonuc), kg, date);
                    } else {//aynı tarih varsa
                        if (mHelper.getcountkg() == 1) {

                            saveDataupdate(gun + ".hafta", "0", kg, date);
                        } else {
                            int oncekikg = Integer.valueOf(mHelper.orderkg());
                            int sonuc = girilen - oncekikg;
                            saveDataupdate(gun + ".hafta", String.valueOf(sonuc), kg, date);
                        }
                    }
                    displayData();
                    Toast.makeText(getApplicationContext(), "Eklendi.",
                            Toast.LENGTH_LONG).show();
                    YoYo.with(Techniques.Wave).playOn(findViewById(R.id.List));
                }else{
              /*      YoYo.with(Techniques.Tada)
                            .duration(700)
                            .playOn(findViewById(R.id.enterkgtxt));*/
                    YoYo.with(Techniques.Shake).playOn(findViewById(R.id.enterkgtxt));
                }
            }
        });

        findViewById(R.id.kgclean).setOnClickListener(new OnClickListener() {

            public void onClick(View v) {
            deletekg();
            }
        });
    }

    @Override
    protected void onResume() {
        displayData();
        super.onResume();
    }

    /**
     * displays data from SQLite
     */
    private void displayData() {
        dataBase = mHelper.getWritableDatabase();
        Cursor mCursor = dataBase.rawQuery("SELECT * FROM "
                + Options_KgFollow_SqlLite.TABLE_NAME+" ORDER BY "+"id" +" DESC", null);

        userId.clear();
        day.clear();
        degisim.clear();
        kg.clear();
        date.clear();
        if (mCursor.moveToFirst()) {
            do {
                userId.add(mCursor.getString(mCursor.getColumnIndex(Options_KgFollow_SqlLite.ID)));
                day.add(mCursor.getString(mCursor.getColumnIndex(Options_KgFollow_SqlLite.DAY)));
                degisim.add(mCursor.getString(mCursor.getColumnIndex(Options_KgFollow_SqlLite.CHANGE)));
                kg.add(mCursor.getString(mCursor.getColumnIndex(Options_KgFollow_SqlLite.KG)));
                date.add(mCursor.getString(mCursor.getColumnIndex(Options_KgFollow_SqlLite.DATE)));

            } while (mCursor.moveToNext());
        }
        Options_DisplayAdapter disadpt = new Options_DisplayAdapter(this,userId, day, degisim,kg,date);
        userList.setAdapter(disadpt);
        mCursor.close();
    }

    private void saveData(String gun,String degisim,String kg,String tarih){
        dataBase=mHelper.getWritableDatabase();
        ContentValues values=new ContentValues();

        values.put(Options_KgFollow_SqlLite.DAY,gun);
        values.put(Options_KgFollow_SqlLite.CHANGE,degisim );
        values.put(Options_KgFollow_SqlLite.KG,kg);
        values.put(Options_KgFollow_SqlLite.DATE,tarih );
        System.out.println("");
        dataBase.insert(Options_KgFollow_SqlLite.TABLE_NAME, null, values);
        dataBase.close();



    }

    private void saveDataupdate(String gun,String degisim,String kg,String tarih){
        dataBase=mHelper.getWritableDatabase();
        ContentValues values=new ContentValues();

        values.put(Options_KgFollow_SqlLite.DAY,gun);
        values.put(Options_KgFollow_SqlLite.CHANGE,degisim );
        values.put(Options_KgFollow_SqlLite.KG,kg);
        values.put(Options_KgFollow_SqlLite.DATE,tarih );
        System.out.println("");

        dataBase.update(Options_KgFollow_SqlLite.TABLE_NAME, values, "date='" + tarih+"'", null);

        dataBase.close();



    }
    public String info(Context context){

        Options_Settings_SqlLite info = new Options_Settings_SqlLite(context);
        info.Info();
        String getinfo= info.getBabyname();


        if(!info.getBabyadet().equals("0")){//matematik islemleri icin
            settingsinfo =new Options_Settings_Service();
            settingsinfo.lastadet(info.getBabyadet());
        }else{
            settingsinfo =new Options_Settings_Service();
            settingsinfo.guessbirthday(info.getBabytahmin());

        }
        return settingsinfo.kachaftalik();

    }
    public void deletekg(){

        new FancyGifDialog.Builder(Options_KgFollow.this)
                .setTitle("Kg Verileri Sil")
                .setMessage("Tüm Verileriniz Silinecektir.")
                .setNegativeBtnText("İptal")
                .setPositiveBtnBackground("#95B9C7")
                .setPositiveBtnText("Sil")
                .setNegativeBtnBackground("#FFC0CB")
                .setGifResource(R.drawable.cleangif)   //Pass your Gif here
                .isCancellable(true)
                .OnPositiveClicked(new FancyGifDialogListener() {
                    @Override
                    public void OnClick() {
                        mHelper.delete();
                        intent = new Intent(Options_KgFollow.this, Options.class);
                        startActivity(intent);
                        FileTask.deleteFile("motherkg");
                    }
                })
                .OnNegativeClicked(new FancyGifDialogListener() {
                    @Override
                    public void OnClick() {
                        intent = new Intent(Options_KgFollow.this, Options_KgFollow.class);
                        startActivity(intent);
                    }
                })
                .build();

    }
    public void firstkg(){

        LayoutInflater li = LayoutInflater.from(this);
        View promptsView = li.inflate(R.layout.prompts, null);

        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                this);

        // set prompts.xml to alertdialog builder
        alertDialogBuilder.setView(promptsView);

        final EditText userInput = (EditText) promptsView
                .findViewById(R.id.editTextDialogUserInput);

        // set dialog message
        alertDialogBuilder
                .setCancelable(false)
                .setPositiveButton("KAYDET",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog,int id) {
                                if(userInput.getText().toString().length()>1) {
                                    String kg = enterkg.getText().toString();
                                    String gun = info(getApplicationContext());
                                    Date tarih = new Date();
                                    SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");
                                    String date = bugun.format(tarih);
                                    saveData(gun + ".hafta", "0", userInput.getText().toString(), date);
                                    FileTask.writeData("motherkg", "1");
                                    displayData();
                                }else{

                                    Toast.makeText(getApplicationContext(), "Lütfen kilonuzu giriniz :)",
                                            Toast.LENGTH_LONG).show();
                                    firstkg();
                                }
                            }
                        })
                .setNegativeButton("İPTAL",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog,int id) {
                                intent = new Intent(Options_KgFollow.this, Options.class);
                                startActivity(intent);
                            }
                        });

        // create alert dialog
        AlertDialog alertDialog = alertDialogBuilder.create();

        // show it
        alertDialog.show();

    }
    @Override
    public void onBackPressed()
    {
        if(MainActivity.mainback==true){
            Intent intent = new Intent(Options_KgFollow.this, MainActivity.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }else {
            Intent intent = new Intent(Options_KgFollow.this, Options.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }
    }
}
