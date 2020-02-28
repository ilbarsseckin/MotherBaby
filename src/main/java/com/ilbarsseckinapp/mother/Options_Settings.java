package com.ilbarsseckinapp.mother;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;
import com.shashank.sony.fancygifdialoglib.FancyGifDialog;
import com.shashank.sony.fancygifdialoglib.FancyGifDialogListener;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Options_Settings extends AppCompatActivity implements View.OnClickListener {
    private EditText babyname;
    private Spinner babysex;
    private Spinner babykin;
    private TextView randombirthday;
    private TextView lastadet;
    private Button savebtn;
    private TextView Tahmin, adet;
    private Button delete;
    private Options_KgFollow_SqlLite dataKg;
    private Options_MedicineFollow_SqlLite datailac;
    private Options_KasilmaSayar_SqlLite datakasilma;
    private Options_TekmeSayar_SqlLite datakasi;
    private Options_Settings_SqlLite datauser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_settings);

        init();
        initData();

        YoYo.with(Techniques.ZoomInDown).playOn(findViewById(R.id.savesetbtn));
    }


    private void init() {
        babyname = (EditText) findViewById(R.id.mybabynametxt);
        babysex = (Spinner) findViewById(R.id.mybabysexspn);
        babykin = (Spinner) findViewById(R.id.mybabykinspn);
        randombirthday = (TextView) findViewById(R.id.mybabybirthdayrandomtxt);
        lastadet = (TextView) findViewById(R.id.myadetdaytxt);
        savebtn = (Button) findViewById(R.id.savesetbtn);
        Tahmin = (TextView) findViewById(R.id.bebektahminbtn);
        adet = (TextView) findViewById(R.id.bebekadetbtn);
        delete = (Button) findViewById(R.id.deletebtn);
        savebtn.setOnClickListener(this);
        randombirthday.setOnClickListener(this);
        lastadet.setOnClickListener(this);
        Tahmin.setOnClickListener(this);
        adet.setOnClickListener(this);
        delete.setOnClickListener(this);
    }


    private void initData() {

        String[] arraySpinner = new String[]{"KIZ", "ERKEK", "BELLİ DEĞİL"};
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.spinner_item , arraySpinner);
        adapter.setDropDownViewResource(R.layout.spinner_item);
        babysex.setAdapter(adapter);

        String[] arraySpinnerkin = new String[]{"ANNE", "BABA", "DAYI", "AMCA", "KARDEŞ", "ABİ", "ABLA"};
        ArrayAdapter<String> adapterkin = new ArrayAdapter<String>(this, R.layout.spinner_item , arraySpinnerkin);
        adapter.setDropDownViewResource(R.layout.spinner_item);
        babykin.setAdapter(adapterkin);


    }


    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.savesetbtn:
                String name = babyname.getText().toString();
                String sex = babysex.getSelectedItem().toString();
                String kin = babykin.getSelectedItem().toString();
                String guess = randombirthday.getText().toString();
                String adet = lastadet.getText().toString();
                if (babyname.getText().length() > 1) {
                    if (babyname.getText().length() < 11) {
                        Options_Settings_SqlLite s = new Options_Settings_SqlLite(this);
                        s.olustur(name, sex, kin, guess, adet);

                        Date tarih = new Date();
                        SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");
                        String today = bugun.format(tarih);

                        //guessbirthday(today,guess);
                        //  lastadet();
                        FileTask.writeData("createuser", "1");
                        Intent i = new Intent(Options_Settings.this, MainActivity.class);
                        startActivity(i);
                        finish();
                    } else {
                        Toast toast = Toast.makeText(getApplicationContext(), "İsim Daha Kısa Olmalı", Toast.LENGTH_SHORT);
                        toast.setMargin(50, 50);
                        toast.show();
                        YoYo.with(Techniques.Flash).playOn(findViewById(R.id.mybabynametxt));
                    }
                } else {
                    YoYo.with(Techniques.Shake).playOn(findViewById(R.id.mybabynametxt));
                }


                break;
            case R.id.mybabybirthdayrandomtxt:
                Calendar calendar = Calendar.getInstance();

                DatePickerDialog datePickerDialog = new DatePickerDialog(this, R.style.DatePickerDialogTheme, new DatePickerDialog.OnDateSetListener() {
                    public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                        Calendar newDate = Calendar.getInstance();
                        newDate.set(year, monthOfYear, dayOfMonth);

                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                        String date = simpleDateFormat.format(newDate.getTime());
                        lastadet.setText("0");
                        randombirthday.setText(date);

                    }
                }, calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH));

                datePickerDialog.show();
                break;

            case R.id.myadetdaytxt:
                Calendar calendaradet = Calendar.getInstance();

                DatePickerDialog datePickerDialogadet = new DatePickerDialog(this, R.style.DatePickerDialogTheme, new DatePickerDialog.OnDateSetListener() {
                    public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                        Calendar newDate = Calendar.getInstance();
                        newDate.set(year, monthOfYear, dayOfMonth);

                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                        String date = simpleDateFormat.format(newDate.getTime());
                        randombirthday.setText("0");
                        lastadet.setText(date);
                    }
                }, calendaradet.get(Calendar.YEAR), calendaradet.get(Calendar.MONTH), calendaradet.get(Calendar.DAY_OF_MONTH));

                datePickerDialogadet.show();
                break;
            case R.id.bebektahminbtn:
                tahmin();
                break;
            case R.id.bebekadetbtn:
                adet();
                break;
            case R.id.deletebtn:
                setDelete();
                break;
        }

    }

    public void setDelete() {
        new FancyGifDialog.Builder(Options_Settings.this)
                .setTitle("Fabrika Ayarları")
                .setMessage("Tüm Verileriniz Silinecektir.")
                .setNegativeBtnText("İptal")
                .setPositiveBtnBackground("#95B9C7")
                .setPositiveBtnText("Sil")
                .setNegativeBtnBackground("#FFE5B4")
                .setGifResource(R.drawable.cleangif)   //Pass your Gif here
                .isCancellable(true)
                .OnPositiveClicked(new FancyGifDialogListener() {
                    @Override
                    public void OnClick() {
                        File data = Environment.getDataDirectory();
                        String currentDBPath = "/data/com.ilbarsseckinapp.mother/databases/" + "MOTHER";
                        File currentDB = new File(data, currentDBPath);
                        SQLiteDatabase.deleteDatabase(currentDB);

                        File data1 = Environment.getDataDirectory();
                        String currentDBPath1 ="/data/com.ilbarsseckinapp.mother/databases/" + "motherdogumcantasi";
                        File currentDB1 = new File(data1, currentDBPath1);
                        SQLiteDatabase.deleteDatabase(currentDB1);

                        File data2 = Environment.getDataDirectory();
                        String currentDBPath2 ="/data/com.ilbarsseckinapp.mother/databases/" + "motherdogumcantasi";
                        File currentDB2 = new File(data2, currentDBPath2);
                        SQLiteDatabase.deleteDatabase(currentDB2);

                        File data3 = Environment.getDataDirectory();
                        String currentDBPath3 ="/data/com.ilbarsseckinapp.mother/databases/" + "mothersagliktesti";
                        File currentDB3 = new File(data3, currentDBPath3);
                        SQLiteDatabase.deleteDatabase(currentDB3);

                        File data4 = Environment.getDataDirectory();
                        String currentDBPath4 ="/data/com.ilbarsseckinapp.mother/databases/" + "motherkasilma";
                        File currentDB4 = new File(data4, currentDBPath4);
                        SQLiteDatabase.deleteDatabase(currentDB4);

                        File data5 = Environment.getDataDirectory();
                        String currentDBPath5 ="/data/com.ilbarsseckinapp.mother/databases/" + "mothertekme";
                        File currentDB5 = new File(data5, currentDBPath5);
                       SQLiteDatabase.deleteDatabase(currentDB5);

                        File data6 = Environment.getDataDirectory();
                        String currentDBPath6 ="/data/com.ilbarsseckinapp.mother/databases/" + "ilactakip";
                        File currentDB6 = new File(data6, currentDBPath6);
                        SQLiteDatabase.deleteDatabase(currentDB6);

                        File data7 = Environment.getDataDirectory();
                        String currentDBPath7 ="/data/com.ilbarsseckinapp.mother/databases/" + "motherkg";
                        File currentDB7 = new File(data7, currentDBPath7);
                        SQLiteDatabase.deleteDatabase(currentDB7);

                        File data8 = Environment.getDataDirectory();
                        String currentDBPath8 ="/data/com.ilbarsseckinapp.mother/databases/" + "motherihtiyac";
                        File currentDB8 = new File(data8, currentDBPath8);
                        SQLiteDatabase.deleteDatabase(currentDB8);

                        FileTask.deleteFile("motherkg");
                        FileTask.deleteFile("createuser");
                        FileTask.deleteFile("babyphoto1");
                        FileTask.deleteFile("babyphoto2");
                        FileTask.deleteFile("babyphoto3");
                        FileTask.deleteFile("babyphoto4");
                        FileTask.deleteFile("babyphoto5");
                        FileTask.deleteFile("babyphoto6");
                        FileTask.deleteFile("babyphoto7");
                        FileTask.deleteFile("babyphoto8");
                        FileTask.deleteFile("createuser");
                        Intent i = new Intent(Options_Settings.this, SplashScreen.class);
                        startActivity(i);
                        finish();
                    }
                })
                .OnNegativeClicked(new FancyGifDialogListener() {
                    @Override
                    public void OnClick() {
                        Intent i = new Intent(Options_Settings.this, Options_Settings.class);
                        startActivity(i);
                        finish();

                    }
                })
                .build();
    }

    public void tahmin() {
        Calendar calendar = Calendar.getInstance();

        DatePickerDialog datePickerDialog = new DatePickerDialog(this, R.style.DatePickerDialogTheme, new DatePickerDialog.OnDateSetListener() {
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                Calendar newDate = Calendar.getInstance();
                newDate.set(year, monthOfYear, dayOfMonth);

                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                String date = simpleDateFormat.format(newDate.getTime());
                lastadet.setText("0");
                randombirthday.setText(date);

            }
        }, calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH));

        datePickerDialog.show();
    }

    public void adet() {
        Calendar calendaradet = Calendar.getInstance();

        DatePickerDialog datePickerDialogadet = new DatePickerDialog(this, R.style.DatePickerDialogTheme, new DatePickerDialog.OnDateSetListener() {
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                Calendar newDate = Calendar.getInstance();
                newDate.set(year, monthOfYear, dayOfMonth);

                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                String date = simpleDateFormat.format(newDate.getTime());
                randombirthday.setText("0");
                lastadet.setText(date);
            }
        }, calendaradet.get(Calendar.YEAR), calendaradet.get(Calendar.MONTH), calendaradet.get(Calendar.DAY_OF_MONTH));

        datePickerDialogadet.show();

    }

    public void guessbirthday(String today, String guess) {
        try {
            //Dates to compare
            String CurrentDate = today;
            String FinalDate = guess;

            Date date1;
            Date date2;

            SimpleDateFormat dates = new SimpleDateFormat("dd/MM/yyyy");

            //Setting dates
            date1 = dates.parse(CurrentDate);
            date2 = dates.parse(FinalDate);

            //Comparing dates
            long difference = Math.abs(date1.getTime() - date2.getTime());
            long differenceDates = difference / (24 * 60 * 60 * 1000);

            //Convert long to String
            String dayDifference = Long.toString(differenceDates);//bugunun tarihi ile tahmini dogum gununun farkı --bebegın dogumuna kalan sure
            int gecmis = 280 - Integer.valueOf(dayDifference);
            int hafta = gecmis / 7;
            int gun = gecmis % 7;
            Log.e("HERE", "HERE: " + dayDifference);//doguma kalan sure
            Log.e("HEREhafta", "HERE: " + hafta); //kac haftalık
            Log.e("HEREgun", "HERE: " + gun); // kac gunluk


        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }

    }

    public void lastadet() {
        try {
            String dt = lastadet.getText().toString();  // Start date
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Calendar c = Calendar.getInstance();
            try {
                c.setTime(sdf.parse(dt));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            c.add(Calendar.DAY_OF_MONTH, 280);  // number of days to add, can also use Calendar.DAY_OF_MONTH in place of Calendar.DATE
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
            String output = sdf1.format(c.getTime());
            diffday(output);

            Log.e("SEVDIM", output);

        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }

    }

    public void diffday(String day) {
        Date tarih = new Date();
        SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");
        String today = bugun.format(tarih);
        try {
            //Dates to compare
            String CurrentDate = today;
            String FinalDate = day;

            Date date1;
            Date date2;

            SimpleDateFormat dates = new SimpleDateFormat("dd/MM/yyyy");

            //Setting dates
            date1 = dates.parse(CurrentDate);
            date2 = dates.parse(FinalDate);

            //Comparing dates
            long difference = Math.abs(date1.getTime() - date2.getTime());
            long differenceDates = difference / (24 * 60 * 60 * 1000);

            //Convert long to String
            String dayDifference = Long.toString(differenceDates);//bugunun tarihi ile tahmini dogum gununun farkı --bebegın dogumuna kalan sure
            int gecmis = 280 - Integer.valueOf(dayDifference);
            int hafta = gecmis / 7;
            int gun = gecmis % 7;
            Log.e("HERE", "HERE: " + dayDifference);//doguma kalan sure
            Log.e("HEREhafta", "HERE: " + hafta); //kac haftalık
            Log.e("HEREgun", "HERE: " + gun); // kac gunluk


        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }
    }

    @Override
    public void onBackPressed() {
        if (MainActivity.mainback == true) {
            Intent intent = new Intent(Options_Settings.this, MainActivity.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        } else {
            Intent intent = new Intent(Options_Settings.this, Options.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }
    }
}
