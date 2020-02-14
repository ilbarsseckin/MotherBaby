package com.ilbarsseckinapp.mother;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Toast;

import com.fangxu.allangleexpandablebutton.AllAngleExpandableButton;
import com.fangxu.allangleexpandablebutton.ButtonData;
import com.fangxu.allangleexpandablebutton.ButtonEventListener;

import java.util.ArrayList;
import java.util.List;



/**
 * Created by dear33 on 2016/8/20.
 */
public class test2 extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.test2);

        installButton0to360();
    }





    private void installButton0to360() {
        final AllAngleExpandableButton button = (AllAngleExpandableButton) findViewById(R.id.button_expandable_0_360);
        final List<ButtonData> buttonDatas = new ArrayList<>();
        int[] drawable = {R.drawable.cat, R.drawable.test, R.drawable.test, R.drawable.test, R.drawable.custom_button_image_mother, R.drawable.search, R.drawable.copy,R.drawable.copy};
        int[] color = {R.color.black, R.color.orange, R.color.blue, R.color.pink, R.color.yellow, R.color.red, R.color.green, R.color.green};
        for (int i = 0; i < 8; i++) {
            ButtonData buttonData = null;
            if (i == 0) {

                buttonData = ButtonData.buildIconButton(this, drawable[i], 0);
            } else {
                buttonData = ButtonData.buildIconButton(this, drawable[i], 0);
            }
            buttonData.setBackgroundColorId(this, color[i]);
            buttonDatas.add(buttonData);
        }
        button.setButtonDatas(buttonDatas);
        setListener(button);
    }

    private void setListener(AllAngleExpandableButton button) {
        button.setButtonEventListener(new ButtonEventListener() {
            @Override
            public void onButtonClicked(int index) {
                showToast("clicked index:" + index);
            }

            @Override
            public void onExpand() {
//                showToast("onExpand");
            }

            @Override
            public void onCollapse() {
//                showToast("onCollapse");
            }
        });
    }

    private void showToast(String toast) {
        Toast.makeText(this, toast, Toast.LENGTH_SHORT).show();
    }
}
