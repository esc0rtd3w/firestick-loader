#!/system/bin/sh

mount -o rw,remount /system


# Google Services Framework
mkdir /system/priv-app/com.google.android.gms/
chmod 0755 /system/priv-app/com.google.android.gms/

cp /data/local/tmp/com.google.android.gms.apk /system/priv-app/com.google.android.gms/com.google.android.gms.apk

chown 0.0 /system/priv-app/com.google.android.gms/com.google.android.gms.apk
chmod 0644 /system/priv-app/com.google.android.gms/com.google.android.gms.apk


# Google Login
mkdir /system/priv-app/com.google.android.gsf.login/
chmod 0755 /system/priv-app/com.google.android.gsf.login/

cp /data/local/tmp/com.google.android.gsf.login.apk /system/priv-app/com.google.android.gsf.login/com.google.android.gsf.login.apk

chown 0.0 /system/priv-app/com.google.android.gsf.login/com.google.android.gsf.login.apk
chmod 0644 /system/priv-app/com.google.android.gsf.login/com.google.android.gsf.login.apk



mkdir /system/priv-app/ConfigUpdater/
chmod 0755 /system/priv-app/ConfigUpdater/

cp /data/local/tmp/ConfigUpdater.apk /system/priv-app/ConfigUpdater/ConfigUpdater.apk

chown 0.0 /system/priv-app/ConfigUpdater/ConfigUpdater.apk
chmod 0644 /system/priv-app/ConfigUpdater/ConfigUpdater.apk


mkdir /system/priv-app/GoogleBackupTransport/
chmod 0755 /system/priv-app/GoogleBackupTransport/

cp /data/local/tmp/GoogleBackupTransport.apk /system/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk

chown 0.0 /system/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk
chmod 0644 /system/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk


mkdir /system/priv-app/GoogleFeedback/
chmod 0755 /system/priv-app/GoogleFeedback/

cp /data/local/tmp/GoogleFeedback.apk /system/priv-app/GoogleFeedback/GoogleFeedback.apk

chown 0.0 /system/priv-app/GoogleFeedback/GoogleFeedback.apk
chmod 0644 /system/priv-app/GoogleFeedback/GoogleFeedback.apk


mkdir /system/priv-app/GoogleLoginService/
chmod 0755 /system/priv-app/GoogleLoginService/

cp /data/local/tmp/GoogleLoginService.apk /system/priv-app/GoogleLoginService/GoogleLoginService.apk

chown 0.0 /system/priv-app/GoogleLoginService/GoogleLoginService.apk
chmod 0644 /system/priv-app/GoogleLoginService/GoogleLoginService.apk


mkdir /system/priv-app/GoogleOneTimeInitializer/
chmod 0755 /system/priv-app/GoogleOneTimeInitializer/

cp /data/local/tmp/GoogleOneTimeInitializer.apk /system/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk

chown 0.0 /system/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk
chmod 0644 /system/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk


mkdir /system/app/GoogleContactsSyncAdapter/
chmod 0755 /system/app/GoogleContactsSyncAdapter/

cp /data/local/tmp/GoogleContactsSyncAdapter.apk /system/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk

chown 0.0 /system/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
chmod 0644 /system/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk


mkdir /system/priv-app/GooglePartnerSetup/
chmod 0755 /system/priv-app/GooglePartnerSetup/

cp /data/local/tmp/GooglePartnerSetup.apk /system/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk

chown 0.0 /system/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk
chmod 0644 /system/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk


mkdir /system/priv-app/GoogleServicesFramework/
chmod 0755 /system/priv-app/GoogleServicesFramework/

cp /data/local/tmp/GoogleServicesFramework.apk /system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk

chown 0.0 /system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
chmod 0644 /system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk


mkdir /system/priv-app/PrebuiltGmsCore/
chmod 0755 /system/priv-app/PrebuiltGmsCore/

cp /data/local/tmp/PrebuiltGmsCore.apk /system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk

chown 0.0 /system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk
chmod 0644 /system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk


mkdir /system/priv-app/Phonesky/
chmod 0755 /system/priv-app/Phonesky/

cp /data/local/tmp/Phonesky.apk /system/priv-app/Phonesky/Phonesky.apk

chown 0.0 /system/priv-app/Phonesky/Phonesky.apk
chmod 0644 /system/priv-app/Phonesky/Phonesky.apk

#pm install /data/local/tmp/Phonesky.apk



pm grant com.google.android.gms android.permission.INTERACT_ACROSS_USERS


