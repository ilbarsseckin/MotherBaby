package com.ilbarsseckinapp.mother;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Vibrator;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.ToggleButton;

import androidx.appcompat.widget.Toolbar;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.Objects;
import java.util.Random;

public class Options_RandomName extends Activity{
    //  Button rotate;
    ImageView i;
    TextView randomname;
    TextView nameplain;
    ToggleButton boygirl;
    private String status="GirlName";
    private SensorManager mSensorManager;
    private float mAccel;
    private float mAccelCurrent;
    private float mAccelLast;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_randomname);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar3);
        toolbar.setTitle("Bebeğimin İsmi");
        mSensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        Objects.requireNonNull(mSensorManager).registerListener(mSensorListener, mSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER),
                SensorManager.SENSOR_DELAY_NORMAL);
        mAccel = 10f;
        mAccelCurrent = SensorManager.GRAVITY_EARTH;
        mAccelLast = SensorManager.GRAVITY_EARTH;
        i= (ImageView) findViewById(R.id.i);
        i.setImageResource(R.drawable.cir);

        randomname=(TextView) findViewById(R.id.getrandomnametxt);
        nameplain=(TextView) findViewById(R.id.nameplaintxt);
        boygirl=(ToggleButton)findViewById(R.id.nametoggle);
        randomname.setTextColor(getResources().getColor(R.color.pink));
        randomname.setText("Tikla");
        boygirl.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean on = ((ToggleButton) v).isChecked();
                if (on) {
                    // ON durumunda yapılacaklar
                    status="BoyName";
                    randomname.setTextColor(getResources().getColor(R.color.Baby_Blue));
                    randomname.setText("");
                    nameplain.setText("");
                    Drawable top = getResources().getDrawable(R.drawable.boyicon);
                    boygirl.setCompoundDrawablesWithIntrinsicBounds(null, top , null, null);

                } else {
                    // OFF durumunda yapılacaklar
                    status="GirlName";
                    randomname.setTextColor(getResources().getColor(R.color.pink));
                    randomname.setText("");
                    nameplain.setText("");
                    Drawable top = getResources().getDrawable(R.drawable.girlicon);
                    boygirl.setCompoundDrawablesWithIntrinsicBounds(null, top , null, null);
                }
            }
        });

        i.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                randomname.setText("");
                nameplain.setText("");
                RotateAnimation rotate =
                        new RotateAnimation(0, generateRandomNumber(),
                                Animation.RELATIVE_TO_SELF, 0.5f, Animation.RELATIVE_TO_SELF, 0.5f);

                rotate.setDuration(2500);
                rotate.setInterpolator(new LinearInterpolator());
                i.startAnimation(rotate);
                i.setRotation(generateRandomNumber());
                Vibrator vv = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);
                vv.vibrate(2000);
                final Handler handler = new Handler();

                final Runnable r = new Runnable() {
                    public void run() {
                        maininfo(status);

                    }
                };

                handler.postDelayed(r, 3000);
            }
        });


    }
    private final SensorEventListener mSensorListener = new SensorEventListener() {
        @Override
        public void onSensorChanged(SensorEvent event) {
            float x = event.values[0];
            float y = event.values[1];
            float z = event.values[2];
            mAccelLast = mAccelCurrent;
            mAccelCurrent = (float) Math.sqrt((double) (x * x + y * y + z * z));
            float delta = mAccelCurrent - mAccelLast;
            mAccel = mAccel * 0.9f + delta;
            if (mAccel > 12) {
                start();

            }
        }
        @Override
        public void onAccuracyChanged(Sensor sensor, int accuracy) {
        }
    };
    @Override
    protected void onResume() {
        mSensorManager.registerListener(mSensorListener, mSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER),
                SensorManager.SENSOR_DELAY_NORMAL);
        super.onResume();
    }
    @Override
    protected void onPause() {
        mSensorManager.unregisterListener(mSensorListener);
        super.onPause();
    }
    public void ii(View v)
    {
        randomname.setText("");
        nameplain.setText("");
        RotateAnimation rotate =
                new RotateAnimation(0, generateRandomNumber(),
                        Animation.RELATIVE_TO_SELF, 0.5f, Animation.RELATIVE_TO_SELF, 0.5f);

        rotate.setDuration(2500);
        rotate.setInterpolator(new LinearInterpolator());
        i.startAnimation(rotate);
        i.setRotation(generateRandomNumber());

        final Handler handler = new Handler();

        final Runnable r = new Runnable() {
            public void run() {
                maininfo(status);

            }
        };

        handler.postDelayed(r, 3000);



    }


    public float generateRandomNumber() {

        Random rand = new Random();
        int randomNum = rand.nextInt((10000000 - 125000) + 1);

        return (float)randomNum;
    }



    int backpressed=0;
    @Override
    public void onBackPressed() {
        backpressed++;
        if(backpressed>1)
        {
            if(MainActivity.mainback==true){
                Intent intent = new Intent(Options_RandomName.this, MainActivity.class);
                startActivity(intent);
                this.finish();
                super.onBackPressed();
            }else {
                Intent intent = new Intent(Options_RandomName.this, Options.class);
                startActivity(intent);
                this.finish();
                super.onBackPressed();
            }
        }
        else
        {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        Thread.sleep(2000);}
                    catch (Exception e)
                    {
                        e.printStackTrace();
                    }
                    backpressed=0;
                }
            });
        }
    }
    private void maininfo (String data){
        DatabaseReference rootRef = FirebaseDatabase.getInstance().getReference();
        DatabaseReference newRef = rootRef.child(data);
        ValueEventListener valueEventListener = new ValueEventListener() {

            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                int max = Integer.valueOf((int) dataSnapshot.getChildrenCount());
                String[] data =String.valueOf(dataSnapshot.child(String.valueOf(getRandomNumber(0, max))).getValue(String.class)).split("-");

                Log.e("ammmm", String.valueOf(dataSnapshot.child(String.valueOf(getRandomNumber(0, max))).getValue(String.class)));
                randomname.setText(data[0]);
                nameplain.setText(data[1]);
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        };
        newRef.addListenerForSingleValueEvent(valueEventListener);

    }

    private int getRandomNumber ( int min, int max){
        return (new Random()).nextInt((max - min) + 1) + min;
    }
    private void start(){
        randomname.setText("");
        nameplain.setText("");
        RotateAnimation rotate =
                new RotateAnimation(0, generateRandomNumber(),
                        Animation.RELATIVE_TO_SELF, 0.5f, Animation.RELATIVE_TO_SELF, 0.5f);

        rotate.setDuration(2500);
        rotate.setInterpolator(new LinearInterpolator());
        i.startAnimation(rotate);
        i.setRotation(generateRandomNumber());
        Vibrator vv = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);
        vv.vibrate(1500);
        final Handler handler = new Handler();

        final Runnable r = new Runnable() {
            public void run() {
                maininfo(status);

            }
        };

        handler.postDelayed(r, 3000);

    }
}