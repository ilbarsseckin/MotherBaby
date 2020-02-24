package com.ilbarsseckinapp.mother;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.Toolbar;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.squareup.picasso.Picasso;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Options_PhotoAlbum extends Activity implements View.OnClickListener {
    private static final int CAMERA_REQUEST = 1888;
    private ImageView imageView, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7, imageView8;
    private static final int MY_CAMERA_PERMISSION_CODE = 100;
    private static String picturePath = "";
    private static int order = 0;
    public  static File imagePath;
    BitmapDrawable bitmapDrawable;

    private ScrollView scrol;
    private Button share;
    @SuppressLint("WrongViewCast")
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.options_photoalbum);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setTitle("Foto Albüm");
        scrol=(ScrollView) findViewById(R.id.scroll);
        share=(Button)findViewById(R.id.share);
        share.setOnClickListener(this);
        imageView = (ImageView) this.findViewById(R.id.imageView);
        imageView2 = (ImageView) this.findViewById(R.id.imageView2);
        imageView3 = (ImageView) this.findViewById(R.id.imageView3);
        imageView4 = (ImageView) this.findViewById(R.id.imageView4);
        imageView5 = (ImageView) this.findViewById(R.id.imageView5);
        imageView6 = (ImageView) this.findViewById(R.id.imageView6);
        imageView7 = (ImageView) this.findViewById(R.id.imageView7);
        imageView8 = (ImageView) this.findViewById(R.id.imageView8);
        imageView.setOnClickListener(this);
        imageView2.setOnClickListener(this);
        imageView3.setOnClickListener(this);
        imageView4.setOnClickListener(this);
        imageView5.setOnClickListener(this);
        imageView6.setOnClickListener(this);
        imageView7.setOnClickListener(this);
        imageView8.setOnClickListener(this);


            boolean hasPermission = (ContextCompat.checkSelfPermission(getBaseContext(),
                    Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED);
            if (!hasPermission) {
                ActivityCompat.requestPermissions(this,
                        new String[]{Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE,
                                Manifest.permission.ACCESS_NETWORK_STATE, Manifest.permission.RECORD_AUDIO, Manifest.permission.MODIFY_AUDIO_SETTINGS, Manifest.permission.INTERNET
                        },
                        112);
            }




            display();


        share.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {


                View v = arg0.getRootView();
                Bitmap bitmap = screenShot(v);
                saveBitmap(bitmap);
                shareIt();
            }
        });
    }


    private void display() {

        String path = FileTask.readData("babyphoto1");
        if (path.length() > 6) {
            Picasso.with(this).load(new File(path)).fit().into(imageView);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView);
        }


        String path2 = FileTask.readData("babyphoto2");
        if (path2.length() > 6) {
            Picasso.with(this).load(new File(path2)).fit().into(imageView2);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView2);
        }

        String path3 = FileTask.readData("babyphoto3");
        if (path3.length() > 6) {
            Picasso.with(this).load(new File(path3)).fit().into(imageView3);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView3);
        }

        String path4 = FileTask.readData("babyphoto4");
        if (path4.length() > 6) {
            Picasso.with(this).load(new File(path4)).fit().into(imageView4);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView4);
        }

        String path5 = FileTask.readData("babyphoto5");
        if (path5.length() > 6) {
            Picasso.with(this).load(new File(path5)).fit().into(imageView5);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView5);
        }

        String path6 = FileTask.readData("babyphoto6");
        if (path6.length() > 6) {
            Picasso.with(this).load(new File(path6)).fit().into(imageView6);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView6);
        }

        String path7 = FileTask.readData("babyphoto7");
        if (path7.length() > 6) {
            Picasso.with(this).load(new File(path7)).fit().into(imageView7);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView7);
        }

        String path8 = FileTask.readData("babyphoto8");
        if (path8.length() > 6) {
            Picasso.with(this).load(new File(path8)).fit().into(imageView8);
        } else {
            Picasso.with(this).load(R.drawable.ultrasound).resize(150, 150).into(imageView8);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == MY_CAMERA_PERMISSION_CODE) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(this, "camera permission granted", Toast.LENGTH_LONG).show();
                Intent cameraIntent = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(cameraIntent, CAMERA_REQUEST);
            } else {
                Toast.makeText(this, "camera permission denied", Toast.LENGTH_LONG).show();
            }
        }
    }


    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.imageView:
                selectImage(this);
                order = 1;
                break;
            case R.id.imageView2:
                selectImage(this);
                order = 2;
                break;
            case R.id.imageView3:
                selectImage(this);
                order = 3;
                break;
            case R.id.imageView4:
                selectImage(this);
                order = 4;
                break;
            case R.id.imageView5:
                selectImage(this);
                order = 5;
                break;
            case R.id.imageView6:
                selectImage(this);
                order = 6;
                break;
            case R.id.imageView7:
                selectImage(this);
                order = 7;
                break;
            case R.id.imageView8:
                selectImage(this);
                order = 8;
                break;
        }
    }

    private void selectImage(Context context) {
        final CharSequence[] options = {"Fotoğraf Çek", "Albümden Seç", "İptal"};

        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle("Ultrason Fotoğrafı Seçin");

        builder.setItems(options, new DialogInterface.OnClickListener() {

            @Override
            public void onClick(DialogInterface dialog, int item) {

                if (options[item].equals("Fotoğraf Çek")) {
                    Intent takePicture = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
                    startActivityForResult(takePicture, 0);

                } else if (options[item].equals("Albümden Seç")) {
                    Intent pickPhoto = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                    startActivityForResult(pickPhoto, 1);//one can be replaced with any action code

                } else if (options[item].equals("İptal")) {
                    dialog.dismiss();
                }
            }
        });
        builder.show();
    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode != RESULT_CANCELED) {
            switch (requestCode) {
                case 0:
                    if (resultCode == RESULT_OK && data != null) {
                        Bitmap selectedImage = (Bitmap) data.getExtras().get("data");
                        imageView.setImageBitmap(selectedImage);
                    }

                    break;
                case 1:
                    if (resultCode == RESULT_OK && data != null) {
                        Uri selectedImage = data.getData();
                        String[] filePathColumn = {MediaStore.Images.Media.DATA};
                        if (selectedImage != null) {
                            Cursor cursor = getContentResolver().query(selectedImage,
                                    filePathColumn, null, null, null);
                            if (cursor != null) {
                                cursor.moveToFirst();
                                int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
                                Log.e("ceza", picturePath);

                                if (order == 1) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto1", picturePath);
                                }
                                if (order == 2) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView2.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto2", picturePath);
                                }
                                if (order == 3) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView3.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto3", picturePath);
                                }
                                if (order == 4) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView4.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto4", picturePath);
                                }
                                if (order == 5) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView5.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto5", picturePath);
                                }
                                if (order == 6) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView6.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto6", picturePath);
                                }
                                if (order == 7) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView7.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto7", picturePath);
                                }
                                if (order == 8) {
                                    picturePath = cursor.getString(columnIndex);
                                    imageView8.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                    FileTask.writeData("babyphoto8", picturePath);
                                }
                                cursor.close();
                            }
                        }

                    }
                    break;
            }
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_image_capture, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onBackPressed() {
        if(MainActivity.mainback==true){
            Intent intent = new Intent(Options_PhotoAlbum.this, MainActivity.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }else {
            Intent intent = new Intent(Options_PhotoAlbum.this, Options.class);
            startActivity(intent);
            this.finish();
            super.onBackPressed();
        }
    }


    public Bitmap screenShot(View view) {

        Bitmap bitmap = Bitmap.createBitmap(scrol.getChildAt(0).getWidth(), scrol.getChildAt(0).getHeight(), Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(bitmap);
        scrol.getChildAt(0).draw(c);
        return bitmap;
    }


    public void saveBitmap(Bitmap bitmap) {
        imagePath = new File(Environment.getExternalStorageDirectory() + "/screenshot.png");
        FileOutputStream fos;
        try {
            fos = new FileOutputStream(imagePath);
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, fos);
            fos.flush();
            fos.close();
        } catch (FileNotFoundException e) {
            Log.e("GREC", e.getMessage(), e);
        } catch (IOException e) {
            Log.e("GREC", e.getMessage(), e);
        }
    }
    private void shareIt() {
        Uri uri = Uri.fromFile(imagePath);
        Intent sharingIntent = new Intent(Intent.ACTION_SENDTO);
        sharingIntent.setType("image/*");
        String shareBody = "MyBaby";
        sharingIntent.setData(Uri.parse("mailto:"));
        sharingIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, "");
        sharingIntent.putExtra(android.content.Intent.EXTRA_TEXT, shareBody);
        sharingIntent.putExtra(Intent.EXTRA_STREAM, uri);
        startActivity(Intent.createChooser(sharingIntent, "Bebeğim"));

    }

}