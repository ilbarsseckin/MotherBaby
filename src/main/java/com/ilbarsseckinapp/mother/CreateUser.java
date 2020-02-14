package com.ilbarsseckinapp.mother;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CreateUser extends AppCompatActivity implements View.OnClickListener {
    private EditText babyname;
    private Spinner babysex;
    private Spinner babykin;
    private TextView randombirthday;
    private TextView lastadet;
    private Button savebtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.createuser);

        init();
        initData();

    }

    private void init(){
        babyname=(EditText) findViewById(R.id.mybabynametxt);
        babysex=(Spinner)findViewById(R.id.mybabysexspn);
        babykin=(Spinner)findViewById(R.id.mybabykinspn);
        randombirthday=(TextView)findViewById(R.id.mybabybirthdayrandomtxt);
        lastadet=(TextView)findViewById(R.id.myadetdaytxt);
        savebtn=(Button)findViewById(R.id.savesetbtn);
        savebtn.setOnClickListener(this);
        randombirthday.setOnClickListener(this);
        lastadet.setOnClickListener(this);
    }


    private void  initData(){

        String[] arraySpinner = new String[] {"KIZ", "ERKEK", "BELLİ DEĞİL"};
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, arraySpinner);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        babysex.setAdapter(adapter);

        String[] arraySpinnerkin = new String[] {"ANNE","BABA","DAYI","AMCA","KARDEŞ","ABİ","ABLA"};
        ArrayAdapter<String> adapterkin = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, arraySpinnerkin);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        babykin.setAdapter(adapterkin);


    }



    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.savesetbtn:
                String name =babyname.getText().toString();
                String sex =babysex.getSelectedItem().toString();
                String kin =babykin.getSelectedItem().toString();
                String guess=randombirthday.getText().toString();
                String adet=lastadet.getText().toString();
                Options_Settings_SqlLite  s = new Options_Settings_SqlLite(this);
                s.olustur(name,sex,kin,guess,adet);

                Date tarih = new Date();
                SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");
                String today =bugun.format(tarih);

                //guessbirthday(today,guess);
                //  lastadet();
                FileTask.writeData("createuser","1");
                Intent i = new Intent(CreateUser.this, MainActivity.class);
                startActivity(i);
                finish();
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

        }
    }

    public void guessbirthday(String today,String guess){
        try {
            //Dates to compare
            String CurrentDate=today;
            String FinalDate=  guess;

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
            int gecmis =280-Integer.valueOf(dayDifference);
            int hafta =gecmis/7;
            int gun =gecmis%7;
            Log.e("HERE","HERE: " + dayDifference);//doguma kalan sure
            Log.e("HEREhafta","HERE: " + hafta); //kac haftalık
            Log.e("HEREgun","HERE: " + gun); // kac gunluk


        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }

    }

    public void lastadet(){
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

            Log.e("SEVDIM",  output);

        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }

    }

    public void diffday(String day){
        Date tarih = new Date();
        SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");
        String today =bugun.format(tarih);
        try {
            //Dates to compare
            String CurrentDate=today;
            String FinalDate=  day;

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
            int gecmis =280-Integer.valueOf(dayDifference);
            int hafta =gecmis/7;
            int gun =gecmis%7;
            Log.e("HERE","HERE: " + dayDifference);//doguma kalan sure
            Log.e("HEREhafta","HERE: " + hafta); //kac haftalık
            Log.e("HEREgun","HERE: " + gun); // kac gunluk


        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }
    }
}
