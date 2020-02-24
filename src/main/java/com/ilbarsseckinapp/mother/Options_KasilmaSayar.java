package com.ilbarsseckinapp.mother;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.SystemClock;
import android.os.Vibrator;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.Chronometer;
import android.widget.ListView;

import androidx.appcompat.widget.Toolbar;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * activity to display all records from SQLite database
 *
 * @author ketan(Visit my < a
 *href = " http : / / androidsolution4u.blogspot.in / " > blog < / a >)
 */
public class Options_KasilmaSayar extends Activity implements View.OnClickListener {

    private SQLiteDatabase dataBase;
    private ArrayList<String> Id = new ArrayList<String>();
    private ArrayList<String> date = new ArrayList<String>();
    private ArrayList<String> timer = new ArrayList<String>();
    Options_Settings_Service settingsinfo;
    private Chronometer mChronometer;
    private Button mButtonStart;
    private Options_KasilmaSayar_SqlLite mHelper;
    private ListView kasilmalist;
    private Intent intent;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_kasilmasayar);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar3);
        toolbar.setTitle("Kasilma Sayar");

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        initView();


        kasilmalist = (ListView) findViewById(R.id.kasilmalist);
        mHelper = new Options_KasilmaSayar_SqlLite(this);

        kasilmalist.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> arg0, View arg1,
                                           int pos, long id) {
                // TODO Auto-generated method stub
                Log.e("turna", Id.get(pos));
                mHelper.delete(Id.get(pos));
                displayData();
                return true;
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
                + Options_KasilmaSayar_SqlLite.TABLE_NAME +" ORDER BY id DESC", null);

        Id.clear();
        date.clear();
        timer.clear();

        if (mCursor.moveToFirst()) {
            do {
                Id.add(mCursor.getString(mCursor.getColumnIndex(Options_KasilmaSayar_SqlLite.ID)));
                date.add(mCursor.getString(mCursor.getColumnIndex(Options_KasilmaSayar_SqlLite.DATE)));
                timer.add(mCursor.getString(mCursor.getColumnIndex(Options_KasilmaSayar_SqlLite.TIMER)));


            } while (mCursor.moveToNext());
        }
        Options_DisplayAdapter_KasilmaSayar disadpt = new Options_DisplayAdapter_KasilmaSayar(this, Id, date, timer);
        kasilmalist.setAdapter(disadpt);
        mCursor.close();
    }

    private void saveData(String tarih, String time) {
        dataBase = mHelper.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(Options_KasilmaSayar_SqlLite.DATE, tarih);
        values.put(Options_KasilmaSayar_SqlLite.TIMER, time);
        dataBase.insert(Options_KasilmaSayar_SqlLite.TABLE_NAME, null, values);
        dataBase.close();


    }

    private void saveDataupdate(String gun, String degisim, String kg, String tarih) {
        dataBase = mHelper.getWritableDatabase();
        ContentValues values = new ContentValues();

        values.put(Options_KasilmaSayar_SqlLite.DATE, tarih);
        values.put(Options_KasilmaSayar_SqlLite.TIMER, gun);
        System.out.println("");

        dataBase.update(Options_KasilmaSayar_SqlLite.TABLE_NAME, values, "date='" + tarih + "'", null);

        dataBase.close();


    }

    public String info(Context context) {

        Options_Settings_SqlLite info = new Options_Settings_SqlLite(context);
        info.Info();
        String getinfo = info.getBabyname();


        if (!info.getBabyadet().equals("0")) {//matematik islemleri icin
            settingsinfo = new Options_Settings_Service();
            settingsinfo.lastadet(info.getBabyadet());
        } else {
            settingsinfo = new Options_Settings_Service();
            settingsinfo.guessbirthday(info.getBabytahmin());

        }
        return settingsinfo.dogumagecensure();

    }


    private void initView() {
        mChronometer = (Chronometer) findViewById(R.id.chronometer);
        mButtonStart = (Button) findViewById(R.id.buttonStart);
        mButtonStart.setOnClickListener(this);
        mButtonStart.setText("BAŞLAT");

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            default:
                break;

            case R.id.buttonStart:
                if (mButtonStart.getText().toString().equals("DURDUR")) {
                    Date curDate = new Date();
                    SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
                    String DateToStr = format.format(curDate);
                    long time = SystemClock.elapsedRealtime() - mChronometer.getBase();
                    int h = (int) (time / 3600000);
                    int m = (int) (time - h * 3600000) / 60000;
                    int s = (int) (time - h * 3600000 - m * 60000) / 1000;
                    String hh = h < 10 ? "0" + h : h + "";
                    String mm = m < 10 ? "0" + m : m + "";
                    String ss = s < 10 ? "0" + s : s + "";
                    String kronometre = mm + ":" + ss;
                    saveData(DateToStr, kronometre);
                    mButtonStart.setText("BAŞLAT");
                    stopChronometer();
                    restartChronometer();
                    displayData();
                    vibrate();
                    break;
                }
                if (mButtonStart.getText().toString().equals("BAŞLAT")) {
                    mButtonStart.setText("DURDUR");
                    startChronometer();
                    vibrate();
                    break;
                }

                break;


        }
    }
    public void vibrate ()
    {
        Vibrator vv = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);
        vv.vibrate(100);
    }
    private void startChronometer() {
        mChronometer.setBase(SystemClock.elapsedRealtime());
        mChronometer.start();
    }

    private void stopChronometer() {
        mChronometer.stop();
    }

    private void restartChronometer() {
        mChronometer.setBase(SystemClock.elapsedRealtime());
    }

    private void setFormatChronometer() {
        mChronometer.setFormat("Formated Time - %s");
    }

    private void clearFormatChronometer() {
        mChronometer.setFormat(null);
    }


    private void defaultTimeChronometer() {
        mChronometer.setBase(SystemClock.elapsedRealtime());

        /* if you want to start at another time, you have to subtract the time you want in milliseconds.
            For example, you want to start your Chronometer at 2 min and 10 seconds:*/
        mChronometer.setBase(SystemClock.elapsedRealtime() - (2 * 60000 + 10 * 1000));
        mChronometer.start();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onBackPressed() {
        if(MainActivity.mainback==true){
            Intent intent = new Intent(Options_KasilmaSayar.this, MainActivity.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }else {
            Intent intent = new Intent(Options_KasilmaSayar.this, Options.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }
    }

}
