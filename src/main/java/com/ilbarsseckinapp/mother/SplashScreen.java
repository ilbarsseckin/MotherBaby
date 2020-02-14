package com.ilbarsseckinapp.mother;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.widget.VideoView;

public class SplashScreen extends Activity {

    private static int gosterim_suresi = 0000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splashscreen);
        VideoView view = (VideoView)findViewById(R.id.vv);
        String path = "android.resource://" + getPackageName() + "/" + R.raw.splashvideo;
        view.setVideoURI(Uri.parse(path));
        view.start();
        new Handler().postDelayed(new Runnable() {

            @Override
            public void run() {
                if(FileTask.readData("createuser").equals("1")) {
                    Intent i = new Intent(SplashScreen.this, MainActivity.class);
                    startActivity(i);
                    finish();
                }else{
                    Intent i = new Intent(SplashScreen.this, CreateUser.class);
                    startActivity(i);
                    finish();
                }


            }
        }, gosterim_suresi);
    }
}