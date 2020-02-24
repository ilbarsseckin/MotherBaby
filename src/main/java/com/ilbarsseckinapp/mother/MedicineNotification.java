package com.ilbarsseckinapp.mother;

import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MedicineNotification extends AppCompatActivity {
    @Override
    protected void onCreate (Bundle savedInstanceState) {
        super .onCreate(savedInstanceState) ;
        setContentView(R.layout.medicinenotification ) ;
        TextView  durum =(TextView)findViewById(R.id.durumtxt);
        String currentTime = new SimpleDateFormat("HH:mm", Locale.getDefault()).format(new Date());
        Options_MedicineFollow_SqlLite a = new Options_MedicineFollow_SqlLite(this);
        String data[] = a.gettime(currentTime).split("-");
        if(data[1].equals("AÇ")){
            durum.setText("İLAÇ İÇME ZAMANI,AÇ KARNA İÇMEYİ UNUTMAYIN");
        }else{
            durum.setText("İLAÇ İÇME ZAMANI,TOK KARNA İÇMEYİ UNUTMAYIN");
        }


    }

}