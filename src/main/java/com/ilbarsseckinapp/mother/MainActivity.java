package com.ilbarsseckinapp.mother;

import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.VideoView;

import androidx.appcompat.app.AppCompatActivity;

import com.github.clans.fab.FloatingActionMenu;
import com.github.clans.fab.FloatingActionButton;
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
private VideoView view;
private  Options_Settings_Service settingsinfo;
private TextView artikgun;
    FloatingActionMenu materialDesignFAM;
    FloatingActionButton floatingActionButton1, floatingActionButton2, floatingActionButton3,floatingActionButton4;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.test);


        materialDesignFAM = (FloatingActionMenu) findViewById(R.id.material_design_android_floating_action_menu);
        floatingActionButton1 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item1);
        floatingActionButton2 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item2);
        floatingActionButton3 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item3);
        floatingActionButton4= (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item4);
        floatingActionButton1.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                //TODO something when floating action menu first item clicked

            }
        });
        floatingActionButton2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                //TODO something when floating action menu second item clicked

            }
        });
        floatingActionButton3.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                //TODO something when floating action menu third item clicked

            }
        });
        floatingActionButton4.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                //TODO something when floating action menu third item clicked

            }
        });
        BabyDay=(TextView) findViewById(R.id.BabyDaytxt);
        PregnancyDay=(TextView) findViewById(R.id.PregnancyDaytxt);
        BirthDay=(TextView)findViewById(R.id.BirthDaytxt);
        Dimensions=(TextView) findViewById(R.id.Dimensionstxt);
        info=(TextView)findViewById(R.id.MainInfoTxt);
        artikgun=(TextView)findViewById(R.id.artikguntxt);

        Baby=(Button)findViewById(R.id.MyBabyBtn);
        Mother=(Button) findViewById(R.id.MotherBtn);

        view = (VideoView)findViewById(R.id.Main_videoView);

        Baby.setOnClickListener(this);
        Mother.setOnClickListener(this);



        info(this);
        maininfo("baby");
        Baby.setTextColor(getResources().getColor(R.color.Basket_Ball_Orange));
        Mother.setTextColor(getResources().getColor(R.color.Beetle_Green));

        if(settingsinfo.kachaftalik().equals("0")){
          firstweekvideo();
          Dimensions.setText("-");
        }
        if(settingsinfo.kachaftalik().equals("1")){
            Dimensions.setText("-");
        }
        if(settingsinfo.kachaftalik().equals("2")){

            Dimensions.setText("-");
        }
        if(settingsinfo.kachaftalik().equals("3")){
            firstweekvideo();
            Dimensions.setText("-");
        }
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
        Baby.setTextColor(getResources().getColor(R.color.Basket_Ball_Orange));
        Mother.setTextColor(getResources().getColor(R.color.Beetle_Green));
        maininfo("baby");

    }

    private void  Mother(){
        maininfo("mother");
        Mother.setTextColor(getResources().getColor(R.color.Basket_Ball_Orange));
        Baby.setTextColor(getResources().getColor(R.color.Beetle_Green));
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
    BabyDay.setText(settingsinfo.dogumagecensure());
    PregnancyDay.setText(settingsinfo.kachaftalik()+".");
    artikgun.setText(settingsinfo.artikgun()+".");
    BirthDay.setText(settingsinfo.dogumakalansure());

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
    private void maininfo(String data){
        DatabaseReference rootRef = FirebaseDatabase.getInstance().getReference();
        DatabaseReference newRef = rootRef.child(data);
        ValueEventListener valueEventListener = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {

                Log.e("ammmm", String.valueOf(dataSnapshot.child(settingsinfo.dogumagecensure()+"-").getValue(String.class)));

                info.setText(String.valueOf(dataSnapshot.child(settingsinfo.dogumagecensure()+"-").getValue(String.class)));
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        };
        newRef.addListenerForSingleValueEvent(valueEventListener);

    }
    public void firstweekvideo(){
        String path = "android.resource://" + getPackageName() + "/" + R.raw.firstweek;
        view.setVideoURI(Uri.parse(path));
        view.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
            @Override
            public void onPrepared(MediaPlayer mp) {
                view.start();
                mp.setLooping(true);
            }
        });
        view.setOnPreparedListener(PreparedListener);
        view.requestFocus();
    }


    MediaPlayer.OnPreparedListener PreparedListener = new MediaPlayer.OnPreparedListener(){

        @Override
        public void onPrepared(MediaPlayer m) {
            try {
          //      m.setVolume(0f, 0f);
                view.start();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    };
}
