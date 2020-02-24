package com.ilbarsseckinapp.mother;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Bundle;
import android.text.Layout;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.VideoView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.github.clans.fab.FloatingActionButton;
import com.github.clans.fab.FloatingActionMenu;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.iid.InstanceIdResult;
import com.google.firebase.messaging.FirebaseMessaging;
import com.shashank.sony.fancygifdialoglib.FancyGifDialog;
import com.shashank.sony.fancygifdialoglib.FancyGifDialogListener;

import static android.view.View.GONE;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    private Button Baby, Mother;
    private TextView BabyDay, PregnancyDay, BirthDay, Dimensions;
    private TextView info, tremise;
    private Intent intent;
    private VideoView view;
    private Options_Settings_Service settingsinfo;
    private TextView artikgun;
    private Layout mainscreen;
    public static Boolean mainback=false;
    private ImageView gif;
    FloatingActionMenu materialDesignFAM;
    FloatingActionButton floatingActionButton1, floatingActionButton2, floatingActionButton3, floatingActionButton4, floatingActionButton5, floatingActionButton6, floatingActionButton7, floatingActionButton8;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mainback=false;
        FirebaseInstanceId.getInstance().getToken();
        FirebaseMessaging.getInstance().setAutoInitEnabled(true);

        materialDesignFAM = (FloatingActionMenu) findViewById(R.id.material_design_android_floating_action_menu);
        floatingActionButton1 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item1);
        floatingActionButton2 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item2);
        floatingActionButton3 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item3);
        floatingActionButton4 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item4);
        floatingActionButton5 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item5);
        floatingActionButton6 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item6);
        floatingActionButton7 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item7);
        floatingActionButton8 = (FloatingActionButton) findViewById(R.id.material_design_floating_action_menu_item8);
        floatingActionButton1.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                //TODO something when floating action menu first item clicked
                intent = new Intent(MainActivity.this, Options_KgFollow.class);
                startActivity(intent);
                mainback=true;

            }
        });
        floatingActionButton2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                new FancyGifDialog.Builder(MainActivity.this)
                        .setTitle("Tekme Sayar Vs. Kasılma Sayar ")
                        .setMessage("")
                        .setNegativeBtnText("Tekme Sayar")
                        .setPositiveBtnBackground("#95B9C7")
                        .setPositiveBtnText("Kasılma Sayar")
                        .setNegativeBtnBackground("#FFE5B4")
                        .setGifResource(R.drawable.gif2)   //Pass your Gif here
                        .isCancellable(true)
                        .OnPositiveClicked(new FancyGifDialogListener() {
                            @Override
                            public void OnClick() {
                                intent = new Intent(MainActivity.this, Options_KasilmaSayar.class);
                                startActivity(intent);
                                mainback=true;

                            }
                        })
                        .OnNegativeClicked(new FancyGifDialogListener() {
                            @Override
                            public void OnClick() {
                                intent = new Intent(MainActivity.this, Options_TekmeSayar.class);
                                startActivity(intent);
                                mainback=true;

                            }
                        })
                        .build();

            }
        });
        floatingActionButton3.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                new FancyGifDialog.Builder(MainActivity.this)
                        .setTitle("Doğum Çantası Vs. İhtiyaç Listesi ")
                        .setMessage("")
                        .setNegativeBtnText("Doğum Çantası")
                        .setPositiveBtnBackground("#95B9C7")
                        .setPositiveBtnText("İhtiyaç Listesi")
                        .setNegativeBtnBackground("#FFE5B4")
                        .setGifResource(R.drawable.gif3)   //Pass your Gif here
                        .isCancellable(true)
                        .OnPositiveClicked(new FancyGifDialogListener() {
                            @Override
                            public void OnClick() {
                                intent = new Intent(MainActivity.this, Options_IhtiyacListesi.class);
                                startActivity(intent);
                                mainback=true;

                            }
                        })
                        .OnNegativeClicked(new FancyGifDialogListener() {
                            @Override
                            public void OnClick() {
                                intent = new Intent(MainActivity.this, Options_DogumCantasi.class);
                                startActivity(intent);
                                mainback=true;
                            }
                        })
                        .build();

            }
        });
        floatingActionButton4.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Options_RandomName.class);
                startActivity(intent);
                mainback=true;

            }
        });
        floatingActionButton5.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Options_Healt_Test.class);
                startActivity(intent);
                mainback=true;
            }
        });
        floatingActionButton6.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {

                intent = new Intent(MainActivity.this, Options_Settings.class);
                startActivity(intent);
                mainback=true;
            }
        });
        floatingActionButton7.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Options_PhotoAlbum.class);
                startActivity(intent);
                mainback=true;

            }
        });
        floatingActionButton8.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Options_MedicinaFollow.class);
                startActivity(intent);
                mainback=true;

            }
        });
        BabyDay = (TextView) findViewById(R.id.BabyDaytxt);
        PregnancyDay = (TextView) findViewById(R.id.PregnancyDaytxt);
        BirthDay = (TextView) findViewById(R.id.BirthDaytxt);
        Dimensions = (TextView) findViewById(R.id.Dimensionstxt);
        info = (TextView) findViewById(R.id.MainInfoTxt);
        artikgun = (TextView) findViewById(R.id.artikguntxt);
        tremise = (TextView) findViewById(R.id.tremisetxt);
        Baby = (Button) findViewById(R.id.MyBabyBtn);
        Mother = (Button) findViewById(R.id.MotherBtn);

        view = (VideoView) findViewById(R.id.Main_videoView);
        gif=(ImageView) findViewById(R.id.gif);

        Baby.setOnClickListener(this);
        Mother.setOnClickListener(this);


        info(this);
        Mybaby();
        MainInfo();

        if (!isInternetAvailable(this)) {
            AlertDialog.Builder builder = new AlertDialog.Builder(
                    MainActivity.this);
            builder.setTitle("İnternet Bağlantısı Sorunu");
            builder.setPositiveButton("Tamam", null);
            builder.setIcon(R.drawable.wifi);
            builder.setMessage("İnternet Bağlantınızı Kontrol Ediniz.");
            AlertDialog theAlertDialog = builder.create();
            theAlertDialog.show();
        }

        FirebaseInstanceId.getInstance().getInstanceId().addOnSuccessListener(MainActivity.this,new OnSuccessListener<InstanceIdResult>() {
            @Override
            public void onSuccess(InstanceIdResult instanceIdResult) {
                String newToken = instanceIdResult.getToken();
              //  Toast.makeText(MainActivity.this, newToken, Toast.LENGTH_SHORT).show();
            }
        });

        FirebaseInstanceId.getInstance().getInstanceId()
                .addOnCompleteListener(new OnCompleteListener<InstanceIdResult>() {
                    @Override
                    public void onComplete(@NonNull Task<InstanceIdResult> task) {
                        if (!task.isSuccessful()) {
                            Log.w("sad", "getInstanceId failed", task.getException());
                            return;
                        }

                        // Get new Instance ID token
                        String token = task.getResult().getToken();


                    }
                });
        FirebaseMessaging.getInstance().setAutoInitEnabled(true);

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

    private void Mybaby() {
        Baby.setTextColor(getResources().getColor(R.color.white));
        Mother.setTextColor(getResources().getColor(R.color.pink));
        Baby.setTextSize(18);
        Mother.setTextSize(16);
        maininfo("baby");

    }

    private void Mother() {
        Baby.setTextColor(getResources().getColor(R.color.pink));
        Mother.setTextColor(getResources().getColor(R.color.white));
        Baby.setTextSize(16);
        Mother.setTextSize(18);
        maininfo("mother");
    }

    private void MainMenu() {


    }

    private void Options() {
        intent = new Intent(MainActivity.this, Options.class);
        startActivity(intent);
        this.finish();
    }

    public void info(Context context) {

        Options_Settings_SqlLite info = new Options_Settings_SqlLite(context);
        info.Info();
        String getinfo = info.getBabyname();
        getSupportActionBar().setTitle(getinfo + "-" + info.getBabyakraba());


        if (!info.getBabyadet().equals("0")) {//matematik islemleri icin
            settingsinfo = new Options_Settings_Service();
            settingsinfo.lastadet(info.getBabyadet());
        } else {
            settingsinfo = new Options_Settings_Service();
            settingsinfo.guessbirthday(info.getBabytahmin());

        }
        BabyDay.setText(settingsinfo.dogumagecensure());
        PregnancyDay.setText(settingsinfo.kachaftalik() + ".");
        artikgun.setText(settingsinfo.artikgun() + ".");
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

    private void maininfo(String data) {
        DatabaseReference rootRef = FirebaseDatabase.getInstance().getReference();
        DatabaseReference newRef = rootRef.child(data);
        ValueEventListener valueEventListener = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                int value=Integer.valueOf(BabyDay.getText().toString());

                Log.e("hain",String.valueOf(dataSnapshot.child(String.valueOf(value))));
                info.setText(String.valueOf(dataSnapshot.child(value + "-").getValue(String.class)));
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        };
        newRef.addListenerForSingleValueEvent(valueEventListener);

    }

    public void firstweekvideo() {
        String path = "android.resource://" + getPackageName() + "/" + R.raw.firstweek;
        view.setVideoURI(Uri.parse(path));
        view.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
            @Override
            public void onPrepared(MediaPlayer mp) {
                mp.setLooping(true);
                view.start();

            }
        });
        view.setOnPreparedListener(PreparedListener);
        view.requestFocus();
    }


    MediaPlayer.OnPreparedListener PreparedListener = new MediaPlayer.OnPreparedListener() {

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


    public static boolean isInternetAvailable(Context context) {
        ConnectivityManager connectivityManager
                = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }

    public void MainInfo() {
        if (settingsinfo.kachaftalik().equals("0")) {
            view.setVisibility(View.VISIBLE);
            gif.setVisibility(GONE);
            firstweekvideo();
            Dimensions.setText("-");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("1")) {
            view.setVisibility(View.VISIBLE);
            gif.setVisibility(GONE);
            firstweekvideo();
            Dimensions.setText("-");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("2")) {
            view.setVisibility(View.VISIBLE);
            gif.setVisibility(GONE);
            firstweekvideo();
            Dimensions.setText("-");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("3")) {
            view.setVisibility(View.VISIBLE);
            gif.setVisibility(GONE);
            firstweekvideo();
            Dimensions.setText("-");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("4")) {
            view.setVisibility(GONE);
            gif.setImageDrawable(getResources().getDrawable(R.drawable.dortweek));
            Dimensions.setText("Haşhaş Tohumu Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("5")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.besinci));
            Dimensions.setText("Elma Çekirdeği Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("6")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.altinci));
            Dimensions.setText("Bezelye Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("7")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yedinci));
            Dimensions.setText("Yaban Mersini Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("8")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.sekizinci));
            Dimensions.setText("Barbunya Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("9")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.dokuzuncu));
            Dimensions.setText("Üzüm Tanesi Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("10")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onucuncu));
            Dimensions.setText("Çilek Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("11")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onbirinci));
            Dimensions.setText("İncir Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("12")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onikinci));
            Dimensions.setText("Misket limonu Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("13")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onucuncu));
            Dimensions.setText("Limon Büyüklüğünde");
            tremise.setText("1.");
        }
        if (settingsinfo.kachaftalik().equals("14")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.ondorduncu));
            Dimensions.setText("Şeftali Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("15")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onbesinci));
            Dimensions.setText("Elma Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("16")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onaltinci));
            Dimensions.setText("Avakado Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("17")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onyedinci));
            Dimensions.setText("Nar Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("18")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.onsekizinci));
            Dimensions.setText("Enginar Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("19")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.ondokuzuncu));
            Dimensions.setText("Mango Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("20")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirminci));
            Dimensions.setText("Muz Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("21")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmibir));
            Dimensions.setText("Havuç Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("22")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmiiki));
            Dimensions.setText("Hindistan Cevizi Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("23")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmiuc));
            Dimensions.setText("Greyfurt Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("24")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmidort));
            Dimensions.setText("Kavun Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("25")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmibes));
            Dimensions.setText("Karnabahar Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("26")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmialti));
            Dimensions.setText("Kabak Büyüklüğünde");
            tremise.setText("2.");
        }
        if (settingsinfo.kachaftalik().equals("27")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmiyedi));
            Dimensions.setText("Kıvırcık Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("28")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmisekiz));
            Dimensions.setText("Patlıcan Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("29")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.yirmidokuz));
            Dimensions.setText("Tatume Kabağı Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("30")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuz));
            Dimensions.setText("Lahana Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("31")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzbir));
            Dimensions.setText("Kuşkonmaz Demeti Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("32")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuziki));
            Dimensions.setText("Su kabağı Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("33")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzuc));
            Dimensions.setText("Kereviz Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("34")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzdort));
            Dimensions.setText("Kavun Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("35")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzbes));
            Dimensions.setText("Ananas Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("36")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzalti));
            Dimensions.setText("Papaya Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("37")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzyedi));
            Dimensions.setText("Marul Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("38")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzsekiz));
            Dimensions.setText("Kış Kabağı Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("39")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.otuzdokuz));
            Dimensions.setText("Bal kabağı Büyüklüğünde");
            tremise.setText("3.");
        }
        if (settingsinfo.kachaftalik().equals("40")) {
            gif.setImageDrawable(getResources().getDrawable(R.drawable.kirik));
            Dimensions.setText("Karpuz Büyüklüğünde");
            tremise.setText("3.");
        }


    }
    @Override
    public void onBackPressed()
    {

    }
}
