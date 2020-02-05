package com.ilbarsseckinapp.mother;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

import androidx.annotation.Nullable;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Options_Settings_Service {

private String kalansure="";
private String gecensure="";
private String gecenhafta="";
private String artikgun;

    public void guessbirthday(String guess){
        Date tarih = new Date();
        SimpleDateFormat bugun = new SimpleDateFormat("dd/MM/yyyy");
        String today =bugun.format(tarih);
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
            int gecmis =280-Integer.valueOf(dayDifference);//gecen sure
            int hafta =gecmis/7;
            int gun =gecmis%7;
            Log.e("HERE","HERE: " + dayDifference);//doguma kalan sure
            Log.e("HEREhafta","HERE: " + hafta); //kac haftalık
            Log.e("HEREgun","HERE: " + gun); // kac gunluk
            kalansure=dayDifference;
            gecenhafta= String.valueOf(hafta);
            artikgun= String.valueOf(gun);
            gecensure= String.valueOf(gecmis);

        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }

    }

    public void lastadet(String lastadet){
        try {
            String dt = lastadet;  // Start date
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

            kalansure=dayDifference;
            gecenhafta= String.valueOf(hafta);
            artikgun= String.valueOf(gun);
            gecensure= String.valueOf(gecmis);
        } catch (Exception exception) {
            Log.e("DIDN'T WORK", "exception " + exception);
        }
    }

    public String dogumakalansure(){ return kalansure;}
    public String dogumagecensure(){ return  gecensure;}
    public String kachaftalik(){ return gecenhafta;}
    public String artikgun(){ return artikgun;}
}
