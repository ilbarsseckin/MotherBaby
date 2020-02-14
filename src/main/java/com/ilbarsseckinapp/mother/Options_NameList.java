package com.ilbarsseckinapp.mother;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;

import ru.github.igla.ferriswheel.FerrisWheelView;


public class Options_NameList extends Activity implements OnClickListener {

    private FerrisWheelView ferrisWheelView;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_namelist);

        ferrisWheelView = findViewById(R.id.ferrisWheelView);
        findViewById(R.id.startCircle).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ferrisWheelView.startAnimation();
            }
        });
   findViewById(R.id.stopCircle).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ferrisWheelView.stopAnimation();
            }
        });


    }





    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    public void onClick(View v) {

    }
}
