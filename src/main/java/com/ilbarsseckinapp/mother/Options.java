package com.ilbarsseckinapp.mother;



import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;


public class Options extends AppCompatActivity implements View.OnClickListener {
    private ImageView Kgtakip, kasilmasayar, tekmesayar, ayarlar, sagliktesti, isimler, album, ilactakip,ihtiyaclistesi, dogumcantasi;
    private Intent intent;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options);

        Kgtakip = (ImageView) findViewById(R.id.kgbtn);
        kasilmasayar = (ImageView) findViewById(R.id.kasilmabtn);
        tekmesayar = (ImageView) findViewById(R.id.tekmebtn);
        sagliktesti = (ImageView) findViewById(R.id.testbtn);
        isimler = (ImageView) findViewById(R.id.namebtn);
        album = (ImageView) findViewById(R.id.fotobtn);
        ihtiyaclistesi = (ImageView) findViewById(R.id.ihtiyacbtn);
        dogumcantasi = (ImageView) findViewById(R.id.bagbtn);
        ilactakip = (ImageView) findViewById(R.id.ilacbtn);
        ayarlar = (ImageView) findViewById(R.id.ayarlarbtn);

        Kgtakip.setOnClickListener(this);
        kasilmasayar.setOnClickListener(this);
        tekmesayar.setOnClickListener(this);
        ayarlar.setOnClickListener(this);
        sagliktesti.setOnClickListener(this);
        isimler.setOnClickListener(this);
        album.setOnClickListener(this);
        ilactakip.setOnClickListener(this);
        ihtiyaclistesi.setOnClickListener(this);
        dogumcantasi.setOnClickListener(this);



    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.kgbtn:
                Kg();
                break;
            case R.id.kasilmabtn:
                Kasilma();
                break;
            case R.id.tekmebtn:
                Tekme();
                break;
            case R.id.ayarlarbtn:
                Ayarlar();
                break;
            case R.id.testbtn:
                SaglikTesti();
                break;
            case R.id.namebtn:
                isimler();
                break;
            case R.id.fotobtn:
                album();
                break;
            case R.id.ilacbtn:
                ilactakip();
                break;
            case R.id.ihtiyacbtn:
                ihtiyac();
                break;
            case R.id.bagbtn:
                dogumcantasi();
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
}
