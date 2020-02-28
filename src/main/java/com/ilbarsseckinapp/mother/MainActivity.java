package com.ilbarsseckinapp.mother;


import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.media.MediaPlayer;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.VideoView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;

import com.budiyev.android.circularprogressbar.CircularProgressBar;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.navigation.NavigationView;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.iid.InstanceIdResult;
import com.google.firebase.messaging.FirebaseMessaging;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.series.DataPoint;
import com.jjoe64.graphview.series.LineGraphSeries;
import com.shashank.sony.fancygifdialoglib.FancyGifDialog;
import com.shashank.sony.fancygifdialoglib.FancyGifDialogListener;

import at.grabner.circleprogress.CircleProgressView;
import at.grabner.circleprogress.Direction;

import static android.view.View.GONE;


public class MainActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {
    private Options_Settings_Service settingsinfo;
    private TextView BabyDay, PregnancyDay, BirthDay, Dimensions;
    private TextView info, tremise;
    private Intent intent;
    private VideoView view;
    private TextView artikgun;
    private LinearLayout mainscreen;
    public static Boolean mainback = false;
    private ImageView gif;
    DrawerLayout drawer;
    private Button toolbarbabybtn, toolbarmotherbtn,toolbarsettings;
    private TextView babyname;
    private TextView toolbargun, toolbarhafta;
    CircleProgressView mCircleView;
    private SQLiteDatabase dataBase;
    private Options_Healt_Test_SqlLite mHelper;
    private Options_IhtiyacListesi_SqlLite mihtiyac;
    private Options_DogumCantasi_SqlLite mdogumcantasi;
    private  TextView toolbaroptionbtn;
    private Options_KgFollow_SqlLite mkg;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        FirebaseInstanceId.getInstance().getToken();
        FirebaseMessaging.getInstance().setAutoInitEnabled(true);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbarbabybtn = (Button) findViewById(R.id.toolbarbabybtn);
        toolbarbabybtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {

                if (!isInternetAvailable(getApplicationContext())) {
                    Toast.makeText(getApplicationContext(), "İnternet Bağlantınızı Kontrol Ediniz.",
                            Toast.LENGTH_LONG).show();
                }else{
                    maininfoBaby("baby");

                }

            }
        });
        toolbarmotherbtn = (Button) findViewById(R.id.toolbarmotherbtn);
        toolbarmotherbtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (!isInternetAvailable(getApplicationContext())) {
                    Toast.makeText(getApplicationContext(), "İnternet Bağlantınızı Kontrol Ediniz.",
                            Toast.LENGTH_LONG).show();
                }else{
                    maininfoMother("mother");

                }
            }
        });

        mainscreen=(LinearLayout)findViewById(R.id.mainscreenlayout);

        toolbarsettings =(Button) findViewById(R.id.toolbarsettings);
        toolbarsettings.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Options();
            }
        });
        babyname = (TextView) findViewById(R.id.toolbarname);
        babyname.setText("Elis-Anne");
        drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        //NavigationView navigationViewRight = (NavigationView) findViewById(R.id.nav_view_right);
      //  navigationViewRight.setNavigationItemSelectedListener(this);
        navigationView.setNavigationItemSelectedListener(this);


        BabyDay = (TextView) findViewById(R.id.BabyDaytxt);
        PregnancyDay = (TextView) findViewById(R.id.PregnancyDaytxt);
        BirthDay = (TextView) findViewById(R.id.BirthDaytxt);
        Dimensions = (TextView) findViewById(R.id.Dimensionstxt);
     //   info = (TextView) findViewById(R.id.MainInfoTxt);
        artikgun = (TextView) findViewById(R.id.artikguntxt);
        tremise = (TextView) findViewById(R.id.tremisetxt);


        view = (VideoView) findViewById(R.id.Main_videoView);
        gif = (ImageView) findViewById(R.id.gif);

        info(this);
        MainInfo();

        View headerView = navigationView.getHeaderView(0);
        CircularProgressBar progressBar = headerView.findViewById(R.id.yourCircularProgressbar);
        int gun = Integer.valueOf(settingsinfo.dogumagecensure() + "00") / 280;
        Log.e("hesap1", String.valueOf(gun));
        progressBar.setProgress(gun);

        View headerViewW = navigationView.getHeaderView(0);
        CircularProgressBar progressBarr = headerViewW.findViewById(R.id.yourCircularProgressbarr);
        int week = Integer.valueOf(settingsinfo.kachaftalik() + "00") / 40;
        progressBarr.setProgress(week);

        View headerViewgun = navigationView.getHeaderView(0);
        toolbargun = (TextView) headerViewgun.findViewById(R.id.toolbarguntxt);
        toolbargun.setText("%" + String.valueOf(gun));

        View headerViewhafta = navigationView.getHeaderView(0);
        toolbarhafta = (TextView) headerViewhafta.findViewById(R.id.toolbarhaftatxt);
        toolbarhafta.setText("%" + String.valueOf(week));


        mHelper = new Options_Healt_Test_SqlLite(this);
        Log.e("oyy", String.valueOf(mHelper.TestCount()));
        int val = Integer.valueOf(String.valueOf(mHelper.TestCount()) + "00") / 22;
        CircleTest(val);
        Log.e("neoldu", String.valueOf(val));


        mihtiyac = new Options_IhtiyacListesi_SqlLite(this);
        Log.e("oyy", String.valueOf(mihtiyac.IhtiyacCount()));
        int valihtiyac = Integer.valueOf(String.valueOf(mihtiyac.IhtiyacCount()) + "00") / 22;
        CircleIhtiyac(valihtiyac);

        mdogumcantasi = new Options_DogumCantasi_SqlLite(this);
        Log.e("oyy", String.valueOf(mdogumcantasi.DogumCount()));
        int valdogum = Integer.valueOf(String.valueOf(mdogumcantasi.DogumCount()) + "00") / 22;
        CircleCanta(valdogum);

        int valgun = Integer.valueOf(settingsinfo.dogumagecensure() + "00") / 280;
        CircleDogum(valgun);


        Log.e("hesap2", String.valueOf(gun));
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

        FirebaseInstanceId.getInstance().getInstanceId().addOnSuccessListener(MainActivity.this, new OnSuccessListener<InstanceIdResult>() {
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


        mkg = new Options_KgFollow_SqlLite(this);
        mkg.InfoOrderweek();
        Log.e("tahmini9",mkg.month9);
        Log.e("tahmini1",mkg.month1);
        Log.e("tahmini2",mkg.month2);
        Log.e("tahmini3",mkg.month3);
        Log.e("tahmini4",mkg.month4);
        Log.e("tahmini5",mkg.month5);
        Log.e("tahmini6",mkg.month6);
        Log.e("tahmini7",mkg.month7);
        Log.e("tahmini8",mkg.month8);
        kggraphic(mkg.month1,mkg.month2,mkg.month3,mkg.month4,mkg.month5,mkg.month6,mkg.month7,mkg.month8,mkg.month9);
    }

    public void kggraphic(String mounth1,String mounth2,String mounth3,String mounth4,String mounth5,String mounth6,String mounth7,String mounth8,String mounth9){
        final GraphView graph = (GraphView) findViewById(R.id.graph);
        graph.setVisibility(View.VISIBLE);
        graph.getViewport().setScrollable(true);
        graph.getViewport().setScalable(true);
        graph.getViewport().setMinX(0);
        graph.getViewport().setMaxX(9);
        graph.getViewport().setDrawBorder(true);
        graph.getViewport().setBorderColor(Color.CYAN);
        graph.getViewport().setXAxisBoundsManual(true);
        graph.setCursorMode(true);

        try {
            LineGraphSeries<DataPoint> series = new LineGraphSeries < > (new DataPoint[] {
                    new DataPoint(0, 1),
                    new DataPoint(Integer.valueOf(0), Integer.valueOf(mounth1)),
                    new DataPoint(Integer.valueOf(1), Integer.valueOf(mounth1)),
                    new DataPoint(Integer.valueOf(2), Integer.valueOf(mounth2)),
                    new DataPoint(Integer.valueOf(3), Integer.valueOf(mounth3)),
                    new DataPoint(Integer.valueOf(4), Integer.valueOf(mounth4)),
                    new DataPoint(Integer.valueOf(5), Integer.valueOf(mounth5)),
                    new DataPoint(Integer.valueOf(6), Integer.valueOf(mounth6)),
                    new DataPoint(Integer.valueOf(7), Integer.valueOf(mounth7)),
                    new DataPoint(Integer.valueOf(8), Integer.valueOf(mounth8)),
                    new DataPoint(Integer.valueOf(9), Integer.valueOf(mounth9))
            });
            graph.addSeries(series);
        } catch (IllegalArgumentException e) {
            Toast.makeText(MainActivity.this, e.getMessage(), Toast.LENGTH_LONG).show();
        }
    }
    public static boolean isInternetAvailable(Context context) {
        ConnectivityManager connectivityManager
                = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }
    public void CircleDogum(int value){
        mCircleView = (CircleProgressView) findViewById(R.id.circleViewgun);
        mCircleView.setOnProgressChangedListener(new CircleProgressView.OnProgressChangedListener() {
            @Override
            public void onProgressChanged(float value) {
                Log.e("Progress Changed: ", String.valueOf(value));
            }
        });
        mCircleView.setValue(value);
        mCircleView.setDirection(Direction.CW);
        mCircleView.setUnit("%");
    }
    public void CircleTest(int value){
        mCircleView = (CircleProgressView) findViewById(R.id.circleViewtest);
        mCircleView.setOnProgressChangedListener(new CircleProgressView.OnProgressChangedListener() {
            @Override
            public void onProgressChanged(float value) {
                Log.e("Progress Changed: ", String.valueOf(value));
            }
        });
        mCircleView.setValue(value);
        mCircleView.setDirection(Direction.CW);
        mCircleView.setUnit("%");
    }
    public void CircleIhtiyac(int value){
        mCircleView = (CircleProgressView) findViewById(R.id.circleViewihtiyac);
        mCircleView.setOnProgressChangedListener(new CircleProgressView.OnProgressChangedListener() {
            @Override
            public void onProgressChanged(float value) {
                Log.e("Progress Changed: ", String.valueOf(value));
            }
        });
        mCircleView.setValue(value);
        mCircleView.setDirection(Direction.CW);
        mCircleView.setUnit("%");
    }
    public void CircleCanta(int value){
        mCircleView = (CircleProgressView) findViewById(R.id.circleViewdogumcantasi);
        mCircleView.setOnProgressChangedListener(new CircleProgressView.OnProgressChangedListener() {
            @Override
            public void onProgressChanged(float value) {
                Log.e("Progress Changed: ", String.valueOf(value));
            }
        });
        mCircleView.setValue(value);
        mCircleView.setDirection(Direction.CW);
        mCircleView.setUnit("%");
    }
    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else if (drawer.isDrawerOpen(GravityCompat.END)) {
            drawer.closeDrawer(GravityCompat.END);
        } else {
          //  super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        //   getMenuInflater().inflate(R.menu.main, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        Log.e("kabulet", String.valueOf(id));
        if (id == R.id.action_call) {
            if (drawer.isDrawerOpen(GravityCompat.END)) {
                drawer.closeDrawer(GravityCompat.END);
            } else {
                drawer.openDrawer(GravityCompat.END);
            }
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();
        Log.e("kabulet1", String.valueOf(id));
        if (id == R.id.kgitem) {
            intent = new Intent(MainActivity.this, Options_KgFollow.class);
            startActivity(intent);
            mainback = true;
        } else if (id == R.id.ihtyiaclaritem) {
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
                            mainback = true;

                        }
                    })
                    .OnNegativeClicked(new FancyGifDialogListener() {
                        @Override
                        public void OnClick() {
                            intent = new Intent(MainActivity.this, Options_DogumCantasi.class);
                            startActivity(intent);
                            mainback = true;
                        }
                    })
                    .build();
        } else if (id == R.id.resimleritem) {
            intent = new Intent(MainActivity.this, Options_PhotoAlbum.class);
            startActivity(intent);
            mainback = true;
        } else if (id == R.id.ilacitem) {
            intent = new Intent(MainActivity.this, Options_MedicinaFollow.class);
            startActivity(intent);
            mainback = true;
        } else if (id == R.id.Sayaritem) {
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
                            mainback = true;

                        }
                    })
                    .OnNegativeClicked(new FancyGifDialogListener() {
                        @Override
                        public void OnClick() {
                            intent = new Intent(MainActivity.this, Options_TekmeSayar.class);
                            startActivity(intent);
                            mainback = true;

                        }
                    })
                    .build();
        } else if (id == R.id.ayarlaritem) {
            intent = new Intent(MainActivity.this, Options_Settings.class);
            startActivity(intent);
            mainback = true;
        } else if (id == R.id.testleritem) {
            intent = new Intent(MainActivity.this, Options_Healt_Test.class);
            startActivity(intent);
            mainback = true;
        } else if (id == R.id.nameitem) {
            intent = new Intent(MainActivity.this, Options_RandomName.class);
            startActivity(intent);
            mainback = true;
        } else if (id == R.id.oneriitem) {
            shareIt();
        }
        else if (id == R.id.puanitem) {
            setrating();
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
    private void setrating() {
        new FancyGifDialog.Builder(MainActivity.this)
                .setTitle("Uygulamayı Puanla")
                .setMessage("")
                .setNegativeBtnText("İptal")
                .setPositiveBtnBackground("#95B9C7")
                .setPositiveBtnText("Puan Ver")
                .setNegativeBtnBackground("#FFC0CB")//FFE5B4
                .setGifResource(R.drawable.puan)   //Pass your Gif here
                .isCancellable(true)
                .OnPositiveClicked(new FancyGifDialogListener() {
                    @Override
                    public void OnClick() {
                        final String appPackageName = "com.ilbarsseckinapp.mother";

                        try {
                            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + appPackageName)));
                        } catch (android.content.ActivityNotFoundException anfe) {
                            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("http://play.google.com/store/apps/details?id=" + appPackageName)));
                        }
                    }
                })
                .OnNegativeClicked(new FancyGifDialogListener() {
                    @Override
                    public void OnClick() {
                        intent = new Intent(MainActivity.this, Test.class);
                        startActivity(intent);
                    }
                })
                .build();


    }
    private void Options() {
        intent = new Intent(MainActivity.this, Options.class);
        startActivity(intent);
        this.finish();
    }
    private void shareIt() {
        String s = "Bilgiler:\n";
        s += "OS Version: " + System.getProperty("os.version") + "(" + android.os.Build.VERSION.INCREMENTAL + ")\n";
        s += "OS API Level: " + android.os.Build.VERSION.RELEASE + "(" + android.os.Build.VERSION.SDK_INT + ")\n";
        s += "Device: " + android.os.Build.DEVICE + "\n";
        s += "Model (and Product): " + android.os.Build.MODEL + " (" + android.os.Build.PRODUCT + ")\n";
        s += "Android SDK: " + Build.VERSION.RELEASE;
        s += "Android SDK: " + Build.VERSION.SDK_INT;
        String email = "ilbarsseckin@gmail.com"; /* Your email address here */
        String subject = "ilbarsseckin@gmail.com"; /* Your subject here */
        String body = s + "\nÖNERİNİZ:\n";/* Your body here */
        String chooserTitle = "Bebeğim";/* Your chooser title here */
        Uri uri = Uri.parse("mailto:" + email)
                .buildUpon()
                .appendQueryParameter("subject", subject)
                .appendQueryParameter("body", body)
                .build();
        Intent emailIntent = new Intent(Intent.ACTION_SENDTO, uri);
        startActivity(Intent.createChooser(emailIntent, chooserTitle));


    }
    private void maininfoBaby(String data) {
        DatabaseReference rootRef = FirebaseDatabase.getInstance().getReference();
        DatabaseReference newRef = rootRef.child(data);
        ValueEventListener valueEventListener = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                int value = Integer.valueOf(BabyDay.getText().toString())-1;
                if(value==0)value=1;
                if(value==279)value=280;
                Log.e("neyy", String.valueOf(value));
                Log.e("hain", String.valueOf(dataSnapshot.child(String.valueOf(value))));
                // info.setText(String.valueOf(dataSnapshot.child(value + "-").getValue(String.class)));
                BebekBilgileri(String.valueOf(dataSnapshot.child(value + "-").getValue(String.class)), settingsinfo.kachaftalik());
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        };
        newRef.addListenerForSingleValueEvent(valueEventListener);

    }

    private void maininfoMother(String data) {
        DatabaseReference rootRef = FirebaseDatabase.getInstance().getReference();
        DatabaseReference newRef = rootRef.child(data);
        ValueEventListener valueEventListener = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                int value = Integer.valueOf(BabyDay.getText().toString())-1;
                if(value==0)value=1;
                if(value==279)value=280;
                Log.e("hain", String.valueOf(dataSnapshot.child(String.valueOf(value))));
                // info.setText(String.valueOf(dataSnapshot.child(value + "-").getValue(String.class)));
                AnneBilgileri(String.valueOf(dataSnapshot.child(value + "-").getValue(String.class)));
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        };
        newRef.addListenerForSingleValueEvent(valueEventListener);

    }

    public void BebekBilgileri(String info, String Hafta) {
        LayoutInflater inflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View myScrollView = inflater.inflate(R.layout.scroll_text, null, false);
        TextView tv = (TextView) myScrollView.findViewById(R.id.textViewWithScroll);
        tv.setText("");
        tv.append(info);

        new AlertDialog.Builder(MainActivity.this).setView(myScrollView)
                .setTitle(Hafta + ". Hafta Bebeğim")
                .setIcon(R.drawable.girlicon)
                .setPositiveButton("Tamam", new DialogInterface.OnClickListener() {
                    @TargetApi(11)
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }

                })
              .show();


    }

    public void AnneBilgileri(String info) {
        LayoutInflater inflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View myScrollView = inflater.inflate(R.layout.scroll_text, null, false);
        TextView tv = (TextView) myScrollView.findViewById(R.id.textViewWithScroll);
        tv.setText("");
        tv.append(info);

        new AlertDialog.Builder(MainActivity.this).setView(myScrollView)
                .setTitle("Anne")
                .setIcon(R.drawable.boyicon)
                .setPositiveButton("Tamam", new DialogInterface.OnClickListener() {
                    @TargetApi(11)
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }

                })
                .show();

    }

    public void info(Context context) {

        Options_Settings_SqlLite info = new Options_Settings_SqlLite(context);
        info.Info();
        String getinfo = info.getBabyname();
        babyname.setText(getinfo + "-" + info.getBabyakraba());
        //    getSupportActionBar().setTitle(getinfo + "-" + info.getBabyakraba());

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
    public void onResume() {
        super.onResume();

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

}
