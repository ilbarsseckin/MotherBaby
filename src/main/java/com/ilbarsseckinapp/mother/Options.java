package com.ilbarsseckinapp.mother;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class Options extends AppCompatActivity implements View.OnClickListener {
    private Button Kgtakip,kasilmasayar,tekmesayar,ayarlar,sagliktesti,isimler,album,ilactakip,back,dogumcantasi;
    private Button ihtiyaclistesi;
    private Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options);

        Kgtakip=(Button)findViewById(R.id.KgBtn);
        kasilmasayar=(Button)findViewById(R.id.KasilmaBtn);
        tekmesayar=(Button)findViewById(R.id.TekmeBtn);
        ayarlar=(Button)findViewById(R.id.SetBtn);
        sagliktesti=(Button)findViewById(R.id.SaglikTestBtn);
        isimler=(Button)findViewById(R.id.namebtn);
        album=(Button)findViewById(R.id.albumbtn);
        ilactakip=(Button)findViewById(R.id.Drugbtn);
        ihtiyaclistesi=(Button)findViewById(R.id.ihtiyacbtn);
        back=(Button)findViewById(R.id.backbtn);
        dogumcantasi=(Button)findViewById(R.id.dogumcntasibtn);

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

        Options_Settings_SqlLite info = new Options_Settings_SqlLite(this);
        info.Info();
        String getinfo= info.getBabyname();
        getSupportActionBar().setTitle(getinfo +"-"+info.getBabyakraba());
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
            case R.id.backbtn:
               setBack();
                break;
        }
    }

    private void  Kg(){



        intent = new Intent(Options.this, Options_KgFollow.class);
        startActivity(intent);
        this.finish();

    }

    private void  Kasilma(){
        intent = new Intent(Options.this, Options_KasilmaSayar.class);
        startActivity(intent);
        this.finish();

    }
    private void  Tekme(){
        intent = new Intent(Options.this, Options_TekmeSayar.class);
        startActivity(intent);
        this.finish();

    }
    private void  Ayarlar(){
        intent = new Intent(Options.this, Options_Settings.class);
        startActivity(intent);
        this.finish();

    }

    private void  SaglikTesti(){

        intent = new Intent(Options.this, Options_Healt_Test.class);
        startActivity(intent);
        this.finish();
    }
    private void  setBack(){
        intent = new Intent(Options.this, MainActivity.class);
        startActivity(intent);
        this.finish();

    }

    private void isimler(){

        intent = new Intent(Options.this, Options_NameList.class);
        startActivity(intent);
        this.finish();
    }
    private void dogumcantasi(){
        intent = new Intent(Options.this, Options_DogumCantasi.class);
        startActivity(intent);
        this.finish();

    }
    private void ilactakip(){

     intent = new Intent(Options.this, Options_MedicinaFollow.class);
     startActivity(intent);
     this.finish();

    }
    private void album(){
     intent = new Intent(Options.this, Options_PhotoAlbum.class);
     startActivity(intent);
     this.finish();

    }
    private void ihtiyac(){
      intent = new Intent(Options.this, Options_IhtiyacListesi.class);
      startActivity(intent);
      this.finish();
    }
}
