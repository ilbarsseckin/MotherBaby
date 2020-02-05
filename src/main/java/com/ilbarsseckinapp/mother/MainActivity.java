package com.ilbarsseckinapp.mother;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
private Button Baby,Mother;
private TextView BabyDay,PregnancyDay,BirthDay,Dimensions;
private TextView info;
private Intent intent;
private  Options_Settings_Service settingsinfo;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().setTitle("ELİS (DAYI)");

        //seckin

        BabyDay=(TextView) findViewById(R.id.BabyDaytxt);
        PregnancyDay=(TextView) findViewById(R.id.PregnancyDaytxt);
        BirthDay=(TextView)findViewById(R.id.BirthDaytxt);
        Dimensions=(TextView) findViewById(R.id.Dimensionstxt);
        info=(TextView)findViewById(R.id.MainInfoTxt);

        Baby=(Button)findViewById(R.id.MyBabyBtn);
        Mother=(Button) findViewById(R.id.MotherBtn);


        Baby.setOnClickListener(this);
        Mother.setOnClickListener(this);


        info(this);

        DatabaseReference rootRef = FirebaseDatabase.getInstance().getReference();
        DatabaseReference newRef = rootRef.child("baby");
        ValueEventListener valueEventListener = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {

                    Log.e("ammmm", String.valueOf(dataSnapshot.child("1-").getValue(String.class)));

                info.setText(String.valueOf(dataSnapshot.child("1-").getValue(String.class)));
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        };
        newRef.addListenerForSingleValueEvent(valueEventListener);


    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.MyBabyBtn:
                Mybaby();
                break;
            case R.id.MotherBtn:
                Mother();
                break;


        }
    }

    private void  Mybaby(){


    }

    private void  Mother(){


    }
    private void  MainMenu(){


    }
    private void  Options(){
     intent = new Intent(MainActivity.this, Options.class);
     startActivity(intent);
     this.finish();
    }

    public void info(Context context){

    Options_Settings_SqlLite info = new Options_Settings_SqlLite(context);
    info.Info();
    String getinfo= info.getBabyname();
    getSupportActionBar().setTitle(getinfo +"-"+info.getBabyakraba());


    if(!info.getBabyadet().equals("0")){//matematik islemleri icin
        settingsinfo =new Options_Settings_Service();
        settingsinfo.lastadet(info.getBabyadet());
    }else{
        settingsinfo =new Options_Settings_Service();
        settingsinfo.guessbirthday(info.getBabytahmin());

    }
    BabyDay.setText(settingsinfo.dogumagecensure()+" günlük");
    PregnancyDay.setText(settingsinfo.kachaftalik()+" haftalık"+" "+settingsinfo.artikgun()+" gün");
    BirthDay.setText(settingsinfo.dogumakalansure()+" gün kaldı");
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // R.menu.mymenu is a reference to an xml file named mymenu.xml which should be inside your res/menu directory.
        // If you don't have res/menu, just create a directory named "menu" inside res
        getMenuInflater().inflate(R.menu.actionmenu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    // handle button activities
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.mybutton) {
            Options();
            // do something here
        }
        return super.onOptionsItemSelected(item);
    }
}
