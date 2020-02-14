package com.ilbarsseckinapp.mother;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.app.TimePickerDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;

import java.util.ArrayList;
import java.util.Calendar;


public class Options_MedicinaFollow extends Activity implements OnClickListener {

    private Options_MedicineFollow_SqlLite mHelper;
    private SQLiteDatabase dataBase;

    private ArrayList<String> userId = new ArrayList<String>();
    private ArrayList<String> name = new ArrayList<String>();
    private ArrayList<String> time = new ArrayList<String>();
    private ArrayList<String> actok = new ArrayList<String>();
    private ArrayList<String> durum = new ArrayList<String>();
    private ListView userList;
    private AlertDialog.Builder build;
    Options_Settings_Service settingsinfo;
    private EditText entermedicanename;
    private TextView entertime;
    private static Boolean on;
    private Button addbtn;
    private Spinner infoactok;
    private Spinner infodurum;
    private static String selectid = "";
    private static Button update;
    private static Button clear;
    AlarmManager alarmManager;
    private PendingIntent pendingIntent;
    private TimePicker alarmTimePicker;
    private static AlarmActivity inst;
    private TextView alarmTextView;
    private static Boolean status = false;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_medicinafollow);
        alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);
        userList = (ListView) findViewById(R.id.List);
        entermedicanename = (EditText) findViewById(R.id.edtName);

        mHelper = new Options_MedicineFollow_SqlLite(this);
        entertime = (TextView) findViewById(R.id.addtime);
        entertime.setOnClickListener(this);

        addbtn = (Button) findViewById(R.id.BtnSave);
        addbtn.setOnClickListener(this);

        update = (Button) findViewById(R.id.updatebtn);
        update.setOnClickListener(this);

        clear = (Button) findViewById(R.id.clearbtn);
        clear.setOnClickListener(this);


        infoactok = (Spinner) findViewById(R.id.actokswitch);
        infodurum = (Spinner) findViewById(R.id.switchdurum);


        String[] arraySpinner = new String[]{"AÇ", "TOK", "FARK ETMEZ"};
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, arraySpinner);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        infoactok.setAdapter(adapter);

        String[] arraySpinnerkin = new String[]{"AÇIK", "KAPALI"};
        ArrayAdapter<String> adapterkin = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, arraySpinnerkin);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        infodurum.setAdapter(adapterkin);

        userList.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> arg0, View view, int position, long arg3) {


                Log.e("lanhiyaro", userId.get(position));
                selectid = userId.get(position);
                entermedicanename.setText(name.get(position));
                entertime.setText(time.get(position));
                infoactok.setPrompt(actok.get(position));
                infodurum.setPrompt(durum.get(position));
            }

        });
        userList.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> arg0, View arg1,
                                           int pos, long id) {
                // TODO Auto-generated method stub
                Log.e("turna",  userId.get(pos));
                mHelper.delete(userId.get(pos));
                displayData();
                return true;
            }
        });

        infodurum.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView adapter, View v, int i, long lng) {

                String selecteditem = adapter.getItemAtPosition(i).toString();
                if (selecteditem.equals("AÇIK")) {
                    status = true;

                } else {
                    status = false;

                }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parentView) {

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
                + Options_MedicineFollow_SqlLite.TABLE_NAME, null);

        userId.clear();
        name.clear();
        time.clear();
        actok.clear();
        durum.clear();
        if (mCursor.moveToFirst()) {
            do {
                userId.add(mCursor.getString(mCursor.getColumnIndex(Options_MedicineFollow_SqlLite.ID)));
                name.add(mCursor.getString(mCursor.getColumnIndex(Options_MedicineFollow_SqlLite.NAME)));
                time.add(mCursor.getString(mCursor.getColumnIndex(Options_MedicineFollow_SqlLite.TIME)));
                actok.add(mCursor.getString(mCursor.getColumnIndex(Options_MedicineFollow_SqlLite.ACTOK)));
                durum.add(mCursor.getString(mCursor.getColumnIndex(Options_MedicineFollow_SqlLite.DURUM)));

            } while (mCursor.moveToNext());
        }
        Options_DisplayAdapter_Medicane disadpt = new Options_DisplayAdapter_Medicane(this, userId, name, time, actok, durum);
        userList.setAdapter(disadpt);
        mCursor.close();

    }

    private void saveData(String name, String time, String actok, String durum) {
        dataBase = mHelper.getWritableDatabase();
        ContentValues values = new ContentValues();

        values.put(Options_MedicineFollow_SqlLite.NAME, name);
        values.put(Options_MedicineFollow_SqlLite.TIME, time);
        values.put(Options_MedicineFollow_SqlLite.ACTOK, actok);
        values.put(Options_MedicineFollow_SqlLite.DURUM, durum);
        dataBase.insert(Options_MedicineFollow_SqlLite.TABLE_NAME, null, values);
        dataBase.close();


    }

    private void saveDataupdate(String id, String name, String time, String actok, String durum) {
        dataBase = mHelper.getWritableDatabase();
        ContentValues values = new ContentValues();

        values.put(Options_MedicineFollow_SqlLite.NAME, name);
        values.put(Options_MedicineFollow_SqlLite.TIME, time);
        values.put(Options_MedicineFollow_SqlLite.ACTOK, actok);
        values.put(Options_MedicineFollow_SqlLite.DURUM, durum);
        System.out.println("");

        dataBase.update(Options_MedicineFollow_SqlLite.TABLE_NAME, values, "id='" + id + "'", null);

        dataBase.close();


    }


    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.addtime:
                final Calendar takvim = Calendar.getInstance();
                int saat = takvim.get(Calendar.HOUR_OF_DAY);
                int dakika = takvim.get(Calendar.MINUTE);

                TimePickerDialog tpd = new TimePickerDialog(this,
                        new TimePickerDialog.OnTimeSetListener() {
                            @Override
                            public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
                                // hourOfDay ve minute değerleri seçilen saat değerleridir.
                                // Edittextte bu değerleri gösteriyoruz.
                                entertime.setText(hourOfDay + ":" + minute);
                            }
                        }, saat, dakika, true);

                tpd.setButton(TimePickerDialog.BUTTON_POSITIVE, "Seç", tpd);
                tpd.setButton(TimePickerDialog.BUTTON_NEGATIVE, "İptal", tpd);
                tpd.show();

                break;

            case R.id.BtnSave:
                int a = mHelper.IDLastCount();
                setAlarm(a++);
                displayData();
                break;

            case R.id.updatebtn:
                Log.e("isaret", selectid);
                updateAlarm(Integer.parseInt(selectid));
                break;

            case R.id.clearbtn:
                entermedicanename.setText("");
                displayData();
                break;
        }
    }


    @Override
    public void onBackPressed() {
        Intent intent = new Intent(Options_MedicinaFollow.this, Options.class);
        startActivity(intent);
        this.finish();
        super.onBackPressed();
    }
    private void setAlarm1(int RSQ) {

            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt("11"));
            calendar.set(Calendar.MINUTE, Integer.parseInt("57"));
            Intent myIntent = new Intent(Options_MedicinaFollow.this, AlarmBroadcast.class);
            pendingIntent = PendingIntent.getBroadcast(Options_MedicinaFollow.this, RSQ, myIntent, 0);
            alarmManager.set(AlarmManager.RTC, calendar.getTimeInMillis(), pendingIntent);



    }
    private void setAlarm2(int RSQ) {


            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt("11"));
            calendar.set(Calendar.MINUTE, Integer.parseInt("58"));
            Intent myIntent = new Intent(Options_MedicinaFollow.this, AlarmBroadcast.class);
            pendingIntent = PendingIntent.getBroadcast(Options_MedicinaFollow.this, RSQ, myIntent, 0);
            alarmManager.set(AlarmManager.RTC, calendar.getTimeInMillis(), pendingIntent);


    }
    private void setAlarm(int RSQ) {
        String ilacadi = entermedicanename.getText().toString();
        String zaman = entertime.getText().toString();
        String actok = infoactok.getSelectedItem().toString();
        String alarmdurumu = infodurum.getSelectedItem().toString();
        saveData(ilacadi, zaman, actok, alarmdurumu);
        String hour = "";
        String minute = "";
        Log.e("zaman", zaman);
        String h[] = zaman.split(":");
        if (h[0].length() == 1) hour = "0" + h[0];
        else {
            hour = h[0];
        }
        if (h[1].length() == 1) minute = "0" + h[1];
        else {
            minute = h[1];
        }
        if (status) {
            Calendar calendar = Calendar.getInstance();

            Log.e("lanh", hour);
            Log.e("lanm", minute);
            calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(hour));
            calendar.set(Calendar.MINUTE, Integer.parseInt(minute));
            Intent myIntent = new Intent(Options_MedicinaFollow.this, AlarmBroadcast.class);
            pendingIntent = PendingIntent.getBroadcast(Options_MedicinaFollow.this, RSQ, myIntent, 0);
            alarmManager.set(AlarmManager.RTC, calendar.getTimeInMillis(), pendingIntent);

        } else {
            cancelAlarm(Integer.parseInt(selectid));
        }

        displayData();

    }
    private void updateAlarm(int RSQ,int h,int m) {

            Log.e("deli4", String.valueOf(h));
            Log.e("deli5", String.valueOf(m));
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, h);
            calendar.set(Calendar.MINUTE, m);
            Intent myIntent = new Intent(Options_MedicinaFollow.this, AlarmBroadcast.class);
            pendingIntent = PendingIntent.getBroadcast(Options_MedicinaFollow.this, RSQ, myIntent, 0);
            alarmManager.set(AlarmManager.RTC, calendar.getTimeInMillis(), pendingIntent);
            Log.e("deli", String.valueOf(RSQ));
            Log.e("deli2", String.valueOf(calendar.getTimeInMillis()));


    }
    private void updateAlarm(int RSQ) {
        String id = selectid;
        String ilacadii = entermedicanename.getText().toString();
        String zamani = entertime.getText().toString();
        String actoki = infoactok.getSelectedItem().toString();
        String alarmdurumui = infodurum.getSelectedItem().toString();
        saveDataupdate(id, ilacadii, zamani, actoki, alarmdurumui);
        String houru = "";
        String minuteu = "";
        String hu[] = zamani.split(":");
        if (hu[0].length() == 1) houru = "0" + hu[0];
        else {
            houru = hu[0];
        }
        if (hu[1].length() == 1) minuteu = "0" + hu[1];
        else {
            minuteu = hu[1];
        }
        if (status) {
            Log.e("deli4", String.valueOf(houru));
            Log.e("deli5", String.valueOf(minuteu));
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(houru));
            calendar.set(Calendar.MINUTE, Integer.parseInt(minuteu));
            Intent myIntent = new Intent(Options_MedicinaFollow.this, AlarmBroadcast.class);
            pendingIntent = PendingIntent.getBroadcast(Options_MedicinaFollow.this, RSQ, myIntent, 0);
            alarmManager.set(AlarmManager.RTC, calendar.getTimeInMillis(), pendingIntent);
            Log.e("deli", String.valueOf(RSQ));
            Log.e("deli2", String.valueOf(calendar.getTimeInMillis()));
        } else {
            cancelAlarm(Integer.parseInt(selectid));
            Log.d("MyActivity", "Alarm Off");
        }
        displayData();

    }

    private void cancelAlarm(int RSQ) {

        Intent intent = new Intent(getBaseContext(), AlarmBroadcast.class);
        PendingIntent pendingIntent = PendingIntent.getBroadcast(getBaseContext(), RSQ, intent, 0);
        AlarmManager alarmManager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
        alarmManager.cancel(pendingIntent);
    }
}
