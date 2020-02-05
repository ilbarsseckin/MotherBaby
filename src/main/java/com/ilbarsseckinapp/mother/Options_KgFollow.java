package com.ilbarsseckinapp.mother;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ListView;
import android.widget.TextView;

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
    private static Boolean on;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_kgfollow);

        userList = (ListView) findViewById(R.id.List);
        enterkg=(TextView)findViewById(R.id.enterkgtxt);
        mHelper = new Options_KgFollow_SqlLite(this);

        //add new record
        findViewById(R.id.btnAdd).setOnClickListener(new OnClickListener() {

            public void onClick(View v) {

            /*    Intent i = new Intent(getApplicationContext(),
                        AddActivity.class);
                i.putExtra("update", false);
                startActivity(i)*/;
                Date tarih = new Date();
                SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");

                String gun=info(getApplicationContext());
                String date =bugun.format(tarih);
                String kg =enterkg.getText().toString();
                dataBase=mHelper.getWritableDatabase();
                ContentValues values=new ContentValues();

                String difdate= String.valueOf(mHelper.Info(date));
                Log.e("sonra", String.valueOf(difdate.length()));
                mHelper.InfoOrder();
                int girilen=Integer.valueOf(kg);
                int oncekikg=Integer.valueOf(mHelper.orderkg());
                int sonuc=girilen-oncekikg;
                if(difdate.length()>2){//bugunun tarihi daha önce ekli guncelle
                 saveDataupdate(gun, String.valueOf(sonuc),kg,date);
                }else{
                  saveData(gun, String.valueOf(sonuc),kg,date);
                }
                displayData();

            }
        });

/*        //click to update data
        userList.setOnItemClickListener(new OnItemClickListener() {

            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
                                    long arg3) {

                Intent i = new Intent(getApplicationContext(),
                        AddActivity.class);
                i.putExtra("Fname", user_fName.get(arg2));
                i.putExtra("Lname", user_lName.get(arg2));
                i.putExtra("ID", userId.get(arg2));
                i.putExtra("update", true);
                startActivity(i);

            }
        });*/

        //long click to delete data
  /*      userList.setOnItemLongClickListener(new OnItemLongClickListener() {

            public boolean onItemLongClick(AdapterView<?> arg0, View arg1,
                                           final int arg2, long arg3) {

                build = new AlertDialog.Builder(getApplicationContext());
                build.setTitle("Delete " + user_fName.get(arg2) + " "
                        + user_lName.get(arg2));
                build.setMessage("Do you want to delete ?");
                build.setPositiveButton("Yes",
                        new DialogInterface.OnClickListener() {

                            public void onClick(DialogInterface dialog,
                                                int which) {

                                Toast.makeText(
                                        getApplicationContext(),
                                        user_fName.get(arg2) + " "
                                                + user_lName.get(arg2)
                                                + " is deleted.", 3000).show();

                                dataBase.delete(
                                        Options_DbHelper.TABLE_NAME,
                                        Options_DbHelper.ID + "="
                                                + userId.get(arg2), null);
                                displayData();
                                dialog.cancel();
                            }
                        });

                build.setNegativeButton("No",
                        new DialogInterface.OnClickListener() {

                            public void onClick(DialogInterface dialog,
                                                int which) {
                                dialog.cancel();
                            }
                        });
                AlertDialog alert = build.create();
                alert.show();

                return true;
            }
        });*/
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
                + Options_KgFollow_SqlLite.TABLE_NAME, null);

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


    /*    if(on)
        {
            Log.e("yenisi",tarih);
            //update database with new data

            dataBase.update(Options_DbHelper.TABLE_NAME, values, Options_DbHelper.DATE+"="+tarih, null);
        }
        else
        {
            Log.e("suskun",tarih);
            //insert data into database
            dataBase.insert(Options_DbHelper.TABLE_NAME, null, values);
        }*/
        //close database
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
        return settingsinfo.dogumagecensure();

    }
}
