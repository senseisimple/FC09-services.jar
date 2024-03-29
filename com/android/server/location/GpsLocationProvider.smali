.class public Lcom/android/server/location/GpsLocationProvider;
.super Ljava/lang/Object;
.source "GpsLocationProvider.java"

# interfaces
.implements Lcom/android/server/location/LocationProviderInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/location/GpsLocationProvider$GpsLocationProviderThread;,
        Lcom/android/server/location/GpsLocationProvider$ProviderHandler;,
        Lcom/android/server/location/GpsLocationProvider$SensorAiding;,
        Lcom/android/server/location/GpsLocationProvider$Listener;
    }
.end annotation


# static fields
.field private static final ADD_LISTENER:I = 0x8

.field private static final AGPS_DATA_CONNECTION_CLOSED:I = 0x0

.field private static final AGPS_DATA_CONNECTION_OPEN:I = 0x2

.field private static final AGPS_DATA_CONNECTION_OPENING:I = 0x1

.field private static final AGPS_REF_LOCATION_TYPE_GSM_CELLID:I = 0x1

.field private static final AGPS_REF_LOCATION_TYPE_UMTS_CELLID:I = 0x2

.field private static final AGPS_REG_LOCATION_TYPE_MAC:I = 0x3

.field private static final AGPS_RIL_REQUEST_REFLOC_CELLID:I = 0x1

.field private static final AGPS_RIL_REQUEST_REFLOC_MAC:I = 0x2

.field private static final AGPS_RIL_REQUEST_SETID_IMSI:I = 0x1

.field private static final AGPS_RIL_REQUEST_SETID_MSISDN:I = 0x2

.field private static final AGPS_SETID_TYPE_IMSI:I = 0x1

.field private static final AGPS_SETID_TYPE_MSISDN:I = 0x2

.field private static final AGPS_SETID_TYPE_NONE:I = 0x0

.field private static final AGPS_TYPE_C2K:I = 0x2

.field private static final AGPS_TYPE_SUPL:I = 0x1

.field private static final ALARM_TIMEOUT:Ljava/lang/String; = "com.android.internal.location.ALARM_TIMEOUT"

.field private static final ALARM_WAKEUP:Ljava/lang/String; = "com.android.internal.location.ALARM_WAKEUP"

.field private static final ALMANAC_MASK:I = 0x1

.field private static final CHECK_LOCATION:I = 0x1

.field private static final DEBUG:Z = true

.field private static final DOWNLOAD_XTRA_DATA:I = 0x6

.field private static final ENABLE:I = 0x2

.field private static final ENABLE_TRACKING:I = 0x3

.field private static final EPHEMERIS_MASK:I = 0x0

.field private static final GPS_AGPS_DATA_CONNECTED:I = 0x3

.field private static final GPS_AGPS_DATA_CONN_DONE:I = 0x4

.field private static final GPS_AGPS_DATA_CONN_FAILED:I = 0x5

.field private static final GPS_CAPABILITY_MSA:I = 0x4

.field private static final GPS_CAPABILITY_MSB:I = 0x2

.field private static final GPS_CAPABILITY_SCHEDULING:I = 0x1

.field private static final GPS_CAPABILITY_SINGLE_SHOT:I = 0x8

.field private static final GPS_DELETE_ALL:I = 0xffff

.field private static final GPS_DELETE_ALMANAC:I = 0x2

.field private static final GPS_DELETE_CELLDB_INFO:I = 0x8000

.field private static final GPS_DELETE_EPHEMERIS:I = 0x1

.field private static final GPS_DELETE_HEALTH:I = 0x40

.field private static final GPS_DELETE_IONO:I = 0x10

.field private static final GPS_DELETE_POSITION:I = 0x4

.field private static final GPS_DELETE_RTI:I = 0x400

.field private static final GPS_DELETE_SADATA:I = 0x200

.field private static final GPS_DELETE_SVDIR:I = 0x80

.field private static final GPS_DELETE_SVSTEER:I = 0x100

.field private static final GPS_DELETE_TIME:I = 0x8

.field private static final GPS_DELETE_UTC:I = 0x20

.field private static final GPS_POSITION_MODE_MS_ASSISTED:I = 0x2

.field private static final GPS_POSITION_MODE_MS_BASED:I = 0x1

.field private static final GPS_POSITION_MODE_STANDALONE:I = 0x0

.field private static final GPS_POSITION_RECURRENCE_PERIODIC:I = 0x0

.field private static final GPS_POSITION_RECURRENCE_SINGLE:I = 0x1

.field private static final GPS_RELEASE_AGPS_DATA_CONN:I = 0x2

.field private static final GPS_REQUEST_AGPS_DATA_CONN:I = 0x1

.field private static final GPS_STATUS_ENGINE_OFF:I = 0x4

.field private static final GPS_STATUS_ENGINE_ON:I = 0x3

.field private static final GPS_STATUS_NONE:I = 0x0

.field private static final GPS_STATUS_SESSION_BEGIN:I = 0x1

.field private static final GPS_STATUS_SESSION_END:I = 0x2

.field private static final INJECT_NTP_TIME:I = 0x5

.field private static final LOCATION_HAS_ACCURACY:I = 0x10

.field private static final LOCATION_HAS_ALTITUDE:I = 0x2

.field private static final LOCATION_HAS_BEARING:I = 0x8

.field private static final LOCATION_HAS_LAT_LONG:I = 0x1

.field private static final LOCATION_HAS_SPEED:I = 0x4

.field private static final LOCATION_INVALID:I = 0x0

.field private static final MAX_NTP_SYSTEM_TIME_OFFSET:J = 0x493e0L

.field private static final MAX_SVS:I = 0x20

.field private static final NO_FIX_TIMEOUT:I = 0xea60

.field private static final NTP_INTERVAL:J = 0xdbba00L

.field private static final PROPERTIES_FILE:Ljava/lang/String; = "/etc/gps.conf"

.field private static final RECENT_FIX_TIMEOUT:J = 0x2710L

.field private static final REMOVE_LISTENER:I = 0x9

.field private static final REQUEST_SINGLE_SHOT:I = 0xa

.field private static final RETRY_INTERVAL:J = 0x493e0L

.field private static final TAG:Ljava/lang/String; = "GpsLocationProvider"

.field private static final UPDATE_LOCATION:I = 0x7

.field private static final UPDATE_NETWORK_STATE:I = 0x4

.field private static final USED_FOR_FIX_MASK:I = 0x2

.field private static final VERBOSE:Z = false

.field private static final WAKELOCK_KEY:Ljava/lang/String; = "GpsLocationProvider"


# instance fields
.field private addr:Ljava/lang/String;

.field private cscgps:I

.field private mAGpsApn:Ljava/lang/String;

.field private mAGpsDataConnectionState:I

.field private final mAlarmManager:Landroid/app/AlarmManager;

.field private final mBatteryStats:Lcom/android/internal/app/IBatteryStats;

.field private final mBroadcastReciever:Landroid/content/BroadcastReceiver;

.field private mC2KServerHost:Ljava/lang/String;

.field private mC2KServerPort:I

.field private final mClientUids:Landroid/util/SparseIntArray;

.field private final mConnMgr:Landroid/net/ConnectivityManager;

.field private final mContext:Landroid/content/Context;

.field private mDownloadXtraDataPending:Z

.field private volatile mEnabled:Z

.field private mEngineCapabilities:I

.field private mEngineOn:Z

.field private mFixInterval:I

.field private mFixRequestTime:J

.field private final mGpsStatusProvider:Landroid/location/IGpsStatusProvider;

.field private mHandler:Landroid/os/Handler;

.field private final mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

.field private mInjectNtpTimePending:Z

.field private mLastFixTime:J

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/location/GpsLocationProvider$Listener;",
            ">;"
        }
    .end annotation
.end field

.field private mLocation:Landroid/location/Location;

.field private mLocationExtras:Landroid/os/Bundle;

.field private mLocationFlags:I

.field private final mLocationManager:Landroid/location/ILocationManager;

.field private final mNIHandler:Lcom/android/internal/location/GpsNetInitiatedHandler;

.field private mNavigating:Z

.field private final mNetInitiatedListener:Landroid/location/INetInitiatedListener;

.field private mNetworkAvailable:Z

