package com.ilbarsseckinapp.mother;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.shashank.sony.fancygifdialoglib.FancyGifDialog;
import com.shashank.sony.fancygifdialoglib.FancyGifDialogListener;

public class Options extends AppCompatActivity implements View.OnClickListener {
    private Button Kgtakip, kasilmasayar, tekmesayar, ayarlar, sagliktesti, isimler, album, ilactakip, back, dogumcantasi;
    private Button ihtiyaclistesi, puan;
    private Intent intent;
    final String PREFS_NAME = "MyPrefsFile";
    final String SHAREDPREF_DATE = "SharedPrefDate";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options);

        Kgtakip = (Button) findViewById(R.id.KgBtn);
        kasilmasayar = (Button) findViewById(R.id.KasilmaBtn);
        tekmesayar = (Button) findViewById(R.id.TekmeBtn);
        ayarlar = (Button) findViewById(R.id.SetBtn);
        sagliktesti = (Button) findViewById(R.id.SaglikTestBtn);
        isimler = (Button) findViewById(R.id.namebtn);
        album = (Button) findViewById(R.id.albumbtn);
        ilactakip = (Button) findViewById(R.id.Drugbtn);
        ihtiyaclistesi = (Button) findViewById(R.id.ihtiyacbtn);
        back = (Button) findViewById(R.id.oneribtn);
        dogumcantasi = (Button) findViewById(R.id.dogumcntasibtn);
        puan = (Button) findViewById(R.id.puanbtn);

        Kgtakip.setOnClickListener(this);
        kasilmasayar.setOnClickListener(this);
        tekmesayar.setOnClickListener(this);
        ayarlar.setOnClickListener(this);
        sagliktesti.setOnClickListener(this);
        isimler.setOnClickListener(this);
        album.setOnClickListener(this);
        ilactakip.setOnClickListener(this);
        ihtiyaclistesi.setOnClickListener(this);
        back.setOnClickListener(this);
        dogumcantasi.setOnClickListener(this);
        puan.setOnClickListener(this);

        Options_Settings_SqlLite info = new Options_Settings_SqlLite(this);
        info.Info();
        String getinfo = info.getBabyname();
        getSupportActionBar().setTitle(getinfo + "-" + info.getBabyakraba());
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.KgBtn:
                Kg();
                break;
            case R.id.KasilmaBtn:
                Kasilma();
                break;
            case R.id.TekmeBtn:
                Tekme();
                break;
            case R.id.SetBtn:
                Ayarlar();
                break;
            case R.id.SaglikTestBtn:
                SaglikTesti();
                break;
            case R.id.namebtn:
                isimler();
                break;
            case R.id.albumbtn:
                album();
                break;
            case R.id.Drugbtn:
                ilactakip();
                break;
            case R.id.ihtiyacbtn:
                ihtiyac();
                break;
            case R.id.dogumcntasibtn:
                dogumcantasi();
                break;
            case R.id.oneribtn:
                setBack();
                break;
            case R.id.puanbtn:
                setrating();
                break;
        }
    }

    private void Kg() {


        intent = new Intent(Options.this, Options_KgFollow.class);
        startActivity(intent);
        this.finish();

    }

    private void Kasilma() {
        intent = new Intent(Options.this, Options_KasilmaSayar.class);
        startActivity(intent);
        this.finish();

    }

    private void Tekme() {
        intent = new Intent(Options.this, Options_TekmeSayar.class);
        startActivity(intent);
        this.finish();

    }

    private void Ayarlar() {
        intent = new Intent(Options.this, Options_Settings.class);
        startActivity(intent);
        this.finish();

    }

    private void SaglikTesti() {

        intent = new Intent(Options.this, Options_Healt_Test.class);
        startActivity(intent);
        this.finish();
    }

    private void setBack() {
       /* intent = new Intent(Options.this, MainActivity.class);
        startActivity(intent);
        this.finish();*/
        shareIt();

    }

    private void isimler() {

        intent = new Intent(Options.this, Options_RandomName.class);
        startActivity(intent);
        this.finish();
    }

    private void dogumcantasi() {
        intent = new Intent(Options.this, Options_DogumCantasi.class);
        startActivity(intent);
        this.finish();

    }

    private void ilactakip() {

        intent = new Intent(Options.this, Options_MedicinaFollow.class);
        startActivity(intent);
        this.finish();

    }

    private void album() {
        intent = new Intent(Options.this, Options_PhotoAlbum.class);
        startActivity(intent);
        this.finish();

    }

    private void ihtiyac() {
        intent = new Intent(Options.this, Options_IhtiyacListesi.class);
        startActivity(intent);
        this.finish();
    }

    @Override
    public void onBackPressed() {
        Intent intent = new Intent(Options.this, MainActivity.class);
        startActivity(intent);
        this.finish();
        super.onBackPressed();
    }

    private void setrating() {
        new FancyGifDialog.Builder(Options.this)
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
                        intent = new Intent(Options.this, Options.class);
                        startActivity(intent);
                    }
                })
                .build();


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


}
