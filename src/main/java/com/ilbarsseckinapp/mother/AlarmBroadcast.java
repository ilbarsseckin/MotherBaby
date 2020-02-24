package com.ilbarsseckinapp.mother;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.core.app.NotificationCompat;
import androidx.core.content.ContextCompat;
import androidx.legacy.content.WakefulBroadcastReceiver;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Set;


public class AlarmBroadcast extends WakefulBroadcastReceiver {
    private Options_MedicineFollow_SqlLite mHelper;

    /**
     * @param context
     * @param intent
     */
    @Override
    public void onReceive(final Context context, Intent intent) {
        String currentTime = new SimpleDateFormat("HH:mm", Locale.getDefault()).format(new Date());
        Options_MedicineFollow_SqlLite a = new Options_MedicineFollow_SqlLite(context);
        String data[] = a.gettime(currentTime).split("-");
        if(data[0].length()!=0) {

            Log.e("bensevdali", a.gettime(currentTime));
            NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            NotificationCompat.Builder builder = null;
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                int importance = NotificationManager.IMPORTANCE_HIGH;
                NotificationChannel notificationChannel = new NotificationChannel("ID", "Name", importance);
                notificationManager.createNotificationChannel(notificationChannel);
                builder = new NotificationCompat.Builder(context, notificationChannel.getId());
            } else {
                builder = new NotificationCompat.Builder(context);
            }


            builder = builder
                    .setSmallIcon(R.drawable.splashicon)
                    .setColor(ContextCompat.getColor(context, R.color.Beetle_Green))
                    .setContentTitle("İLAÇ ADI: " + data[0])
                    // .setTicker(context.getString(R.string.babysex))
                    .setContentText(data[1] + " KARNA İÇMEYİ UNUTMAYIN")
                    .setDefaults(Notification.DEFAULT_ALL)
                    .setAutoCancel(true);
            notificationManager.notify(0, builder.build());

            Intent i = new Intent(/*context,Login.class*/);
            i.setClassName("com.ilbarsseckinapp.mother", "com.ilbarsseckinapp.mother.MedicineNotification");
            i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(i);
        }
        Bundle bundle = intent.getExtras();
        String title = "";
      String msg = "";
        if (bundle != null) {
            Set<String> keys = intent.getExtras().keySet();

            for (String key : bundle.keySet()) {
                Object value = bundle.get(key);
                //   String RetailerName = bundle.getString("retailerName");
                Log.e("geceler", String.valueOf(value));
                String valueOfKey = String.valueOf(value);
                if (valueOfKey.substring(0, 1).equals("!")) {
                    title=valueOfKey.substring(1);
                    if (valueOfKey.substring(0, 1).equals("*")) {
                        msg=valueOfKey.substring(1);
                        NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
                        NotificationCompat.Builder builder = null;
                        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                            int importance = NotificationManager.IMPORTANCE_HIGH;
                            NotificationChannel notificationChannel = new NotificationChannel("ID", "Name", importance);
                            notificationManager.createNotificationChannel(notificationChannel);
                            builder = new NotificationCompat.Builder(context, notificationChannel.getId());
                        } else {
                            builder = new NotificationCompat.Builder(context);
                        }


                        builder = builder
                                .setSmallIcon(R.drawable.splashicon)
                                .setColor(ContextCompat.getColor(context, R.color.Beetle_Green))
                                .setContentTitle(title)
                                .setTicker(context.getString(R.string.babysex))
                                .setContentText(msg)
                                .setDefaults(Notification.DEFAULT_ALL)
                                .setAutoCancel(true);
                        notificationManager.notify(0, builder.build());
                    }




                }

            }


            Log.e("bensevdali", "saliha2");
        }

        Log.e("bensevdali", "saliha");
        String ol = "";






    }

    private void updateAlarm(Context context, String saat, String dakika, int RSQ) {
        AlarmManager alarmManager = null;
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(saat));
        calendar.set(Calendar.MINUTE, Integer.parseInt(dakika));
        Intent myIntent = new Intent(context, AlarmBroadcast.class);
        PendingIntent pendingIntent = PendingIntent.getBroadcast(context, RSQ, myIntent, 0);
        alarmManager.set(AlarmManager.RTC, calendar.getTimeInMillis(), pendingIntent);


    }
}