.field private mNmeaBuffer:[B

.field private mNtpServer:Ljava/lang/String;

.field private mPendingListenerMessages:I

.field private mPendingMessageBits:I

.field private mPositionMode:I

.field private mProperties:Ljava/util/Properties;

.field private mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

.field private mSingleShot:Z

.field private mSnrs:[F

.field private mStarted:Z

.field private mStatus:I

.field private mStatusUpdateTime:J

.field private mSuplServerHost:Ljava/lang/String;

.field private mSuplServerPort:I

.field private mSupportsXtra:Z

.field private mSvAzimuths:[F

.field private mSvCount:I

.field private mSvElevations:[F

.field private mSvMasks:[I

.field private mSvs:[I

.field private mTTFF:I

.field private final mThread:Ljava/lang/Thread;

.field private final mTimeoutIntent:Landroid/app/PendingIntent;

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private final mWakeupIntent:Landroid/app/PendingIntent;

.field private operation:Ljava/lang/String;

.field private port:I

.field private ssl:I

.field private ssl_cert:I


# direct methods
.method static constructor <clinit>()V
    .registers 0

    .prologue
    .line 2903
    invoke-static {}, Lcom/android/server/location/GpsLocationProvider;->class_init_native()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/location/ILocationManager;)V
    .registers 16
    .parameter "context"
    .parameter "locationManager"

    .prologue
    const/4 v12, 0x0

    const/16 v11, 0x20

    const/4 v8, 0x1

    const/4 v9, 0x0

    const-string v10, "GpsLocationProvider"

    .line 401
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    iput v9, p0, Lcom/android/server/location/GpsLocationProvider;->mLocationFlags:I

    .line 193
    iput v8, p0, Lcom/android/server/location/GpsLocationProvider;->mStatus:I

    .line 196
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/server/location/GpsLocationProvider;->mStatusUpdateTime:J

    .line 212
    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mInjectNtpTimePending:Z

    .line 213
    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mDownloadXtraDataPending:Z

    .line 216
    iput-boolean v9, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    .line 219
    iput-boolean v9, p0, Lcom/android/server/location/GpsLocationProvider;->mEngineOn:Z

    .line 222
    const/16 v6, 0x3e8

    iput v6, p0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    .line 225
    iput-boolean v9, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    .line 237
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Lcom/android/server/location/GpsLocationProvider;->mFixRequestTime:J

    .line 239
    iput v9, p0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    .line 251
    iput v9, p0, Lcom/android/server/location/GpsLocationProvider;->cscgps:I

    .line 263
    new-instance v6, Landroid/location/Location;

    const-string v7, "gps"

    invoke-direct {v6, v7}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    .line 264
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mLocationExtras:Landroid/os/Bundle;

    .line 265
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    .line 272
    new-instance v6, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v6, v8}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

    .line 297
    new-instance v6, Landroid/util/SparseIntArray;

    invoke-direct {v6}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    .line 310
    new-instance v6, Lcom/android/server/location/GpsLocationProvider$1;

    invoke-direct {v6, p0}, Lcom/android/server/location/GpsLocationProvider$1;-><init>(Lcom/android/server/location/GpsLocationProvider;)V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mGpsStatusProvider:Landroid/location/IGpsStatusProvider;

    .line 361
    new-instance v6, Lcom/android/server/location/GpsLocationProvider$2;

    invoke-direct {v6, p0}, Lcom/android/server/location/GpsLocationProvider$2;-><init>(Lcom/android/server/location/GpsLocationProvider;)V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mBroadcastReciever:Landroid/content/BroadcastReceiver;

    .line 1417
    iput-object v12, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    .line 2627
    new-instance v6, Lcom/android/server/location/GpsLocationProvider$3;

    invoke-direct {v6, p0}, Lcom/android/server/location/GpsLocationProvider$3;-><init>(Lcom/android/server/location/GpsLocationProvider;)V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mNetInitiatedListener:Landroid/location/INetInitiatedListener;

    .line 2894
    new-array v6, v11, [I

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSvs:[I

    .line 2895
    new-array v6, v11, [F

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSnrs:[F

    .line 2896
    new-array v6, v11, [F

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSvElevations:[F

    .line 2897
    new-array v6, v11, [F

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSvAzimuths:[F

    .line 2898
    const/4 v6, 0x3

    new-array v6, v6, [I

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSvMasks:[I

    .line 2901
    const/16 v6, 0x78

    new-array v6, v6, [B

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mNmeaBuffer:[B

    .line 402
    iput-object p1, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    .line 403
    iput-object p2, p0, Lcom/android/server/location/GpsLocationProvider;->mLocationManager:Landroid/location/ILocationManager;

    .line 404
    new-instance v6, Lcom/android/internal/location/GpsNetInitiatedHandler;

    invoke-direct {v6, p1}, Lcom/android/internal/location/GpsNetInitiatedHandler;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mNIHandler:Lcom/android/internal/location/GpsNetInitiatedHandler;

    .line 406
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mLocationExtras:Landroid/os/Bundle;

    invoke-virtual {v6, v7}, Landroid/location/Location;->setExtras(Landroid/os/Bundle;)V

    .line 409
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    const-string v7, "power"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    .line 410
    .local v4, powerManager:Landroid/os/PowerManager;
    const-string v6, "GpsLocationProvider"

    invoke-virtual {v4, v8, v10}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 411
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6, v9}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 413
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    const-string v7, "alarm"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/AlarmManager;

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    .line 414
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    new-instance v7, Landroid/content/Intent;

    const-string v8, "com.android.internal.location.ALARM_WAKEUP"

    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v6, v9, v7, v9}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeupIntent:Landroid/app/PendingIntent;

    .line 415
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    new-instance v7, Landroid/content/Intent;

    const-string v8, "com.android.internal.location.ALARM_TIMEOUT"

    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v6, v9, v7, v9}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mTimeoutIntent:Landroid/app/PendingIntent;

    .line 417
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 418
    .local v2, intentFilter:Landroid/content/IntentFilter;
    const-string v6, "android.intent.action.DATA_SMS_RECEIVED"

    invoke-virtual {v2, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 419
    const-string v6, "sms"

    invoke-virtual {v2, v6}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 420
    const-string v6, "localhost"

    const-string v7, "7275"

    invoke-virtual {v2, v6, v7}, Landroid/content/IntentFilter;->addDataAuthority(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mBroadcastReciever:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v6, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 423
    new-instance v2, Landroid/content/IntentFilter;

    .end local v2           #intentFilter:Landroid/content/IntentFilter;
    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 424
    .restart local v2       #intentFilter:Landroid/content/IntentFilter;
    const-string v6, "android.provider.Telephony.WAP_PUSH_RECEIVED"

    invoke-virtual {v2, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 426
    :try_start_f9
    const-string v6, "application/vnd.omaloc-supl-init"

    invoke-virtual {v2, v6}, Landroid/content/IntentFilter;->addDataType(Ljava/lang/String;)V
    :try_end_fe
    .catch Landroid/content/IntentFilter$MalformedMimeTypeException; {:try_start_f9 .. :try_end_fe} :catch_18d

    .line 430
    :goto_fe
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mBroadcastReciever:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v6, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 432
    const-string v6, "connectivity"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/ConnectivityManager;

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mConnMgr:Landroid/net/ConnectivityManager;

    .line 435
    const-string v6, "batteryinfo"

    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v6

    invoke-static {v6}, Lcom/android/internal/app/IBatteryStats$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IBatteryStats;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    .line 437
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    .line 439
    :try_start_120
    new-instance v1, Ljava/io/File;

    const-string v6, "/etc/gps.conf"

    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 440
    .local v1, file:Ljava/io/File;
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 441
    .local v5, stream:Ljava/io/FileInputStream;
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    invoke-virtual {v6, v5}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 442
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 443
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    const-string v7, "NTP_SERVER"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mNtpServer:Ljava/lang/String;

    .line 445
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    const-string v7, "SUPL_HOST"

    invoke-virtual {v6, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSuplServerHost:Ljava/lang/String;

    .line 446
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    const-string v7, "SUPL_PORT"

    invoke-virtual {v6, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 447
    .local v3, portString:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSuplServerHost:Ljava/lang/String;
    :try_end_153
    .catch Ljava/io/IOException; {:try_start_120 .. :try_end_153} :catch_1b3

    if-eqz v6, :cond_15d

    if-eqz v3, :cond_15d

    .line 449
    :try_start_157
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSuplServerPort:I
    :try_end_15d
    .catch Ljava/lang/NumberFormatException; {:try_start_157 .. :try_end_15d} :catch_198
    .catch Ljava/io/IOException; {:try_start_157 .. :try_end_15d} :catch_1b3

    .line 455
    :cond_15d
    :goto_15d
    :try_start_15d
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    const-string v7, "C2K_HOST"

    invoke-virtual {v6, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mC2KServerHost:Ljava/lang/String;

    .line 456
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    const-string v7, "C2K_PORT"

    invoke-virtual {v6, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 457
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mC2KServerHost:Ljava/lang/String;
    :try_end_171
    .catch Ljava/io/IOException; {:try_start_15d .. :try_end_171} :catch_1b3

    if-eqz v6, :cond_17b

    if-eqz v3, :cond_17b

    .line 459
    :try_start_175
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/android/server/location/GpsLocationProvider;->mC2KServerPort:I
    :try_end_17b
    .catch Ljava/lang/NumberFormatException; {:try_start_175 .. :try_end_17b} :catch_1bd
    .catch Ljava/io/IOException; {:try_start_175 .. :try_end_17b} :catch_1b3

    .line 469
    .end local v1           #file:Ljava/io/File;
    .end local v3           #portString:Ljava/lang/String;
    .end local v5           #stream:Ljava/io/FileInputStream;
    :cond_17b
    :goto_17b
    new-instance v6, Lcom/android/server/location/GpsLocationProvider$GpsLocationProviderThread;

    invoke-direct {v6, p0}, Lcom/android/server/location/GpsLocationProvider$GpsLocationProviderThread;-><init>(Lcom/android/server/location/GpsLocationProvider;)V

    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mThread:Ljava/lang/Thread;

    .line 470
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mThread:Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 473
    :goto_187
    :try_start_187
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v6}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_18c
    .catch Ljava/lang/InterruptedException; {:try_start_187 .. :try_end_18c} :catch_1d8

    .line 479
    return-void

    .line 427
    :catch_18d
    move-exception v6

    move-object v0, v6

    .line 428
    .local v0, e:Landroid/content/IntentFilter$MalformedMimeTypeException;
    const-string v6, "GpsLocationProvider"

    const-string v6, "Malformed SUPL init mime type"

    invoke-static {v10, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_fe

    .line 450
    .end local v0           #e:Landroid/content/IntentFilter$MalformedMimeTypeException;
    .restart local v1       #file:Ljava/io/File;
    .restart local v3       #portString:Ljava/lang/String;
    .restart local v5       #stream:Ljava/io/FileInputStream;
    :catch_198
    move-exception v6

    move-object v0, v6

    .line 451
    .local v0, e:Ljava/lang/NumberFormatException;
    :try_start_19a
    const-string v6, "GpsLocationProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unable to parse SUPL_PORT: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1b2
    .catch Ljava/io/IOException; {:try_start_19a .. :try_end_1b2} :catch_1b3

    goto :goto_15d

    .line 464
    .end local v0           #e:Ljava/lang/NumberFormatException;
    .end local v1           #file:Ljava/io/File;
    .end local v3           #portString:Ljava/lang/String;
    .end local v5           #stream:Ljava/io/FileInputStream;
    :catch_1b3
    move-exception v6

    move-object v0, v6

    .line 465
    .local v0, e:Ljava/io/IOException;
    const-string v6, "GpsLocationProvider"

    const-string v6, "Could not open GPS configuration file /etc/gps.conf"

    invoke-static {v10, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17b

    .line 460
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #file:Ljava/io/File;
    .restart local v3       #portString:Ljava/lang/String;
    .restart local v5       #stream:Ljava/io/FileInputStream;
    :catch_1bd
    move-exception v6

    move-object v0, v6

    .line 461
    .local v0, e:Ljava/lang/NumberFormatException;
    :try_start_1bf
    const-string v6, "GpsLocationProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unable to parse C2K_PORT: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1d7
    .catch Ljava/io/IOException; {:try_start_1bf .. :try_end_1d7} :catch_1b3

    goto :goto_17b

    .line 475
    .end local v0           #e:Ljava/lang/NumberFormatException;
    .end local v1           #file:Ljava/io/File;
    .end local v3           #portString:Ljava/lang/String;
    .end local v5           #stream:Ljava/io/FileInputStream;
    :catch_1d8
    move-exception v6

    move-object v0, v6

    .line 476
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    goto :goto_187
.end method

.method static synthetic access$000(Lcom/android/server/location/GpsLocationProvider;)Ljava/util/ArrayList;
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/location/GpsLocationProvider;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->startNavigating(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->hibernate()V

    return-void
.end method

.method static synthetic access$2000(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/android/server/location/GpsLocationProvider;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_initialize(I)V

    return-void
.end method

.method static synthetic access$2200(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_finalize()V

    return-void
.end method

.method static synthetic access$2300(Lcom/android/server/location/GpsLocationProvider;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mPositionMode:I

    return v0
.end method

.method static synthetic access$2400(Lcom/android/server/location/GpsLocationProvider;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    return v0
.end method

.method static synthetic access$2402(Lcom/android/server/location/GpsLocationProvider;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    iput p1, p0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    return p1
.end method

.method static synthetic access$2500(Lcom/android/server/location/GpsLocationProvider;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    return v0
.end method

.method static synthetic access$2600(Lcom/android/server/location/GpsLocationProvider;)[I
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSvMasks:[I

    return-object v0
.end method

.method static synthetic access$2700(Lcom/android/server/location/GpsLocationProvider;)[I
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSvs:[I

    return-object v0
.end method

.method static synthetic access$2800(Lcom/android/server/location/GpsLocationProvider;)[F
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSnrs:[F

    return-object v0
.end method

.method static synthetic access$2900(Lcom/android/server/location/GpsLocationProvider;)[F
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSvElevations:[F

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/server/location/GpsLocationProvider;)Lcom/android/server/location/GpsLocationProvider$SensorAiding;
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/android/server/location/GpsLocationProvider;)[F
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSvAzimuths:[F

    return-object v0
.end method

.method static synthetic access$3100(Lcom/android/server/location/GpsLocationProvider;[D[F[IJII)V
    .registers 8
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .parameter "x6"

    .prologue
    .line 88
    invoke-direct/range {p0 .. p7}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_deliver_gps_data([D[F[IJII)V

    return-void
.end method

.method static synthetic access$3200(Lcom/android/server/location/GpsLocationProvider;[D[F[I)Z
    .registers 5
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_request_gps_data([D[F[I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3300(Lcom/android/server/location/GpsLocationProvider;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_deliver_rotation_data(I)V

    return-void
.end method

.method static synthetic access$3400(Lcom/android/server/location/GpsLocationProvider;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_support_inverse_portrait_mode(I)V

    return-void
.end method

.method static synthetic access$3500(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_deliver_sv_status()V

    return-void
.end method

.method static synthetic access$3600(Lcom/android/server/location/GpsLocationProvider;[[F[[F[[F[J[J)I
    .registers 7
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 88
    invoke-direct/range {p0 .. p5}, Lcom/android/server/location/GpsLocationProvider;->native_hybrid_gps_deliver_sensors_data([[F[[F[[F[J[J)I

    move-result v0

    return v0
.end method

.method static synthetic access$3700(Lcom/android/server/location/GpsLocationProvider;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    return v0
.end method

.method static synthetic access$3702(Lcom/android/server/location/GpsLocationProvider;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    iput-boolean p1, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    return p1
.end method

.method static synthetic access$3800(Lcom/android/server/location/GpsLocationProvider;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_stop()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3900(Lcom/android/server/location/GpsLocationProvider;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSvCount:I

    return v0
.end method

.method static synthetic access$4000(Lcom/android/server/location/GpsLocationProvider;II)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/android/server/location/GpsLocationProvider;->updateStatus(II)V

    return-void
.end method

.method static synthetic access$4102(Lcom/android/server/location/GpsLocationProvider;J)J
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    iput-wide p1, p0, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    return-wide p1
.end method

.method static synthetic access$4202(Lcom/android/server/location/GpsLocationProvider;J)J
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    iput-wide p1, p0, Lcom/android/server/location/GpsLocationProvider;->mFixRequestTime:J

    return-wide p1
.end method

.method static synthetic access$4300(Lcom/android/server/location/GpsLocationProvider;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_start()Z

    move-result v0

    return v0
.end method

.method static synthetic access$4400(Lcom/android/server/location/GpsLocationProvider;IDDDFFFJ)V
    .registers 13
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .parameter "x6"
    .parameter "x7"
    .parameter "x8"

    .prologue
    .line 88
    invoke-direct/range {p0 .. p12}, Lcom/android/server/location/GpsLocationProvider;->reportLocation(IDDDFFFJ)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/location/GpsLocationProvider;Landroid/content/Intent;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->checkSmsSuplInit(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$5600(Lcom/android/server/location/GpsLocationProvider;J)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/android/server/location/GpsLocationProvider;->reportNmea(J)V

    return-void
.end method

.method static synthetic access$5700(Lcom/android/server/location/GpsLocationProvider;II)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/android/server/location/GpsLocationProvider;->native_send_ni_response(II)V

    return-void
.end method

.method static synthetic access$5800(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->handleEnable()V

    return-void
.end method

.method static synthetic access$5900(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->handleDisable()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/server/location/GpsLocationProvider;Landroid/content/Intent;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->checkWapSuplInit(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$6000(Lcom/android/server/location/GpsLocationProvider;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->handleEnableLocationTracking(Z)V

    return-void
.end method

.method static synthetic access$6100(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->handleRequestSingleShot()V

    return-void
.end method

.method static synthetic access$6200(Lcom/android/server/location/GpsLocationProvider;ILandroid/net/NetworkInfo;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/android/server/location/GpsLocationProvider;->handleUpdateNetworkState(ILandroid/net/NetworkInfo;)V

    return-void
.end method

.method static synthetic access$6300(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->handleInjectNtpTime()V

    return-void
.end method

.method static synthetic access$6400(Lcom/android/server/location/GpsLocationProvider;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSupportsXtra:Z

    return v0
.end method

.method static synthetic access$6500(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->handleDownloadXtraData()V

    return-void
.end method

.method static synthetic access$6600(Lcom/android/server/location/GpsLocationProvider;Landroid/location/Location;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->handleUpdateLocation(Landroid/location/Location;)V

    return-void
.end method

.method static synthetic access$6700(Lcom/android/server/location/GpsLocationProvider;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->handleAddListener(I)V

    return-void
.end method

.method static synthetic access$6800(Lcom/android/server/location/GpsLocationProvider;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider;->handleRemoveListener(I)V

    return-void
.end method

.method static synthetic access$6900(Lcom/android/server/location/GpsLocationProvider;)Landroid/os/PowerManager$WakeLock;
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$7000(Lcom/android/server/location/GpsLocationProvider;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingMessageBits:I

    return v0
.end method

.method static synthetic access$7072(Lcom/android/server/location/GpsLocationProvider;I)I
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingMessageBits:I

    and-int/2addr v0, p1

    iput v0, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingMessageBits:I

    return v0
.end method

.method static synthetic access$7100(Lcom/android/server/location/GpsLocationProvider;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingListenerMessages:I

    return v0
.end method

.method static synthetic access$7110(Lcom/android/server/location/GpsLocationProvider;)I
    .registers 3
    .parameter "x0"

    .prologue
    .line 88
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingListenerMessages:I

    const/4 v1, 0x1

    sub-int v1, v0, v1

    iput v1, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingListenerMessages:I

    return v0
.end method

.method static synthetic access$7200(Lcom/android/server/location/GpsLocationProvider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->initialize()V

    return-void
.end method

.method static synthetic access$7302(Lcom/android/server/location/GpsLocationProvider;Landroid/os/Handler;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    iput-object p1, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    return-object p1
.end method

.method static synthetic access$7500(Lcom/android/server/location/GpsLocationProvider;)Ljava/util/concurrent/CountDownLatch;
    .registers 2
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method

.method private checkSmsSuplInit(Landroid/content/Intent;)V
    .registers 6
    .parameter "intent"

    .prologue
    .line 385
    invoke-static {p1}, Landroid/provider/Telephony$Sms$Intents;->getMessagesFromIntent(Landroid/content/Intent;)[Landroid/telephony/SmsMessage;

    move-result-object v1

    .line 386
    .local v1, messages:[Landroid/telephony/SmsMessage;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_5
    array-length v3, v1

    if-ge v0, v3, :cond_15

    .line 387
    aget-object v3, v1, v0

    invoke-virtual {v3}, Landroid/telephony/SmsMessage;->getUserData()[B

    move-result-object v2

    .line 388
    .local v2, supl_init:[B
    array-length v3, v2

    invoke-direct {p0, v2, v3}, Lcom/android/server/location/GpsLocationProvider;->native_agps_ni_message([BI)V

    .line 386
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 390
    .end local v2           #supl_init:[B
    :cond_15
    return-void
.end method

.method private checkWapSuplInit(Landroid/content/Intent;)V
    .registers 5
    .parameter "intent"

    .prologue
    .line 393
    const-string v2, "data"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    move-object v0, v2

    check-cast v0, [B

    move-object v1, v0

    .line 394
    .local v1, supl_init:[B
    array-length v2, v1

    invoke-direct {p0, v1, v2}, Lcom/android/server/location/GpsLocationProvider;->native_agps_ni_message([BI)V

    .line 395
    return-void
.end method

.method private static native class_init_native()V
.end method

.method private deleteAidingData(Landroid/os/Bundle;)Z
    .registers 4
    .parameter "extras"

    .prologue
    .line 960
    if-nez p1, :cond_c

    .line 961
    const v0, 0xffff

    .line 979
    .local v0, flags:I
    :cond_5
    :goto_5
    if-eqz v0, :cond_95

    .line 980
    invoke-direct {p0, v0}, Lcom/android/server/location/GpsLocationProvider;->native_delete_aiding_data(I)V

    .line 981
    const/4 v1, 0x1

    .line 984
    :goto_b
    return v1

    .line 963
    .end local v0           #flags:I
    :cond_c
    const/4 v0, 0x0

    .line 964
    .restart local v0       #flags:I
    const-string v1, "ephemeris"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    or-int/lit8 v0, v0, 0x1

    .line 965
    :cond_17
    const-string v1, "almanac"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    or-int/lit8 v0, v0, 0x2

    .line 966
    :cond_21
    const-string v1, "position"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    or-int/lit8 v0, v0, 0x4

    .line 967
    :cond_2b
    const-string v1, "time"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    or-int/lit8 v0, v0, 0x8

    .line 968
    :cond_35
    const-string v1, "iono"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3f

    or-int/lit8 v0, v0, 0x10

    .line 969
    :cond_3f
    const-string v1, "utc"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_49

    or-int/lit8 v0, v0, 0x20

    .line 970
    :cond_49
    const-string v1, "health"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_53

    or-int/lit8 v0, v0, 0x40

    .line 971
    :cond_53
    const-string v1, "svdir"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5d

    or-int/lit16 v0, v0, 0x80

    .line 972
    :cond_5d
    const-string v1, "svsteer"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_67

    or-int/lit16 v0, v0, 0x100

    .line 973
    :cond_67
    const-string v1, "sadata"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_71

    or-int/lit16 v0, v0, 0x200

    .line 974
    :cond_71
    const-string v1, "rti"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7b

    or-int/lit16 v0, v0, 0x400

    .line 975
    :cond_7b
    const-string v1, "celldb-info"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_87

    const v1, 0x8000

    or-int/2addr v0, v1

    .line 976
    :cond_87
    const-string v1, "all"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const v1, 0xffff

    or-int/2addr v0, v1

    goto/16 :goto_5

    .line 984
    :cond_95
    const/4 v1, 0x0

    goto/16 :goto_b
.end method

.method private handleAddListener(I)V
    .registers 7
    .parameter "uid"

    .prologue
    const-string v1, "GpsLocationProvider"

    .line 881
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 882
    :try_start_5
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v2

    if-ltz v2, :cond_27

    .line 884
    const-string v2, "GpsLocationProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Duplicate add listener for uid "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 885
    monitor-exit v1

    .line 896
    :goto_26
    return-void

    .line 887
    :cond_27
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 888
    iget-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z
    :try_end_2f
    .catchall {:try_start_5 .. :try_end_2f} :catchall_38

    if-eqz v2, :cond_36

    .line 890
    :try_start_31
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v2, p1}, Lcom/android/internal/app/IBatteryStats;->noteStartGps(I)V
    :try_end_36
    .catchall {:try_start_31 .. :try_end_36} :catchall_38
    .catch Landroid/os/RemoteException; {:try_start_31 .. :try_end_36} :catch_3b

    .line 895
    :cond_36
    :goto_36
    :try_start_36
    monitor-exit v1

    goto :goto_26

    :catchall_38
    move-exception v2

    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_36 .. :try_end_3a} :catchall_38

    throw v2

    .line 891
    :catch_3b
    move-exception v2

    move-object v0, v2

    .line 892
    .local v0, e:Landroid/os/RemoteException;
    :try_start_3d
    const-string v2, "GpsLocationProvider"

    const-string v3, "RemoteException in addListener"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_44
    .catchall {:try_start_3d .. :try_end_44} :catchall_38

    goto :goto_36
.end method

.method private handleDisable()V
    .registers 3

    .prologue
    .line 756
    const-string v0, "GpsLocationProvider"

    const-string v1, "handleDisable"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 757
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mEnabled:Z

    if-nez v0, :cond_c

    .line 764
    :goto_b
    return-void

    .line 759
    :cond_c
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mEnabled:Z

    .line 760
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->stopNavigating()V

    .line 763
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_cleanup()V

    goto :goto_b
.end method

.method private handleDownloadXtraData()V
    .registers 7

    .prologue
    const/4 v4, 0x6

    .line 587
    iget-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mNetworkAvailable:Z

    if-nez v2, :cond_9

    .line 589
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mDownloadXtraDataPending:Z

    .line 608
    :goto_8
    return-void

    .line 592
    :cond_9
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mDownloadXtraDataPending:Z

    .line 595
    new-instance v1, Lcom/android/server/location/GpsXtraDownloader;

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider;->mProperties:Ljava/util/Properties;

    invoke-direct {v1, v2, v3}, Lcom/android/server/location/GpsXtraDownloader;-><init>(Landroid/content/Context;Ljava/util/Properties;)V

    .line 596
    .local v1, xtraDownloader:Lcom/android/server/location/GpsXtraDownloader;
    invoke-virtual {v1}, Lcom/android/server/location/GpsXtraDownloader;->downloadXtraData()[B

    move-result-object v0

    .line 597
    .local v0, data:[B
    if-eqz v0, :cond_27

    .line 599
    const-string v2, "GpsLocationProvider"

    const-string v3, "calling native_inject_xtra_data"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    array-length v2, v0

    invoke-direct {p0, v0, v2}, Lcom/android/server/location/GpsLocationProvider;->native_inject_xtra_data([BI)V

    goto :goto_8

    .line 605
    :cond_27
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 606
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    const-wide/32 v4, 0x493e0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_8
.end method

.method private handleEnable()V
    .registers 7

    .prologue
    const/4 v1, 0x1

    const-string v2, "GpsLocationProvider"

    .line 722
    const-string v0, "GpsLocationProvider"

    const-string v0, "handleEnable"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 723
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mEnabled:Z

    if-eqz v0, :cond_f

    .line 742
    :cond_e
    :goto_e
    return-void

    .line 724
    :cond_f
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_init()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mEnabled:Z

    .line 726
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mEnabled:Z

    if-eqz v0, :cond_48

    .line 727
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_supports_xtra()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSupportsXtra:Z

    .line 728
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSuplServerHost:Ljava/lang/String;

    if-eqz v0, :cond_33

    .line 729
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->cscgps:I

    if-ne v0, v1, :cond_40

    .line 730
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->addr:Ljava/lang/String;

    iget v3, p0, Lcom/android/server/location/GpsLocationProvider;->port:I

    iget v4, p0, Lcom/android/server/location/GpsLocationProvider;->ssl:I

    iget v5, p0, Lcom/android/server/location/GpsLocationProvider;->ssl_cert:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_set_supl_server(ILjava/lang/String;III)V

    .line 736
    :cond_33
    :goto_33
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mC2KServerHost:Ljava/lang/String;

    if-eqz v0, :cond_e

    .line 737
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mC2KServerHost:Ljava/lang/String;

    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->mC2KServerPort:I

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/location/GpsLocationProvider;->native_set_agps_server(ILjava/lang/String;I)V

    goto :goto_e

    .line 733
    :cond_40
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSuplServerHost:Ljava/lang/String;

    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->mSuplServerPort:I

    invoke-direct {p0, v1, v0, v2}, Lcom/android/server/location/GpsLocationProvider;->native_set_agps_server(ILjava/lang/String;I)V

    goto :goto_33

    .line 740
    :cond_48
    const-string v0, "GpsLocationProvider"

    const-string v0, "Failed to enable location provider"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_e
.end method

.method private handleEnableLocationTracking(Z)V
    .registers 5
    .parameter "enable"

    .prologue
    const/4 v2, 0x0

    .line 798
    if-eqz p1, :cond_d

    .line 799
    iput v2, p0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    .line 800
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    .line 801
    invoke-direct {p0, v2}, Lcom/android/server/location/GpsLocationProvider;->startNavigating(Z)V

    .line 809
    :goto_c
    return-void

    .line 803
    :cond_d
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v0

    if-nez v0, :cond_22

    .line 804
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeupIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 805
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mTimeoutIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 807
    :cond_22
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->stopNavigating()V

    goto :goto_c
.end method

.method private handleInjectNtpTime()V
    .registers 16

    .prologue
    .line 551
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mNetworkAvailable:Z

    if-nez v0, :cond_8

    .line 553
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mInjectNtpTimePending:Z

    .line 584
    :goto_7
    return-void

    .line 556
    :cond_8
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mInjectNtpTimePending:Z

    .line 558
    new-instance v6, Landroid/net/SntpClient;

    invoke-direct {v6}, Landroid/net/SntpClient;-><init>()V

    .line 561
    .local v6, client:Landroid/net/SntpClient;
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mNtpServer:Ljava/lang/String;

    const/16 v1, 0x2710

    invoke-virtual {v6, v0, v1}, Landroid/net/SntpClient;->requestTime(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_90

    .line 562
    invoke-virtual {v6}, Landroid/net/SntpClient;->getNtpTime()J

    move-result-wide v1

    .line 563
    .local v1, time:J
    invoke-virtual {v6}, Landroid/net/SntpClient;->getNtpTimeReference()J

    move-result-wide v3

    .line 564
    .local v3, timeReference:J
    invoke-virtual {v6}, Landroid/net/SntpClient;->getRoundTripTime()J

    move-result-wide v11

    const-wide/16 v13, 0x2

    div-long/2addr v11, v13

    long-to-int v5, v11

    .line 565
    .local v5, certainty:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 567
    .local v9, now:J
    const-string v0, "GpsLocationProvider"

    new-instance v6, Ljava/lang/StringBuilder;

    .end local v6           #client:Landroid/net/SntpClient;
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "NTP server returned: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") reference: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " certainty: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " system time offset: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sub-long v11, v1, v9

    invoke-virtual {v6, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, p0

    .line 573
    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_inject_time(JJI)V

    .line 574
    const-wide/32 v7, 0xdbba00

    .line 582
    .end local v1           #time:J
    .end local v3           #timeReference:J
    .end local v5           #certainty:I
    .end local v9           #now:J
    .local v7, delay:J
    :goto_7c
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 583
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x5

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_7

    .line 576
    .end local v7           #delay:J
    .restart local v6       #client:Landroid/net/SntpClient;
    :cond_90
    const-string v0, "GpsLocationProvider"

    const-string v1, "requestTime failed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    const-wide/32 v7, 0x493e0

    .restart local v7       #delay:J
    goto :goto_7c
.end method

.method private handleRemoveListener(I)V
    .registers 7
    .parameter "uid"

    .prologue
    const-string v1, "GpsLocationProvider"

    .line 909
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 910
    :try_start_5
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v2

    if-gez v2, :cond_27

    .line 912
    const-string v2, "GpsLocationProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unneeded remove listener for uid "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 913
    monitor-exit v1

    .line 924
    :goto_26
    return-void

    .line 915
    :cond_27
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseIntArray;->delete(I)V

    .line 916
    iget-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z
    :try_end_2e
    .catchall {:try_start_5 .. :try_end_2e} :catchall_37

    if-eqz v2, :cond_35

    .line 918
    :try_start_30
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v2, p1}, Lcom/android/internal/app/IBatteryStats;->noteStopGps(I)V
    :try_end_35
    .catchall {:try_start_30 .. :try_end_35} :catchall_37
    .catch Landroid/os/RemoteException; {:try_start_30 .. :try_end_35} :catch_3a

    .line 923
    :cond_35
    :goto_35
    :try_start_35
    monitor-exit v1

    goto :goto_26

    :catchall_37
    move-exception v2

    monitor-exit v1
    :try_end_39
    .catchall {:try_start_35 .. :try_end_39} :catchall_37

    throw v2

    .line 919
    :catch_3a
    move-exception v2

    move-object v0, v2

    .line 920
    .local v0, e:Landroid/os/RemoteException;
    :try_start_3c
    const-string v2, "GpsLocationProvider"

    const-string v3, "RemoteException in removeListener"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_43
    .catchall {:try_start_3c .. :try_end_43} :catchall_37

    goto :goto_35
.end method

.method private handleRequestSingleShot()V
    .registers 3

    .prologue
    .line 825
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    .line 826
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    .line 827
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/server/location/GpsLocationProvider;->startNavigating(Z)V

    .line 828
    return-void
.end method

.method private handleUpdateLocation(Landroid/location/Location;)V
    .registers 8
    .parameter "location"

    .prologue
    .line 619
    invoke-virtual {p1}, Landroid/location/Location;->hasAccuracy()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 620
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_inject_location(DDF)V

    .line 623
    :cond_16
    return-void
.end method

.method private handleUpdateNetworkState(ILandroid/net/NetworkInfo;)V
    .registers 13
    .parameter "state"
    .parameter "info"

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    const-string v7, "GpsLocationProvider"

    .line 512
    if-ne p1, v9, :cond_88

    move v1, v8

    :goto_9
    iput-boolean v1, p0, Lcom/android/server/location/GpsLocationProvider;->mNetworkAvailable:Z

    .line 515
    const-string v1, "GpsLocationProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateNetworkState "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mNetworkAvailable:Z

    if-eqz v2, :cond_8a

    const-string v2, "available"

    :goto_1e
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " info: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    if-eqz p2, :cond_48

    .line 520
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    invoke-virtual {p2}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v3

    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/android/server/location/GpsLocationProvider;->native_update_network_state(ZIZLjava/lang/String;)V

    .line 524
    :cond_48
    if-eqz p2, :cond_73

    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_73

    iget v1, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    if-ne v1, v8, :cond_73

    .line 526
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v0

    .line 527
    .local v0, apnName:Ljava/lang/String;
    iget-boolean v1, p0, Lcom/android/server/location/GpsLocationProvider;->mNetworkAvailable:Z

    if-eqz v1, :cond_8d

    if-eqz v0, :cond_8d

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_8d

    .line 528
    iput-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsApn:Ljava/lang/String;

    .line 529
    const-string v1, "GpsLocationProvider"

    const-string v1, "call native_agps_data_conn_open"

    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 530
    invoke-direct {p0, v0}, Lcom/android/server/location/GpsLocationProvider;->native_agps_data_conn_open(Ljava/lang/String;)V

    .line 531
    iput v9, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    .line 540
    .end local v0           #apnName:Ljava/lang/String;
    :cond_73
    :goto_73
    iget-boolean v1, p0, Lcom/android/server/location/GpsLocationProvider;->mNetworkAvailable:Z

    if-eqz v1, :cond_87

    .line 541
    iget-boolean v1, p0, Lcom/android/server/location/GpsLocationProvider;->mInjectNtpTimePending:Z

    if-eqz v1, :cond_7f

    .line 542
    const/4 v1, 0x5

    invoke-direct {p0, v1, v5, v6}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 544
    :cond_7f
    iget-boolean v1, p0, Lcom/android/server/location/GpsLocationProvider;->mDownloadXtraDataPending:Z

    if-eqz v1, :cond_87

    .line 545
    const/4 v1, 0x6

    invoke-direct {p0, v1, v5, v6}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 548
    :cond_87
    return-void

    :cond_88
    move v1, v5

    .line 512
    goto :goto_9

    .line 515
    :cond_8a
    const-string v2, "unavailable"

    goto :goto_1e

    .line 533
    .restart local v0       #apnName:Ljava/lang/String;
    :cond_8d
    const-string v1, "GpsLocationProvider"

    const-string v1, "call native_agps_data_conn_failed"

    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    iput-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsApn:Ljava/lang/String;

    .line 535
    iput v5, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    .line 536
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_agps_data_conn_failed()V

    goto :goto_73
.end method

.method private hasCapability(I)Z
    .registers 3
    .parameter "capability"

    .prologue
    .line 1077
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mEngineCapabilities:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private hibernate()V
    .registers 9

    .prologue
    .line 1068
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->stopNavigating()V

    .line 1069
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider;->mTimeoutIntent:Landroid/app/PendingIntent;

    invoke-virtual {v2, v3}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 1070
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeupIntent:Landroid/app/PendingIntent;

    invoke-virtual {v2, v3}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 1071
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 1072
    .local v0, now:J
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v3, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget v6, p0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeupIntent:Landroid/app/PendingIntent;

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 1074
    return-void
.end method

.method private initialize()V
    .registers 4

    .prologue
    .line 483
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 484
    .local v0, intentFilter:Landroid/content/IntentFilter;
    const-string v1, "com.android.internal.location.ALARM_WAKEUP"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 485
    const-string v1, "com.android.internal.location.ALARM_TIMEOUT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 488
    const-string v1, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 489
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mBroadcastReciever:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 490
    return-void
.end method

.method public static isSupported()Z
    .registers 1

    .prologue
    .line 398
    invoke-static {}, Lcom/android/server/location/GpsLocationProvider;->native_is_supported()Z

    move-result v0

    return v0
.end method

.method private native native_agps_data_conn_closed()V
.end method

.method private native native_agps_data_conn_failed()V
.end method

.method private native native_agps_data_conn_open(Ljava/lang/String;)V
.end method

.method private native native_agps_ni_message([BI)V
.end method

.method private native native_agps_set_id(ILjava/lang/String;)V
.end method

.method private native native_agps_set_ref_location_cellid(IIIII)V
.end method

.method private native native_cleanup()V
.end method

.method private native native_delete_aiding_data(I)V
.end method

.method private native native_get_internal_state()Ljava/lang/String;
.end method

.method private native native_hybrid_gps_deliver_gps_data([D[F[IJII)V
.end method

.method private native native_hybrid_gps_deliver_rotation_data(I)V
.end method

.method private native native_hybrid_gps_deliver_sensors_data([[F[[F[[F[J[J)I
.end method

.method private native native_hybrid_gps_deliver_sv_status()V
.end method

.method private native native_hybrid_gps_finalize()V
.end method

.method private native native_hybrid_gps_initialize(I)V
.end method

.method private native native_hybrid_gps_request_gps_data([D[F[I)Z
.end method

.method private native native_hybrid_gps_support_inverse_portrait_mode(I)V
.end method

.method private native native_init()Z
.end method

.method private native native_inject_location(DDF)V
.end method

.method private native native_inject_time(JJI)V
.end method

.method private native native_inject_xtra_data([BI)V
.end method

.method private static native native_is_supported()Z
.end method

.method private native native_read_nmea([BI)I
.end method

.method private native native_read_sv_status([I[F[F[F[I)I
.end method

.method private native native_send_ni_response(II)V
.end method

.method private native native_set_agps_server(ILjava/lang/String;I)V
.end method

.method private native native_set_position_mode(IIIII)Z
.end method

.method private native native_set_supl_server(ILjava/lang/String;III)V
.end method

.method private native native_start()Z
.end method

.method private native native_stop()Z
.end method

.method private native native_supports_xtra()Z
.end method

.method private native native_update_network_state(ZIZLjava/lang/String;)V
.end method

.method private reportAGpsStatus(II)V
    .registers 11
    .parameter "type"
    .parameter "status"

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string v7, "enableSUPL"

    const-string v3, "GpsLocationProvider"

    .line 1312
    packed-switch p2, :pswitch_data_92

    .line 1363
    :cond_a
    :goto_a
    return-void

    .line 1314
    :pswitch_b
    const-string v1, "GpsLocationProvider"

    const-string v1, "GPS_REQUEST_AGPS_DATA_CONN"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1317
    iput v5, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    .line 1318
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mConnMgr:Landroid/net/ConnectivityManager;

    const-string v2, "enableSUPL"

    invoke-virtual {v1, v4, v7}, Landroid/net/ConnectivityManager;->startUsingNetworkFeature(ILjava/lang/String;)I

    move-result v0

    .line 1320
    .local v0, result:I
    if-nez v0, :cond_4a

    .line 1321
    const-string v1, "GpsLocationProvider"

    const-string v1, "Phone.APN_ALREADY_ACTIVE"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1322
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsApn:Ljava/lang/String;

    if-eqz v1, :cond_31

    .line 1323
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsApn:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/server/location/GpsLocationProvider;->native_agps_data_conn_open(Ljava/lang/String;)V

    .line 1324
    iput v6, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    goto :goto_a

    .line 1326
    :cond_31
    const-string v1, "GpsLocationProvider"

    const-string v1, "mAGpsApn not set when receiving Phone.APN_ALREADY_ACTIVE"

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1327
    iput v6, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    .line 1328
    iget v1, p0, Lcom/android/server/location/GpsLocationProvider;->cscgps:I

    if-ne v1, v5, :cond_44

    .line 1329
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->addr:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/server/location/GpsLocationProvider;->native_agps_data_conn_open(Ljava/lang/String;)V

    goto :goto_a

    .line 1332
    :cond_44
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSuplServerHost:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/server/location/GpsLocationProvider;->native_agps_data_conn_open(Ljava/lang/String;)V

    goto :goto_a

    .line 1335
    :cond_4a
    if-ne v0, v5, :cond_54

    .line 1336
    const-string v1, "GpsLocationProvider"

    const-string v1, "Phone.APN_REQUEST_STARTED"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 1339
    :cond_54
    const-string v1, "GpsLocationProvider"

    const-string v1, "startUsingNetworkFeature failed"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1340
    iput v4, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    .line 1341
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_agps_data_conn_failed()V

    goto :goto_a

    .line 1345
    .end local v0           #result:I
    :pswitch_61
    const-string v1, "GpsLocationProvider"

    const-string v1, "GPS_RELEASE_AGPS_DATA_CONN"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1346
    iget v1, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    if-eqz v1, :cond_a

    .line 1347
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mConnMgr:Landroid/net/ConnectivityManager;

    const-string v2, "enableSUPL"

    invoke-virtual {v1, v4, v7}, Landroid/net/ConnectivityManager;->stopUsingNetworkFeature(ILjava/lang/String;)I

    .line 1349
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_agps_data_conn_closed()V

    .line 1350
    iput v4, p0, Lcom/android/server/location/GpsLocationProvider;->mAGpsDataConnectionState:I

    goto :goto_a

    .line 1354
    :pswitch_79
    const-string v1, "GpsLocationProvider"

    const-string v1, "GPS_AGPS_DATA_CONNECTED"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 1357
    :pswitch_81
    const-string v1, "GpsLocationProvider"

    const-string v1, "GPS_AGPS_DATA_CONN_DONE"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 1360
    :pswitch_89
    const-string v1, "GpsLocationProvider"

    const-string v1, "GPS_AGPS_DATA_CONN_FAILED"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 1312
    :pswitch_data_92
    .packed-switch 0x1
        :pswitch_b
        :pswitch_61
        :pswitch_79
        :pswitch_81
        :pswitch_89
    .end packed-switch
.end method

.method private reportLocation(IDDDFFFJ)V
    .registers 34
    .parameter "flags"
    .parameter "latitude"
    .parameter "longitude"
    .parameter "altitude"
    .parameter "speed"
    .parameter "bearing"
    .parameter "accuracy"
    .parameter "timestamp"

    .prologue
    .line 1088
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    move/from16 v4, p1

    move-wide/from16 v5, p2

    move-wide/from16 v7, p4

    move-wide/from16 v9, p6

    move/from16 v11, p8

    move/from16 v12, p9

    move/from16 v13, p10

    move-wide/from16 v14, p11

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingReportLocation(IDDDFFFJ)V
    invoke-static/range {v3 .. v15}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$900(Lcom/android/server/location/GpsLocationProvider$SensorAiding;IDDDFFFJ)V

    .line 1089
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetValid()I
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1000(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_15e

    .line 1090
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetFlags()I
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1100(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)I

    move-result p1

    .line 1091
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetLatitude()D
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1200(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)D

    move-result-wide p2

    .line 1092
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetLongitude()D
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1300(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)D

    move-result-wide p4

    .line 1093
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetAltitde()D
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1400(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)D

    move-result-wide p6

    .line 1094
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetSpeed()F
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1500(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)F

    move-result p8

    .line 1095
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetBearing()F
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1600(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)F

    move-result p9

    .line 1096
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    move-object v3, v0

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingGetAccuracy()F
    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1700(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)F

    move-result p10

    .line 1101
    :cond_63
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v3, v0

    monitor-enter v3

    .line 1102
    :try_start_69
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/location/GpsLocationProvider;->mLocationFlags:I

    .line 1103
    and-int/lit8 v4, p1, 0x1

    const/4 v5, 0x1

    if-ne v4, v5, :cond_95

    .line 1104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    move-object v0, v4

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setLatitude(D)V

    .line 1105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    move-object v0, v4

    move-wide/from16 v1, p4

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setLongitude(D)V

    .line 1106
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    move-object v0, v4

    move-wide/from16 v1, p11

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setTime(J)V

    .line 1108
    :cond_95
    and-int/lit8 v4, p1, 0x2

    const/4 v5, 0x2

    if-ne v4, v5, :cond_161

    .line 1109
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    move-object v0, v4

    move-wide/from16 v1, p6

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setAltitude(D)V

    .line 1113
    :goto_a5
    and-int/lit8 v4, p1, 0x4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_16e

    .line 1114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    move-object v0, v4

    move/from16 v1, p8

    invoke-virtual {v0, v1}, Landroid/location/Location;->setSpeed(F)V

    .line 1118
    :goto_b5
    and-int/lit8 v4, p1, 0x8

    const/16 v5, 0x8

    if-ne v4, v5, :cond_178

    .line 1119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    move-object v0, v4

    move/from16 v1, p9

    invoke-virtual {v0, v1}, Landroid/location/Location;->setBearing(F)V

    .line 1123
    :goto_c6
    and-int/lit8 v4, p1, 0x10

    const/16 v5, 0x10

    if-ne v4, v5, :cond_182

    .line 1124
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    move-object v0, v4

    move/from16 v1, p10

    invoke-virtual {v0, v1}, Landroid/location/Location;->setAccuracy(F)V
    :try_end_d7
    .catchall {:try_start_69 .. :try_end_d7} :catchall_16b

    .line 1130
    :goto_d7
    :try_start_d7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocationManager:Landroid/location/ILocationManager;

    move-object v4, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v5, v0

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/location/ILocationManager;->reportLocation(Landroid/location/Location;Z)V
    :try_end_e5
    .catchall {:try_start_d7 .. :try_end_e5} :catchall_16b
    .catch Landroid/os/RemoteException; {:try_start_d7 .. :try_end_e5} :catch_18c

    .line 1134
    :goto_e5
    :try_start_e5
    monitor-exit v3
    :try_end_e6
    .catchall {:try_start_e5 .. :try_end_e6} :catchall_16b

    .line 1136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    move-wide v0, v3

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    .line 1138
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    move v3, v0

    if-nez v3, :cond_1b1

    and-int/lit8 v3, p1, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1b1

    .line 1139
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    move-wide v3, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/location/GpsLocationProvider;->mFixRequestTime:J

    move-wide v5, v0

    sub-long/2addr v3, v5

    long-to-int v3, v3

    move v0, v3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    .line 1140
    const-string v3, "GpsLocationProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "TTFF: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    move v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    move-object v3, v0

    monitor-enter v3

    .line 1144
    :try_start_12f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    move-object v4, v0

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v20

    .line 1145
    .local v20, size:I
    const/16 v17, 0x0

    .local v17, i:I
    :goto_13a
    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_1b0

    .line 1146
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    move-object v4, v0

    move-object v0, v4

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_end_14e
    .catchall {:try_start_12f .. :try_end_14e} :catchall_24b

    .line 1148
    .local v19, listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_start_14e
    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    move-object v4, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    move v5, v0

    invoke-interface {v4, v5}, Landroid/location/IGpsStatusListener;->onFirstFix(I)V
    :try_end_15b
    .catchall {:try_start_14e .. :try_end_15b} :catchall_24b
    .catch Landroid/os/RemoteException; {:try_start_14e .. :try_end_15b} :catch_198

    .line 1145
    :goto_15b
    add-int/lit8 v17, v17, 0x1

    goto :goto_13a

    .line 1097
    .end local v17           #i:I
    .end local v19           #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    .end local v20           #size:I
    :cond_15e
    if-nez p1, :cond_63

    .line 1184
    :cond_160
    :goto_160
    return-void

    .line 1111
    :cond_161
    :try_start_161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    invoke-virtual {v4}, Landroid/location/Location;->removeAltitude()V

    goto/16 :goto_a5

    .line 1134
    :catchall_16b
    move-exception v4

    monitor-exit v3
    :try_end_16d
    .catchall {:try_start_161 .. :try_end_16d} :catchall_16b

    throw v4

    .line 1116
    :cond_16e
    :try_start_16e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    invoke-virtual {v4}, Landroid/location/Location;->removeSpeed()V

    goto/16 :goto_b5

    .line 1121
    :cond_178
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    invoke-virtual {v4}, Landroid/location/Location;->removeBearing()V

    goto/16 :goto_c6

    .line 1126
    :cond_182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mLocation:Landroid/location/Location;

    move-object v4, v0

    invoke-virtual {v4}, Landroid/location/Location;->removeAccuracy()V

    goto/16 :goto_d7

    .line 1131
    :catch_18c
    move-exception v4

    move-object/from16 v16, v4

    .line 1132
    .local v16, e:Landroid/os/RemoteException;
    const-string v4, "GpsLocationProvider"

    const-string v5, "RemoteException calling reportLocation"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_196
    .catchall {:try_start_16e .. :try_end_196} :catchall_16b

    goto/16 :goto_e5

    .line 1149
    .end local v16           #e:Landroid/os/RemoteException;
    .restart local v17       #i:I
    .restart local v19       #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    .restart local v20       #size:I
    :catch_198
    move-exception v4

    move-object/from16 v16, v4

    .line 1150
    .restart local v16       #e:Landroid/os/RemoteException;
    :try_start_19b
    const-string v4, "GpsLocationProvider"

    const-string v5, "RemoteException in stopNavigating"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    move-object v4, v0

    move-object v0, v4

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1153
    add-int/lit8 v20, v20, -0x1

    goto :goto_15b

    .line 1156
    .end local v16           #e:Landroid/os/RemoteException;
    .end local v19           #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    :cond_1b0
    monitor-exit v3
    :try_end_1b1
    .catchall {:try_start_19b .. :try_end_1b1} :catchall_24b

    .line 1159
    .end local v17           #i:I
    .end local v20           #size:I
    :cond_1b1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSingleShot:Z

    move v3, v0

    if-eqz v3, :cond_1bb

    .line 1160
    invoke-direct/range {p0 .. p0}, Lcom/android/server/location/GpsLocationProvider;->stopNavigating()V

    .line 1162
    :cond_1bb
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    move v3, v0

    if-eqz v3, :cond_225

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mStatus:I

    move v3, v0

    const/4 v4, 0x2

    if-eq v3, v4, :cond_225

    .line 1165
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move v1, v3

    invoke-direct {v0, v1}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v3

    if-nez v3, :cond_1eb

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    move v3, v0

    const v4, 0xea60

    if-ge v3, v4, :cond_1eb

    .line 1166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mTimeoutIntent:Landroid/app/PendingIntent;

    move-object v4, v0

    invoke-virtual {v3, v4}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 1170
    :cond_1eb
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    move v3, v0

    if-eqz v3, :cond_225

    .line 1172
    const-string v3, "GpsLocationProvider"

    const-string v4, "send an intent to notify that the GPS is receiving fixes"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1173
    new-instance v18, Landroid/content/Intent;

    const-string v3, "android.location.GPS_FIX_CHANGE"

    move-object/from16 v0, v18

    move-object v1, v3

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1174
    .local v18, intent:Landroid/content/Intent;
    const-string v3, "enabled"

    const/4 v4, 0x1

    move-object/from16 v0, v18

    move-object v1, v3

    move v2, v4

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1175
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1176
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mSvCount:I

    move v4, v0

    move-object/from16 v0, p0

    move v1, v3

    move v2, v4

    invoke-direct {v0, v1, v2}, Lcom/android/server/location/GpsLocationProvider;->updateStatus(II)V

    .line 1180
    .end local v18           #intent:Landroid/content/Intent;
    :cond_225
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move v1, v3

    invoke-direct {v0, v1}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v3

    if-nez v3, :cond_160

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    move v3, v0

    if-eqz v3, :cond_160

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    move v3, v0

    const/16 v4, 0x3e8

    if-le v3, v4, :cond_160

    .line 1181
    const-string v3, "GpsLocationProvider"

    const-string v4, "got fix, hibernating"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1182
    invoke-direct/range {p0 .. p0}, Lcom/android/server/location/GpsLocationProvider;->hibernate()V

    goto/16 :goto_160

    .line 1156
    :catchall_24b
    move-exception v4

    :try_start_24c
    monitor-exit v3
    :try_end_24d
    .catchall {:try_start_24c .. :try_end_24d} :catchall_24b

    throw v4
.end method

.method private reportNmea(J)V
    .registers 12
    .parameter "timestamp"

    .prologue
    .line 1369
    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v6

    .line 1370
    :try_start_3
    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 1371
    .local v5, size:I
    if-lez v5, :cond_4a

    .line 1373
    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mNmeaBuffer:[B

    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNmeaBuffer:[B

    array-length v8, v8

    invoke-direct {p0, v7, v8}, Lcom/android/server/location/GpsLocationProvider;->native_read_nmea([BI)I

    move-result v2

    .line 1374
    .local v2, length:I
    new-instance v4, Ljava/lang/String;

    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mNmeaBuffer:[B

    const/4 v8, 0x0

    invoke-direct {v4, v7, v8, v2}, Ljava/lang/String;-><init>([BII)V

    .line 1375
    .local v4, nmea:Ljava/lang/String;
    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingReportNmea(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v7, v4}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1900(Lcom/android/server/location/GpsLocationProvider$SensorAiding;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1378
    if-nez v4, :cond_26

    .line 1379
    monitor-exit v6

    .line 1396
    .end local v2           #length:I
    .end local v4           #nmea:Ljava/lang/String;
    :goto_25
    return-void

    .line 1383
    .restart local v2       #length:I
    .restart local v4       #nmea:Ljava/lang/String;
    :cond_26
    const/4 v1, 0x0

    .local v1, i:I
    :goto_27
    if-ge v1, v5, :cond_4a

    .line 1384
    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_4c

    .line 1386
    .local v3, listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_start_31
    iget-object v7, v3, Lcom/android/server/location/GpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    invoke-interface {v7, p1, p2, v4}, Landroid/location/IGpsStatusListener;->onNmeaReceived(JLjava/lang/String;)V
    :try_end_36
    .catchall {:try_start_31 .. :try_end_36} :catchall_4c
    .catch Landroid/os/RemoteException; {:try_start_31 .. :try_end_36} :catch_39

    .line 1383
    :goto_36
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 1387
    :catch_39
    move-exception v7

    move-object v0, v7

    .line 1388
    .local v0, e:Landroid/os/RemoteException;
    :try_start_3b
    const-string v7, "GpsLocationProvider"

    const-string v8, "RemoteException in reportNmea"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1389
    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1391
    add-int/lit8 v5, v5, -0x1

    goto :goto_36

    .line 1395
    .end local v0           #e:Landroid/os/RemoteException;
    .end local v1           #i:I
    .end local v2           #length:I
    .end local v3           #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    .end local v4           #nmea:Ljava/lang/String;
    :cond_4a
    monitor-exit v6

    goto :goto_25

    .end local v5           #size:I
    :catchall_4c
    move-exception v7

    monitor-exit v6
    :try_end_4e
    .catchall {:try_start_3b .. :try_end_4e} :catchall_4c

    throw v7
.end method

.method private reportStatus(I)V
    .registers 13
    .parameter "status"

    .prologue
    const/4 v10, 0x1

    const-string v7, "RemoteException in reportStatus"

    const-string v9, "GpsLocationProvider"

    .line 1190
    const-string v7, "GpsLocationProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "reportStatus status: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1192
    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v7

    .line 1193
    :try_start_20
    iget-boolean v6, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    .line 1195
    .local v6, wasNavigating:Z
    packed-switch p1, :pswitch_data_be

    .line 1212
    :goto_25
    iget-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    if-eq v6, v8, :cond_bb

    .line 1213
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 1214
    .local v4, size:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_30
    if-ge v1, v4, :cond_76

    .line 1215
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_end_3a
    .catchall {:try_start_20 .. :try_end_3a} :catchall_4d

    .line 1217
    .local v3, listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_start_3a
    iget-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    if-eqz v8, :cond_5f

    .line 1218
    iget-object v8, v3, Lcom/android/server/location/GpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    invoke-interface {v8}, Landroid/location/IGpsStatusListener;->onGpsStarted()V
    :try_end_43
    .catchall {:try_start_3a .. :try_end_43} :catchall_4d
    .catch Landroid/os/RemoteException; {:try_start_3a .. :try_end_43} :catch_65

    .line 1214
    :goto_43
    add-int/lit8 v1, v1, 0x1

    goto :goto_30

    .line 1197
    .end local v1           #i:I
    .end local v3           #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    .end local v4           #size:I
    :pswitch_46
    const/4 v8, 0x1

    :try_start_47
    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    .line 1198
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mEngineOn:Z

    goto :goto_25

    .line 1250
    .end local v6           #wasNavigating:Z
    :catchall_4d
    move-exception v8

    monitor-exit v7
    :try_end_4f
    .catchall {:try_start_47 .. :try_end_4f} :catchall_4d

    throw v8

    .line 1201
    .restart local v6       #wasNavigating:Z
    :pswitch_50
    const/4 v8, 0x0

    :try_start_51
    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    goto :goto_25

    .line 1204
    :pswitch_54
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mEngineOn:Z

    goto :goto_25

    .line 1207
    :pswitch_58
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mEngineOn:Z

    .line 1208
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z
    :try_end_5e
    .catchall {:try_start_51 .. :try_end_5e} :catchall_4d

    goto :goto_25

    .line 1220
    .restart local v1       #i:I
    .restart local v3       #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    .restart local v4       #size:I
    :cond_5f
    :try_start_5f
    iget-object v8, v3, Lcom/android/server/location/GpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    invoke-interface {v8}, Landroid/location/IGpsStatusListener;->onGpsStopped()V
    :try_end_64
    .catchall {:try_start_5f .. :try_end_64} :catchall_4d
    .catch Landroid/os/RemoteException; {:try_start_5f .. :try_end_64} :catch_65

    goto :goto_43

    .line 1222
    :catch_65
    move-exception v8

    move-object v0, v8

    .line 1223
    .local v0, e:Landroid/os/RemoteException;
    :try_start_67
    const-string v8, "GpsLocationProvider"

    const-string v9, "RemoteException in reportStatus"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1224
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_73
    .catchall {:try_start_67 .. :try_end_73} :catchall_4d

    .line 1226
    add-int/lit8 v4, v4, -0x1

    goto :goto_43

    .line 1232
    .end local v0           #e:Landroid/os/RemoteException;
    .end local v3           #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    :cond_76
    :try_start_76
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v8}, Landroid/util/SparseIntArray;->size()I

    move-result v8

    sub-int v1, v8, v10

    :goto_7e
    if-ltz v1, :cond_a1

    .line 1233
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v8, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v5

    .line 1234
    .local v5, uid:I
    iget-boolean v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    if-eqz v8, :cond_92

    .line 1235
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v8, v5}, Lcom/android/internal/app/IBatteryStats;->noteStartGps(I)V

    .line 1232
    :goto_8f
    add-int/lit8 v1, v1, -0x1

    goto :goto_7e

    .line 1237
    :cond_92
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v8, v5}, Lcom/android/internal/app/IBatteryStats;->noteStopGps(I)V
    :try_end_97
    .catchall {:try_start_76 .. :try_end_97} :catchall_4d
    .catch Landroid/os/RemoteException; {:try_start_76 .. :try_end_97} :catch_98

    goto :goto_8f

    .line 1240
    .end local v5           #uid:I
    :catch_98
    move-exception v8

    move-object v0, v8

    .line 1241
    .restart local v0       #e:Landroid/os/RemoteException;
    :try_start_9a
    const-string v8, "GpsLocationProvider"

    const-string v9, "RemoteException in reportStatus"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1245
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_a1
    const-string v8, "GpsLocationProvider"

    const-string v9, "send an intent to notify that the GPS has been enabled or disabled"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1246
    new-instance v2, Landroid/content/Intent;

    const-string v8, "android.location.GPS_ENABLED_CHANGE"

    invoke-direct {v2, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1247
    .local v2, intent:Landroid/content/Intent;
    const-string v8, "enabled"

    iget-boolean v9, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    invoke-virtual {v2, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1248
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v8, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1250
    .end local v1           #i:I
    .end local v2           #intent:Landroid/content/Intent;
    .end local v4           #size:I
    :cond_bb
    monitor-exit v7
    :try_end_bc
    .catchall {:try_start_9a .. :try_end_bc} :catchall_4d

    .line 1251
    return-void

    .line 1195
    nop

    :pswitch_data_be
    .packed-switch 0x1
        :pswitch_46
        :pswitch_50
        :pswitch_54
        :pswitch_58
    .end packed-switch
.end method

.method private reportSvStatus()V
    .registers 15

    .prologue
    .line 1258
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSvs:[I

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mSnrs:[F

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider;->mSvElevations:[F

    iget-object v4, p0, Lcom/android/server/location/GpsLocationProvider;->mSvAzimuths:[F

    iget-object v5, p0, Lcom/android/server/location/GpsLocationProvider;->mSvMasks:[I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_read_sv_status([I[F[F[F[I)I

    move-result v1

    .line 1260
    .local v1, svCount:I
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingReportSvStatus(I)V
    invoke-static {v0, v1}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$1800(Lcom/android/server/location/GpsLocationProvider$SensorAiding;I)V

    .line 1262
    iget-object v11, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v11

    .line 1263
    :try_start_17
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v13

    .line 1264
    .local v13, size:I
    const/4 v10, 0x0

    .local v10, i:I
    :goto_1e
    if-ge v10, v13, :cond_58

    .line 1265
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_end_28
    .catchall {:try_start_17 .. :try_end_28} :catchall_a5

    .line 1267
    .local v12, listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    :try_start_28
    iget-object v0, v12, Lcom/android/server/location/GpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mSvs:[I

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider;->mSnrs:[F

    iget-object v4, p0, Lcom/android/server/location/GpsLocationProvider;->mSvElevations:[F

    iget-object v5, p0, Lcom/android/server/location/GpsLocationProvider;->mSvAzimuths:[F

    iget-object v6, p0, Lcom/android/server/location/GpsLocationProvider;->mSvMasks:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    iget-object v7, p0, Lcom/android/server/location/GpsLocationProvider;->mSvMasks:[I

    const/4 v8, 0x1

    aget v7, v7, v8

    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mSvMasks:[I

    const/4 v9, 0x2

    aget v8, v8, v9

    invoke-interface/range {v0 .. v8}, Landroid/location/IGpsStatusListener;->onSvStatusChanged(I[I[F[F[FIII)V
    :try_end_44
    .catchall {:try_start_28 .. :try_end_44} :catchall_a5
    .catch Landroid/os/RemoteException; {:try_start_28 .. :try_end_44} :catch_47

    .line 1264
    :goto_44
    add-int/lit8 v10, v10, 0x1

    goto :goto_1e

    .line 1270
    :catch_47
    move-exception v0

    move-object v9, v0

    .line 1271
    .local v9, e:Landroid/os/RemoteException;
    :try_start_49
    const-string v0, "GpsLocationProvider"

    const-string v2, "RemoteException in reportSvInfo"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1272
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1274
    add-int/lit8 v13, v13, -0x1

    goto :goto_44

    .line 1277
    .end local v9           #e:Landroid/os/RemoteException;
    .end local v12           #listener:Lcom/android/server/location/GpsLocationProvider$Listener;
    :cond_58
    monitor-exit v11
    :try_end_59
    .catchall {:try_start_49 .. :try_end_59} :catchall_a5

    .line 1295
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStatus:I

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSvMasks:[I

    .end local v1           #svCount:I
    const/4 v2, 0x2

    aget v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->bitCount(I)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/location/GpsLocationProvider;->updateStatus(II)V

    .line 1297
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mNavigating:Z

    if-eqz v0, :cond_a4

    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStatus:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_a4

    iget-wide v2, p0, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_a4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x2710

    cmp-long v0, v2, v4

    if-lez v0, :cond_a4

    .line 1300
    const-string v0, "GpsLocationProvider"

    const-string v1, "send an intent to notify that the GPS is no longer receiving fixes"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1301
    new-instance v11, Landroid/content/Intent;

    const-string v0, "android.location.GPS_FIX_CHANGE"

    invoke-direct {v11, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1302
    .local v11, intent:Landroid/content/Intent;
    const-string v0, "enabled"

    const/4 v1, 0x0

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1303
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v11}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1304
    const/4 v0, 0x1

    iget v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSvCount:I

    invoke-direct {p0, v0, v1}, Lcom/android/server/location/GpsLocationProvider;->updateStatus(II)V

    .line 1306
    .end local v11           #intent:Landroid/content/Intent;
    :cond_a4
    return-void

    .line 1277
    .end local v10           #i:I
    .end local v13           #size:I
    .restart local v1       #svCount:I
    :catchall_a5
    move-exception v0

    :try_start_a6
    monitor-exit v11
    :try_end_a7
    .catchall {:try_start_a6 .. :try_end_a7} :catchall_a5

    throw v0
.end method

.method private requestRefLocation(I)V
    .registers 13
    .parameter "flags"

    .prologue
    const/4 v9, 0x1

    const/4 v5, 0x3

    const-string v10, "GpsLocationProvider"

    .line 2751
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/telephony/TelephonyManager;

    .line 2753
    .local v8, phone:Landroid/telephony/TelephonyManager;
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    if-ne v0, v9, :cond_75

    .line 2754
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object v6

    check-cast v6, Landroid/telephony/gsm/GsmCellLocation;

    .line 2755
    .local v6, gsm_cell:Landroid/telephony/gsm/GsmCellLocation;
    if-eqz v6, :cond_6d

    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    if-ne v0, v9, :cond_6d

    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6d

    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_6d

    .line 2759
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 2760
    .local v2, mcc:I
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 2761
    .local v3, mnc:I
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v7

    .line 2762
    .local v7, networkType:I
    if-eq v7, v5, :cond_5d

    const/16 v0, 0x8

    if-eq v7, v0, :cond_5d

    const/16 v0, 0x9

    if-eq v7, v0, :cond_5d

    const/16 v0, 0xa

    if-ne v7, v0, :cond_6b

    .line 2766
    :cond_5d
    const/4 v1, 0x2

    .line 2770
    .local v1, type:I
    :goto_5e
    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getLac()I

    move-result v4

    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_agps_set_ref_location_cellid(IIIII)V

    .line 2779
    .end local v1           #type:I
    .end local v2           #mcc:I
    .end local v3           #mnc:I
    .end local v6           #gsm_cell:Landroid/telephony/gsm/GsmCellLocation;
    .end local v7           #networkType:I
    :goto_6a
    return-void

    .line 2768
    .restart local v2       #mcc:I
    .restart local v3       #mnc:I
    .restart local v6       #gsm_cell:Landroid/telephony/gsm/GsmCellLocation;
    .restart local v7       #networkType:I
    :cond_6b
    const/4 v1, 0x1

    .restart local v1       #type:I
    goto :goto_5e

    .line 2773
    .end local v1           #type:I
    .end local v2           #mcc:I
    .end local v3           #mnc:I
    .end local v7           #networkType:I
    :cond_6d
    const-string v0, "GpsLocationProvider"

    const-string v0, "Error getting cell location info."

    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6a

    .line 2777
    .end local v6           #gsm_cell:Landroid/telephony/gsm/GsmCellLocation;
    :cond_75
    const-string v0, "GpsLocationProvider"

    const-string v0, "CDMA not supported."

    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6a
.end method

.method private requestSetID(I)V
    .registers 8
    .parameter "flags"

    .prologue
    .line 2718
    iget-object v4, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    const-string v5, "phone"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 2720
    .local v2, phone:Landroid/telephony/TelephonyManager;
    const/4 v3, 0x0

    .line 2721
    .local v3, type:I
    const-string v0, ""

    .line 2723
    .local v0, data:Ljava/lang/String;
    and-int/lit8 v4, p1, 0x1

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1f

    .line 2724
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    .line 2725
    .local v1, data_temp:Ljava/lang/String;
    if-nez v1, :cond_1c

    .line 2743
    .end local v1           #data_temp:Ljava/lang/String;
    :cond_18
    :goto_18
    invoke-direct {p0, v3, v0}, Lcom/android/server/location/GpsLocationProvider;->native_agps_set_id(ILjava/lang/String;)V

    .line 2744
    return-void

    .line 2729
    .restart local v1       #data_temp:Ljava/lang/String;
    :cond_1c
    move-object v0, v1

    .line 2730
    const/4 v3, 0x1

    goto :goto_18

    .line 2733
    .end local v1           #data_temp:Ljava/lang/String;
    :cond_1f
    and-int/lit8 v4, p1, 0x2

    const/4 v5, 0x2

    if-ne v4, v5, :cond_18

    .line 2734
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v1

    .line 2735
    .restart local v1       #data_temp:Ljava/lang/String;
    if-eqz v1, :cond_18

    .line 2739
    move-object v0, v1

    .line 2740
    const/4 v3, 0x2

    goto :goto_18
.end method

.method private sendMessage(IILjava/lang/Object;)V
    .registers 8
    .parameter "message"
    .parameter "arg"
    .parameter "obj"

    .prologue
    .line 2783
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v1

    .line 2784
    :try_start_3
    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingMessageBits:I

    const/4 v3, 0x1

    shl-int/2addr v3, p1

    or-int/2addr v2, v3

    iput v2, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingMessageBits:I

    .line 2785
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 2786
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 2787
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-static {v2, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 2788
    .local v0, m:Landroid/os/Message;
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 2789
    iput-object p3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2790
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 2791
    monitor-exit v1

    .line 2792
    return-void

    .line 2791
    .end local v0           #m:Landroid/os/Message;
    :catchall_25
    move-exception v2

    monitor-exit v1
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v2
.end method

.method private setEngineCapabilities(I)V
    .registers 2
    .parameter "capabilities"

    .prologue
    .line 1402
    iput p1, p0, Lcom/android/server/location/GpsLocationProvider;->mEngineCapabilities:I

    .line 1403
    return-void
.end method

.method private startNavigating(Z)V
    .registers 11
    .parameter "singleShot"

    .prologue
    const/4 v8, 0x2

    const/4 v6, 0x1

    const/4 v2, 0x0

    const-string v7, "GpsLocationProvider"

    .line 988
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    if-nez v0, :cond_4c

    .line 989
    const-string v0, "GpsLocationProvider"

    const-string v0, "startNavigating"

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 990
    iput-boolean v6, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    .line 991
    iput-boolean p1, p0, Lcom/android/server/location/GpsLocationProvider;->mSingleShot:Z

    .line 992
    iput v2, p0, Lcom/android/server/location/GpsLocationProvider;->mPositionMode:I

    .line 994
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "assisted_gps_enabled"

    invoke-static {v0, v1, v6}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_2f

    .line 996
    if-eqz p1, :cond_4d

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 997
    iput v8, p0, Lcom/android/server/location/GpsLocationProvider;->mPositionMode:I

    .line 1003
    :cond_2f
    :goto_2f
    invoke-direct {p0, v6}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v0

    if-eqz v0, :cond_56

    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    move v3, v0

    .line 1004
    .local v3, interval:I
    :goto_38
    iget v1, p0, Lcom/android/server/location/GpsLocationProvider;->mPositionMode:I

    move-object v0, p0

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_set_position_mode(IIIII)Z

    move-result v0

    if-nez v0, :cond_5a

    .line 1006
    iput-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    .line 1007
    const-string v0, "GpsLocationProvider"

    const-string v0, "set_position_mode failed in startNavigating()"

    invoke-static {v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1032
    .end local v3           #interval:I
    :cond_4c
    :goto_4c
    return-void

    .line 998
    :cond_4d
    invoke-direct {p0, v8}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 999
    iput v6, p0, Lcom/android/server/location/GpsLocationProvider;->mPositionMode:I

    goto :goto_2f

    .line 1003
    :cond_56
    const/16 v0, 0x3e8

    move v3, v0

    goto :goto_38

    .line 1010
    .restart local v3       #interval:I
    :cond_5a
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_start()Z

    move-result v0

    if-nez v0, :cond_6a

    .line 1011
    iput-boolean v2, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    .line 1012
    const-string v0, "GpsLocationProvider"

    const-string v0, "native_start failed in startNavigating()"

    invoke-static {v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4c

    .line 1016
    :cond_6a
    new-instance v0, Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    invoke-direct {v0, p0}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;-><init>(Lcom/android/server/location/GpsLocationProvider;)V

    iput-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    .line 1017
    const-string v0, "GpsLocationProvider"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startNavigating : SensorAiding is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1018
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingStartNavigating()V
    invoke-static {v0}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$700(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)V

    .line 1021
    invoke-direct {p0, v6, v2}, Lcom/android/server/location/GpsLocationProvider;->updateStatus(II)V

    .line 1022
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/location/GpsLocationProvider;->mFixRequestTime:J

    .line 1023
    invoke-direct {p0, v6}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v0

    if-nez v0, :cond_4c

    .line 1026
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    const v1, 0xea60

    if-lt v0, v1, :cond_4c

    .line 1027
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    const-wide/32 v4, 0xea60

    add-long/2addr v1, v4

    iget-object v4, p0, Lcom/android/server/location/GpsLocationProvider;->mTimeoutIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v8, v1, v2, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_4c
.end method

.method private stopNavigating()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    const-string v4, "GpsLocationProvider"

    .line 1035
    const-string v1, "GpsLocationProvider"

    const-string v1, "stopNavigating"

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1037
    const/4 v0, 0x0

    .line 1038
    .local v0, LPPIsInStop:Z
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    if-eqz v1, :cond_43

    .line 1039
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSensorAiding:Lcom/android/server/location/GpsLocationProvider$SensorAiding;

    #calls: Lcom/android/server/location/GpsLocationProvider$SensorAiding;->SensorAidingStopNavigating()Z
    invoke-static {v1}, Lcom/android/server/location/GpsLocationProvider$SensorAiding;->access$800(Lcom/android/server/location/GpsLocationProvider$SensorAiding;)Z

    move-result v0

    .line 1044
    :goto_16
    iget-boolean v1, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    if-eqz v1, :cond_2c

    .line 1045
    iput-boolean v3, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    .line 1046
    iput-boolean v3, p0, Lcom/android/server/location/GpsLocationProvider;->mSingleShot:Z

    .line 1047
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_stop()Z

    .line 1048
    iput v3, p0, Lcom/android/server/location/GpsLocationProvider;->mTTFF:I

    .line 1049
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/server/location/GpsLocationProvider;->mLastFixTime:J

    .line 1050
    iput v3, p0, Lcom/android/server/location/GpsLocationProvider;->mLocationFlags:I

    .line 1053
    invoke-direct {p0, v5, v3}, Lcom/android/server/location/GpsLocationProvider;->updateStatus(II)V

    .line 1058
    :cond_2c
    if-ne v0, v5, :cond_42

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 1060
    const-string v1, "GpsLocationProvider"

    const-string v1, "Releasing wakelock"

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1062
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1064
    :cond_42
    return-void

    .line 1041
    :cond_43
    const-string v1, "GpsLocationProvider"

    const-string v1, "stopNavigating : SensorAiding instance was NULL"

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_16
.end method

.method private updateStatus(II)V
    .registers 5
    .parameter "status"
    .parameter "svCount"

    .prologue
    .line 778
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStatus:I

    if-ne p1, v0, :cond_8

    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mSvCount:I

    if-eq p2, v0, :cond_19

    .line 779
    :cond_8
    iput p1, p0, Lcom/android/server/location/GpsLocationProvider;->mStatus:I

    .line 780
    iput p2, p0, Lcom/android/server/location/GpsLocationProvider;->mSvCount:I

    .line 781
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mLocationExtras:Landroid/os/Bundle;

    const-string v1, "satellites"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 782
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStatusUpdateTime:J

    .line 784
    :cond_19
    return-void
.end method

.method private xtraDownloadRequest()V
    .registers 4

    .prologue
    .line 1409
    const-string v0, "GpsLocationProvider"

    const-string v1, "xtraDownloadRequest"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1410
    const/4 v0, 0x6

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 1411
    return-void
.end method


# virtual methods
.method public addListener(I)V
    .registers 6
    .parameter "uid"

    .prologue
    .line 871
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v1

    .line 872
    :try_start_3
    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingListenerMessages:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingListenerMessages:I

    .line 873
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 874
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 875
    .local v0, m:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 876
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 877
    monitor-exit v1

    .line 878
    return-void

    .line 877
    .end local v0           #m:Landroid/os/Message;
    :catchall_1f
    move-exception v2

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v2
.end method

.method public disable()V
    .registers 5

    .prologue
    .line 750
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    monitor-enter v0

    .line 751
    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_6
    invoke-direct {p0, v1, v2, v3}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 752
    monitor-exit v0

    .line 753
    return-void

    .line 752
    :catchall_b
    move-exception v1

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_6 .. :try_end_d} :catchall_b

    throw v1
.end method

.method public enable()V
    .registers 5

    .prologue
    .line 716
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    monitor-enter v0

    .line 717
    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_6
    invoke-direct {p0, v1, v2, v3}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 718
    monitor-exit v0

    .line 719
    return-void

    .line 718
    :catchall_b
    move-exception v1

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_6 .. :try_end_d} :catchall_b

    throw v1
.end method

.method public enableLocationTracking(Z)V
    .registers 6
    .parameter "enable"

    .prologue
    .line 792
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    monitor-enter v0

    .line 793
    const/4 v1, 0x3

    if-eqz p1, :cond_d

    const/4 v2, 0x1

    :goto_7
    const/4 v3, 0x0

    :try_start_8
    invoke-direct {p0, v1, v2, v3}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 794
    monitor-exit v0

    .line 795
    return-void

    .line 793
    :cond_d
    const/4 v2, 0x0

    goto :goto_7

    .line 794
    :catchall_f
    move-exception v1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_f

    throw v1
.end method

.method public getAccuracy()I
    .registers 2

    .prologue
    .line 707
    const/4 v0, 0x1

    return v0
.end method

.method public getGpsStatusProvider()Landroid/location/IGpsStatusProvider;
    .registers 2

    .prologue
    .line 358
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mGpsStatusProvider:Landroid/location/IGpsStatusProvider;

    return-object v0
.end method

.method public getInternalState()Ljava/lang/String;
    .registers 2

    .prologue
    .line 846
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->native_get_internal_state()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 496
    const-string v0, "gps"

    return-object v0
.end method

.method public getNetInitiatedListener()Landroid/location/INetInitiatedListener;
    .registers 2

    .prologue
    .line 2643
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->mNetInitiatedListener:Landroid/location/INetInitiatedListener;

    return-object v0
.end method

.method public getPowerRequirement()I
    .registers 2

    .prologue
    .line 689
    const/4 v0, 0x3

    return v0
.end method

.method public getStatus(Landroid/os/Bundle;)I
    .registers 4
    .parameter "extras"

    .prologue
    .line 771
    if-eqz p1, :cond_9

    .line 772
    const-string v0, "satellites"

    iget v1, p0, Lcom/android/server/location/GpsLocationProvider;->mSvCount:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 774
    :cond_9
    iget v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStatus:I

    return v0
.end method

.method public getStatusUpdateTime()J
    .registers 3

    .prologue
    .line 787
    iget-wide v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStatusUpdateTime:J

    return-wide v0
.end method

.method public hasMonetaryCost()Z
    .registers 2

    .prologue
    .line 649
    const/4 v0, 0x0

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 767
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mEnabled:Z

    return v0
.end method

.method public meetsCriteria(Landroid/location/Criteria;)Z
    .registers 4
    .parameter "criteria"

    .prologue
    const/4 v1, 0x1

    .line 697
    invoke-virtual {p1}, Landroid/location/Criteria;->getPowerRequirement()I

    move-result v0

    if-eq v0, v1, :cond_9

    move v0, v1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public removeListener(I)V
    .registers 6
    .parameter "uid"

    .prologue
    .line 899
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v1

    .line 900
    :try_start_3
    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingListenerMessages:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/android/server/location/GpsLocationProvider;->mPendingListenerMessages:I

    .line 901
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 902
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x9

    invoke-static {v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 903
    .local v0, m:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 904
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 905
    monitor-exit v1

    .line 906
    return-void

    .line 905
    .end local v0           #m:Landroid/os/Message;
    :catchall_1f
    move-exception v2

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v2
.end method

.method public reportNiNotification(IIIIILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    .registers 22
    .parameter "notificationId"
    .parameter "niType"
    .parameter "notifyFlags"
    .parameter "timeout"
    .parameter "defaultResponse"
    .parameter "requestorId"
    .parameter "text"
    .parameter "requestorIdEncoding"
    .parameter "textEncoding"
    .parameter "extras"

    .prologue
    .line 2660
    const-string v8, "GpsLocationProvider"

    const-string v9, "reportNiNotification: entered"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2661
    const-string v8, "GpsLocationProvider"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "notificationId: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", niType: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", notifyFlags: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", timeout: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", defaultResponse: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object v0, v9

    move/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2667
    const-string v8, "GpsLocationProvider"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "requestorId: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object v0, v9

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", text: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object v0, v9

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", requestorIdEncoding: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object v0, v9

    move/from16 v1, p8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", textEncoding: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object v0, v9

    move/from16 v1, p9

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2672
    new-instance v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;

    invoke-direct {v7}, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;-><init>()V

    .line 2674
    .local v7, notification:Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;
    iput p1, v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->notificationId:I

    .line 2675
    iput p2, v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->niType:I

    .line 2676
    and-int/lit8 v8, p3, 0x1

    if-eqz v8, :cond_102

    const/4 v8, 0x1

    :goto_9a
    iput-boolean v8, v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->needNotify:Z

    .line 2677
    and-int/lit8 v8, p3, 0x2

    if-eqz v8, :cond_104

    const/4 v8, 0x1

    :goto_a1
    iput-boolean v8, v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->needVerify:Z

    .line 2678
    and-int/lit8 v8, p3, 0x4

    if-eqz v8, :cond_106

    const/4 v8, 0x1

    :goto_a8
    iput-boolean v8, v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->privacyOverride:Z

    .line 2679
    iput p4, v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->timeout:I

    .line 2680
    move/from16 v0, p5

    move-object v1, v7

    iput v0, v1, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->defaultResponse:I

    .line 2681
    move-object/from16 v0, p6

    move-object v1, v7

    iput-object v0, v1, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->requestorId:Ljava/lang/String;

    .line 2682
    move-object/from16 v0, p7

    move-object v1, v7

    iput-object v0, v1, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->text:Ljava/lang/String;

    .line 2683
    move/from16 v0, p8

    move-object v1, v7

    iput v0, v1, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->requestorIdEncoding:I

    .line 2684
    move/from16 v0, p9

    move-object v1, v7

    iput v0, v1, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->textEncoding:I

    .line 2688
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 2690
    .local v2, bundle:Landroid/os/Bundle;
    if-nez p10, :cond_ce

    const-string p10, ""

    .line 2691
    :cond_ce
    new-instance v5, Ljava/util/Properties;

    invoke-direct {v5}, Ljava/util/Properties;-><init>()V

    .line 2694
    .local v5, extraProp:Ljava/util/Properties;
    :try_start_d3
    new-instance v8, Ljava/io/StringBufferInputStream;

    move-object v0, v8

    move-object/from16 v1, p10

    invoke-direct {v0, v1}, Ljava/io/StringBufferInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_de
    .catch Ljava/io/IOException; {:try_start_d3 .. :try_end_de} :catch_108

    .line 2701
    :goto_de
    invoke-virtual {v5}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .end local p1
    .end local p2
    .local v6, i$:Ljava/util/Iterator;
    :goto_e6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_126

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 2703
    .local v4, ent:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {v2, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e6

    .line 2676
    .end local v2           #bundle:Landroid/os/Bundle;
    .end local v4           #ent:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v5           #extraProp:Ljava/util/Properties;
    .end local v6           #i$:Ljava/util/Iterator;
    .restart local p1
    .restart local p2
    :cond_102
    const/4 v8, 0x0

    goto :goto_9a

    .line 2677
    :cond_104
    const/4 v8, 0x0

    goto :goto_a1

    .line 2678
    :cond_106
    const/4 v8, 0x0

    goto :goto_a8

    .line 2696
    .restart local v2       #bundle:Landroid/os/Bundle;
    .restart local v5       #extraProp:Ljava/util/Properties;
    :catch_108
    move-exception v8

    move-object v3, v8

    .line 2698
    .local v3, e:Ljava/io/IOException;
    const-string v8, "GpsLocationProvider"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "reportNiNotification cannot parse extras data: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object v0, v9

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_de

    .line 2706
    .end local v3           #e:Ljava/io/IOException;
    .end local p1
    .end local p2
    .restart local v6       #i$:Ljava/util/Iterator;
    :cond_126
    iput-object v2, v7, Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;->extras:Landroid/os/Bundle;

    .line 2708
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider;->mNIHandler:Lcom/android/internal/location/GpsNetInitiatedHandler;

    invoke-virtual {v8, v7}, Lcom/android/internal/location/GpsNetInitiatedHandler;->handleNiNotification(Lcom/android/internal/location/GpsNetInitiatedHandler$GpsNiNotification;)V

    .line 2709
    return-void
.end method

.method public requestSingleShotFix()Z
    .registers 5

    .prologue
    .line 812
    iget-boolean v1, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    if-eqz v1, :cond_6

    .line 814
    const/4 v1, 0x0

    .line 821
    :goto_5
    return v1

    .line 816
    :cond_6
    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    monitor-enter v1

    .line 817
    :try_start_9
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 818
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/16 v3, 0xa

    invoke-static {v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 819
    .local v0, m:Landroid/os/Message;
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 820
    monitor-exit v1

    .line 821
    const/4 v1, 0x1

    goto :goto_5

    .line 820
    .end local v0           #m:Landroid/os/Message;
    :catchall_20
    move-exception v2

    monitor-exit v1
    :try_end_22
    .catchall {:try_start_9 .. :try_end_22} :catchall_20

    throw v2
.end method

.method public requiresCell()Z
    .registers 2

    .prologue
    .line 640
    const/4 v0, 0x0

    return v0
.end method

.method public requiresNetwork()Z
    .registers 2

    .prologue
    .line 504
    const/4 v0, 0x1

    return v0
.end method

.method public requiresSatellite()Z
    .registers 2

    .prologue
    .line 631
    const/4 v0, 0x1

    return v0
.end method

.method public sendExtraCommand(Ljava/lang/String;Landroid/os/Bundle;)Z
    .registers 11
    .parameter "command"
    .parameter "extras"

    .prologue
    .line 928
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 929
    .local v0, identity:J
    const/4 v2, 0x0

    .line 931
    .local v2, result:Z
    const-string v5, "delete_aiding_data"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 932
    invoke-direct {p0, p2}, Lcom/android/server/location/GpsLocationProvider;->deleteAidingData(Landroid/os/Bundle;)Z

    move-result v2

    .line 953
    :cond_11
    :goto_11
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 954
    return v2

    .line 933
    :cond_15
    const-string v5, "force_time_injection"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 934
    const/4 v5, 0x5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {p0, v5, v6, v7}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 935
    const/4 v2, 0x1

    goto :goto_11

    .line 936
    :cond_25
    const-string v5, "force_xtra_injection"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_36

    .line 937
    iget-boolean v5, p0, Lcom/android/server/location/GpsLocationProvider;->mSupportsXtra:Z

    if-eqz v5, :cond_11

    .line 938
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider;->xtraDownloadRequest()V

    .line 939
    const/4 v2, 0x1

    goto :goto_11

    .line 941
    :cond_36
    const-string v5, "set_csc_parameters"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 942
    invoke-virtual {p0, p2}, Lcom/android/server/location/GpsLocationProvider;->setCscParameters(Landroid/os/Bundle;)V

    .line 943
    const/4 v2, 0x1

    goto :goto_11

    .line 944
    :cond_43
    const-string v5, "set_agps_server"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5f

    .line 945
    const-string v5, "server_url"

    invoke-virtual {p2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 946
    .local v4, server_url:Ljava/lang/String;
    const-string v5, "server_port"

    const/16 v6, 0x1c6b

    invoke-virtual {p2, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 947
    .local v3, server_port:I
    const/4 v5, 0x1

    invoke-direct {p0, v5, v4, v3}, Lcom/android/server/location/GpsLocationProvider;->native_set_agps_server(ILjava/lang/String;I)V

    .line 948
    const/4 v2, 0x1

    .line 949
    goto :goto_11

    .line 950
    .end local v3           #server_port:I
    .end local v4           #server_url:Ljava/lang/String;
    :cond_5f
    const-string v5, "GpsLocationProvider"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "sendExtraCommand: unknown command "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_11
.end method

.method setCscParameters(Landroid/os/Bundle;)V
    .registers 8
    .parameter "extras"

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    const-string v3, "GpsLocationProvider"

    .line 2864
    const-string v0, "GpsLocationProvider"

    const-string v0, "setCscParameters"

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2866
    if-nez p1, :cond_e

    .line 2884
    :cond_d
    :goto_d
    return-void

    .line 2869
    :cond_e
    const-string v0, "operation_mode"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->operation:Ljava/lang/String;

    .line 2870
    const-string v0, "GpsLocationProvider"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Operation Mode : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->operation:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2871
    const-string v0, "hslp_addr"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->addr:Ljava/lang/String;

    .line 2872
    const-string v0, "GpsLocationProvider"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Addr  : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->addr:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2873
    const-string v0, "hslp_port"

    const/16 v2, 0x1c6c

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/server/location/GpsLocationProvider;->port:I

    .line 2874
    const-string v0, "GpsLocationProvider"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "port : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->port:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2875
    const-string v0, "ssl"

    invoke-virtual {p1, v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/server/location/GpsLocationProvider;->ssl:I

    .line 2876
    const-string v0, "GpsLocationProvider"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ssl : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->ssl:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2877
    const-string v0, "ssl_cert"

    invoke-virtual {p1, v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/server/location/GpsLocationProvider;->ssl_cert:I

    .line 2878
    const-string v0, "GpsLocationProvider"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ssl_cert : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/android/server/location/GpsLocationProvider;->ssl_cert:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2880
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider;->operation:Ljava/lang/String;

    const-string v2, "MSBASED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 2881
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider;->addr:Ljava/lang/String;

    iget v3, p0, Lcom/android/server/location/GpsLocationProvider;->port:I

    iget v4, p0, Lcom/android/server/location/GpsLocationProvider;->ssl:I

    iget v5, p0, Lcom/android/server/location/GpsLocationProvider;->ssl_cert:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_set_supl_server(ILjava/lang/String;III)V

    .line 2882
    iput v1, p0, Lcom/android/server/location/GpsLocationProvider;->cscgps:I

    goto/16 :goto_d
.end method

.method public setMinTime(JLandroid/os/WorkSource;)V
    .registers 11
    .parameter "minTime"
    .parameter "ws"

    .prologue
    const/4 v2, 0x0

    const-string v6, "GpsLocationProvider"

    .line 831
    const-string v0, "GpsLocationProvider"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setMinTime "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 833
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_43

    .line 834
    long-to-int v0, p1

    iput v0, p0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    .line 836
    iget-boolean v0, p0, Lcom/android/server/location/GpsLocationProvider;->mStarted:Z

    if-eqz v0, :cond_43

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/server/location/GpsLocationProvider;->hasCapability(I)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 837
    iget v1, p0, Lcom/android/server/location/GpsLocationProvider;->mPositionMode:I

    iget v3, p0, Lcom/android/server/location/GpsLocationProvider;->mFixInterval:I

    move-object v0, p0

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->native_set_position_mode(IIIII)Z

    move-result v0

    if-nez v0, :cond_43

    .line 839
    const-string v0, "GpsLocationProvider"

    const-string v0, "set_position_mode failed in setMinTime()"

    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 843
    :cond_43
    return-void
.end method

.method public supportsAltitude()Z
    .registers 2

    .prologue
    .line 659
    const/4 v0, 0x1

    return v0
.end method

.method public supportsBearing()Z
    .registers 2

    .prologue
    .line 679
    const/4 v0, 0x1

    return v0
.end method

.method public supportsSpeed()Z
    .registers 2

    .prologue
    .line 669
    const/4 v0, 0x1

    return v0
.end method

.method public updateLocation(Landroid/location/Location;)V
    .registers 4
    .parameter "location"

    .prologue
    .line 615
    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 616
    return-void
.end method

.method public updateNetworkState(ILandroid/net/NetworkInfo;)V
    .registers 4
    .parameter "state"
    .parameter "info"

    .prologue
    .line 508
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1, p2}, Lcom/android/server/location/GpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    .line 509
    return-void
.end method
