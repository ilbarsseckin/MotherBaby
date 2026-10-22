# WorkManager / Room: release build'de açılış çökmesini önler
# (Failed to create an instance of androidx.work.impl.WorkDatabase)
-keep class * extends androidx.room.RoomDatabase { <init>(); }
-keep class androidx.work.impl.WorkDatabase_Impl { *; }
-keep class androidx.work.** { *; }
-dontwarn androidx.work.**

# flutter_local_notifications (zamanlanmış bildirimler Gson kullanır)
-keep class com.dexterous.** { *; }
-keep class com.google.gson.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
