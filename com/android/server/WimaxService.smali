.class public Lcom/android/server/WimaxService;
.super Landroid/net/wimax/IWimaxManager$Stub;
.source "WimaxService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/WimaxService$Multicaster;,
        Lcom/android/server/WimaxService$DeathRecipient;,
        Lcom/android/server/WimaxService$LockList;,
        Lcom/android/server/WimaxService$WimaxLock;,
        Lcom/android/server/WimaxService$WimaxHandler;
    }
.end annotation


# static fields
.field private static final DEFAULT_IDLE_MILLIS:J = 0xdbba0L

.field private static final DEFAULT_WAKELOCK_TIMEOUT:I = 0x1f40

.field private static final MESSAGE_DISABLE_WIMAX:I = 0x1

.field private static final MESSAGE_ENABLE_WIMAX:I = 0x0

.field private static final MESSAGE_RELEASE_WAKELOCK:I = 0x4

.field private static final MESSAGE_START_WIMAX:I = 0x3

.field private static final MESSAGE_STOP_WIMAX:I = 0x2

.field private static final TAG:Ljava/lang/String; = "WimaxService"

.field private static final USB_CONNECTED:[B = null

.field private static final USB_STATE:Ljava/lang/String; = "/sys/class/sec/switch/usb_state"

.field private static final WAKELOCK_TAG:Ljava/lang/String; = "WimaxService"

.field private static mIsBackhaulMode:Z

.field private static mIsDMmode:Z

.field private static mIsTetheredmode:Z

.field private static mModeWhieAPsleep:B

.field private static mbUSBTethered:Z

.field private static sDriverStopWakeLock:Landroid/os/PowerManager$WakeLock;

.field private static sWakeLock:Landroid/os/PowerManager$WakeLock;


# instance fields
.field private mAirplaneModeOverwridden:Z

.field private mAvailableList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wimax/structs/NspInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mBatteryStats:Lcom/android/internal/app/IBatteryStats;

.field mConnectedNspInfo:Landroid/net/wimax/structs/NspInfo;

.field mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

.field private mContext:Landroid/content/Context;

.field mDeviceInfo:Landroid/net/wimax/DeviceInfo;

.field private mFullLocksAcquired:I

.field private mFullLocksReleased:I

.field private mLastEnableUid:I

.field private final mLocks:Lcom/android/server/WimaxService$LockList;

.field private mMulticastDisabled:I

.field private mMulticastEnabled:I

.field private final mMulticasters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/WimaxService$Multicaster;",
            ">;"
        }
    .end annotation
.end field

.field private mNetworkList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wimax/structs/NspInfo;",
            ">;"
        }
    .end annotation
.end field

.field mNspInfo:Landroid/net/wimax/structs/NspInfo;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSprintExtension:Lcom/sprint/internal/SystemProperties;

.field private final mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;

.field private mWimaxMonitor:Landroid/net/wimax/WimaxMonitor;

.field private final mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

.field private mWimaxStatus:I

.field private m_bLog:Z

.field private m_isBootCompleted:Z

.field m_nCallState:I

.field private m_nPluggedType:I

.field telMgr:Landroid/telephony/TelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 174
    sput-boolean v0, Lcom/android/server/WimaxService;->mIsTetheredmode:Z

    .line 175
    sput-boolean v0, Lcom/android/server/WimaxService;->mIsDMmode:Z

    .line 176
    sput-boolean v0, Lcom/android/server/WimaxService;->mIsBackhaulMode:Z

    .line 177
    sput-boolean v0, Lcom/android/server/WimaxService;->mbUSBTethered:Z

    .line 179
    const/4 v0, 0x1

    sput-byte v0, Lcom/android/server/WimaxService;->mModeWhieAPsleep:B

    .line 182
    const/16 v0, 0x14

    new-array v0, v0, [B

    fill-array-data v0, :array_16

    sput-object v0, Lcom/android/server/WimaxService;->USB_CONNECTED:[B

    return-void

    :array_16
    .array-data 0x1
        0x55t
        0x53t
        0x42t
        0x5ft
        0x53t
        0x54t
        0x41t
        0x54t
        0x45t
        0x5ft
        0x43t
        0x4ft
        0x4et
        0x46t
        0x49t
        0x47t
        0x55t
        0x52t
        0x45t
        0x44t
    .end array-data
.end method

.method constructor <init>(Landroid/content/Context;Landroid/net/wimax/WimaxStateTracker;)V
    .registers 12
    .parameter "context"
    .parameter "tracker"

    .prologue
    const/4 v5, 0x0

    const/4 v8, 0x1

    const/4 v6, 0x0

    const-string v7, "WimaxService"

    .line 192
    invoke-direct {p0}, Landroid/net/wimax/IWimaxManager$Stub;-><init>()V

    .line 105
    iput-boolean v6, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    .line 117
    new-instance v4, Lcom/android/server/WimaxService$LockList;

    invoke-direct {v4, p0, v5}, Lcom/android/server/WimaxService$LockList;-><init>(Lcom/android/server/WimaxService;Lcom/android/server/WimaxService$1;)V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;

    .line 122
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    .line 128
    iput-object v5, p0, Lcom/android/server/WimaxService;->mSprintExtension:Lcom/sprint/internal/SystemProperties;

    .line 129
    iput-boolean v6, p0, Lcom/android/server/WimaxService;->m_isBootCompleted:Z

    .line 167
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    .line 168
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mNetworkList:Ljava/util/List;

    .line 169
    new-instance v4, Landroid/net/wimax/structs/NspInfo;

    invoke-direct {v4}, Landroid/net/wimax/structs/NspInfo;-><init>()V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mNspInfo:Landroid/net/wimax/structs/NspInfo;

    .line 170
    new-instance v4, Landroid/net/wimax/structs/NspInfo;

    invoke-direct {v4}, Landroid/net/wimax/structs/NspInfo;-><init>()V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mConnectedNspInfo:Landroid/net/wimax/structs/NspInfo;

    .line 171
    new-instance v4, Landroid/net/wimax/ConnectionStatistics;

    invoke-direct {v4}, Landroid/net/wimax/ConnectionStatistics;-><init>()V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    .line 172
    new-instance v4, Landroid/net/wimax/DeviceInfo;

    invoke-direct {v4}, Landroid/net/wimax/DeviceInfo;-><init>()V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mDeviceInfo:Landroid/net/wimax/DeviceInfo;

    .line 187
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v4

    iput v4, p0, Lcom/android/server/WimaxService;->mLastEnableUid:I

    .line 190
    iput v6, p0, Lcom/android/server/WimaxService;->m_nCallState:I

    .line 977
    new-instance v4, Lcom/android/server/WimaxService$5;

    invoke-direct {v4, p0}, Lcom/android/server/WimaxService$5;-><init>(Lcom/android/server/WimaxService;)V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 193
    iput-object p1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    .line 194
    iput-object p2, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    .line 195
    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v4

    iput-object v4, p0, Lcom/android/server/WimaxService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    .line 197
    new-instance v1, Landroid/os/HandlerThread;

    const-string v4, "WimaxService"

    invoke-direct {v1, v7}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 198
    .local v1, WimaxThread:Landroid/os/HandlerThread;
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 199
    new-instance v4, Lcom/android/server/WimaxService$WimaxHandler;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/android/server/WimaxService$WimaxHandler;-><init>(Lcom/android/server/WimaxService;Landroid/os/Looper;)V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;

    .line 201
    iput v8, p0, Lcom/android/server/WimaxService;->mWimaxStatus:I

    .line 202
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getPersistedWimaxEnabled()Z

    move-result v0

    .line 203
    .local v0, WimaxEnabled:Z
    iget-object v4, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iput-boolean v6, v4, Landroid/net/wimax/WimaxStateTracker;->m_bPoweroff:Z

    .line 206
    new-instance v4, Lcom/sprint/internal/SystemProperties;

    iget-object v5, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/sprint/internal/SystemProperties;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/server/WimaxService;->mSprintExtension:Lcom/sprint/internal/SystemProperties;

    .line 207
    iput-boolean v6, p0, Lcom/android/server/WimaxService;->m_isBootCompleted:Z

    .line 209
    iget-object v4, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v5, "power"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    .line 210
    .local v3, powerManager:Landroid/os/PowerManager;
    const-string v4, "WimaxService"

    invoke-virtual {v3, v8, v7}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    sput-object v4, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 211
    const-string v4, "WimaxService"

    invoke-virtual {v3, v8, v7}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    sput-object v4, Lcom/android/server/WimaxService;->sDriverStopWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 212
    iget-object v4, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    new-instance v5, Lcom/android/server/WimaxService$1;

    invoke-direct {v5, p0}, Lcom/android/server/WimaxService$1;-><init>(Lcom/android/server/WimaxService;)V

    invoke-virtual {v4, v5}, Landroid/net/wimax/WimaxStateTracker;->setReleaseWakeLockCallback(Ljava/lang/Runnable;)V

    .line 226
    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "WimaxService starting up with Wimax"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v0, :cond_116

    const-string v5, "enabled"

    :goto_be
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    iget-object v4, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v4, v6}, Landroid/net/wimax/WimaxStateTracker;->isBootCompleted(Z)V

    .line 229
    iget-object v4, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    sget-object v5, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v4, v5}, Landroid/net/wimax/WimaxStateTracker;->setWakeLock(Landroid/os/PowerManager$WakeLock;)V

    .line 230
    iget-object v4, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    new-instance v5, Lcom/android/server/WimaxService$2;

    invoke-direct {v5, p0}, Lcom/android/server/WimaxService$2;-><init>(Lcom/android/server/WimaxService;)V

    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 241
    iget-object v4, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    new-instance v5, Lcom/android/server/WimaxService$3;

    invoke-direct {v5, p0}, Lcom/android/server/WimaxService$3;-><init>(Lcom/android/server/WimaxService;)V

    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "com.sprint.android.SPRINTEXTENSION_STARTED"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 256
    invoke-direct {p0}, Lcom/android/server/WimaxService;->getEnableLog()Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    .line 258
    iget-object v4, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v5, "phone"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    iput-object v4, p0, Lcom/android/server/WimaxService;->telMgr:Landroid/telephony/TelephonyManager;

    .line 259
    new-instance v2, Lcom/android/server/WimaxService$4;

    invoke-direct {v2, p0}, Lcom/android/server/WimaxService$4;-><init>(Lcom/android/server/WimaxService;)V

    .line 288
    .local v2, listener:Landroid/telephony/PhoneStateListener;
    iget-object v4, p0, Lcom/android/server/WimaxService;->telMgr:Landroid/telephony/TelephonyManager;

    const/16 v5, 0x20

    invoke-virtual {v4, v2, v5}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 289
    return-void

    .line 226
    .end local v2           #listener:Landroid/telephony/PhoneStateListener;
    :cond_116
    const-string v5, "disabled"

    goto :goto_be
.end method

.method static synthetic access$100(Lcom/android/server/WimaxService;)Lcom/android/server/WimaxService$WimaxHandler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/server/WimaxService;Landroid/os/PowerManager$WakeLock;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService;->acquire_WakeLock(Landroid/os/PowerManager$WakeLock;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/server/WimaxService;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    iget v0, p0, Lcom/android/server/WimaxService;->m_nPluggedType:I

    return v0
.end method

.method static synthetic access$1102(Lcom/android/server/WimaxService;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 103
    iput p1, p0, Lcom/android/server/WimaxService;->m_nPluggedType:I

    return p1
.end method

.method static synthetic access$1200()Z
    .registers 1

    .prologue
    .line 103
    sget-boolean v0, Lcom/android/server/WimaxService;->mbUSBTethered:Z

    return v0
.end method

.method static synthetic access$1202(Z)Z
    .registers 1
    .parameter "x0"

    .prologue
    .line 103
    sput-boolean p0, Lcom/android/server/WimaxService;->mbUSBTethered:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/android/server/WimaxService;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/android/server/WimaxService;->getEnableLog()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1500(Lcom/android/server/WimaxService;)Lcom/android/server/WimaxService$LockList;
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    iget-object v0, p0, Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/server/WimaxService;Landroid/os/IBinder;)Z
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService;->releaseWimaxLockLocked(Landroid/os/IBinder;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1900(Lcom/android/server/WimaxService;)Ljava/util/List;
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    iget-object v0, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200()Landroid/os/PowerManager$WakeLock;
    .registers 1

    .prologue
    .line 103
    sget-object v0, Lcom/android/server/WimaxService;->sDriverStopWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/android/server/WimaxService;II)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 103
    invoke-direct {p0, p1, p2}, Lcom/android/server/WimaxService;->removeMulticasterLocked(II)V

    return-void
.end method

.method static synthetic access$302(Lcom/android/server/WimaxService;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 103
    iput-boolean p1, p0, Lcom/android/server/WimaxService;->mAirplaneModeOverwridden:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/server/WimaxService;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/android/server/WimaxService;->updateWimaxStatus()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/WimaxService;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    iget-boolean v0, p0, Lcom/android/server/WimaxService;->m_isBootCompleted:Z

    return v0
.end method

.method static synthetic access$502(Lcom/android/server/WimaxService;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 103
    iput-boolean p1, p0, Lcom/android/server/WimaxService;->m_isBootCompleted:Z

    return p1
.end method

.method static synthetic access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/server/WimaxService;ZZI)Z
    .registers 5
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 103
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/WimaxService;->setWimaxEnabledBlocking(ZZI)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/android/server/WimaxService;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 103
    iget-boolean v0, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    return v0
.end method

.method static synthetic access$802(Lcom/android/server/WimaxService;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 103
    iput-boolean p1, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    return p1
.end method

.method static synthetic access$900()Landroid/os/PowerManager$WakeLock;
    .registers 1

    .prologue
    .line 103
    sget-object v0, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method private acquireWimaxLockLocked(Lcom/android/server/WimaxService$WimaxLock;)Z
    .registers 8
    .parameter "WimaxLock"

    .prologue
    .line 1465
    const-string v3, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "acquireWimaxLockLocked: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1467
    iget-object v3, p0, Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;

    #calls: Lcom/android/server/WimaxService$LockList;->addLock(Lcom/android/server/WimaxService$WimaxLock;)V
    invoke-static {v3, p1}, Lcom/android/server/WimaxService$LockList;->access$1700(Lcom/android/server/WimaxService$LockList;Lcom/android/server/WimaxService$WimaxLock;)V

    .line 1468
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    .line 1469
    .local v2, uid:I
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 1471
    .local v0, ident:J
    :try_start_25
    iget v3, p1, Lcom/android/server/WimaxService$DeathRecipient;->mMode:I
    :try_end_27
    .catchall {:try_start_25 .. :try_end_27} :catchall_40
    .catch Landroid/os/RemoteException; {:try_start_25 .. :try_end_27} :catch_3e

    packed-switch v3, :pswitch_data_46

    .line 1479
    :goto_2a
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1481
    invoke-direct {p0}, Lcom/android/server/WimaxService;->updateWimaxStatus()V

    .line 1482
    const/4 v3, 0x1

    return v3

    .line 1473
    :pswitch_32
    :try_start_32
    iget v3, p0, Lcom/android/server/WimaxService;->mFullLocksAcquired:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/server/WimaxService;->mFullLocksAcquired:I

    .line 1474
    iget-object v3, p0, Lcom/android/server/WimaxService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v3, v2}, Lcom/android/internal/app/IBatteryStats;->noteFullWimaxLockAcquired(I)V
    :try_end_3d
    .catchall {:try_start_32 .. :try_end_3d} :catchall_40
    .catch Landroid/os/RemoteException; {:try_start_32 .. :try_end_3d} :catch_3e

    goto :goto_2a

    .line 1477
    :catch_3e
    move-exception v3

    goto :goto_2a

    .line 1479
    :catchall_40
    move-exception v3

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v3

    .line 1471
    nop

    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_32
    .end packed-switch
.end method

.method private acquire_WakeLock(Landroid/os/PowerManager$WakeLock;)V
    .registers 4
    .parameter "wl"

    .prologue
    const-string v1, "WimaxService"

    .line 543
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 544
    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 546
    iget-boolean v0, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v0, :cond_16

    const-string v0, "WimaxService"

    const-string v0, "------WakeLock already acquired----------------"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 553
    :cond_16
    :goto_16
    return-void

    .line 550
    :cond_17
    const-string v0, "WimaxService"

    const-string v0, "------WakeLock will be acquired----------------"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 551
    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    goto :goto_16
.end method

.method private enforceAccessPermission()V
    .registers 4

    .prologue
    .line 502
    iget-object v0, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_WIMAX_STATE"

    const-string v2, "WimaxService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    return-void
.end method

.method private enforceChangePermission()V
    .registers 4

    .prologue
    .line 507
    iget-object v0, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.CHANGE_WIMAX_STATE"

    const-string v2, "WimaxService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    return-void
.end method

.method private enforceMulticastChangePermission()V
    .registers 4

    .prologue
    .line 511
    iget-object v0, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.CHANGE_WIMAX_MULTICAST_STATE"

    const-string v2, "WimaxService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    return-void
.end method

.method private getEnableLog()Z
    .registers 16

    .prologue
    const/4 v12, 0x0

    const-string v14, "file close error"

    const-string v13, "WimaxService"

    .line 1638
    const/4 v8, 0x0

    .line 1640
    .local v8, msg:Ljava/lang/String;
    const/4 v0, 0x0

    .line 1641
    .local v0, br:Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .line 1643
    .local v3, fis:Ljava/io/FileInputStream;
    :try_start_8
    new-instance v4, Ljava/io/FileInputStream;

    const-string v9, "/data/4G.txt"

    invoke-direct {v4, v9}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_f} :catch_3c

    .line 1650
    .end local v3           #fis:Ljava/io/FileInputStream;
    .local v4, fis:Ljava/io/FileInputStream;
    :try_start_f
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-direct {v9, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_19
    .catchall {:try_start_f .. :try_end_19} :catchall_63
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_19} :catch_40

    .line 1651
    .end local v0           #br:Ljava/io/BufferedReader;
    .local v1, br:Ljava/io/BufferedReader;
    :try_start_19
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_9e
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_a1

    move-result-object v8

    .line 1657
    :try_start_1d
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 1658
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_23} :catch_8e

    .line 1666
    const/4 v6, 0x0

    .local v6, i:I
    :goto_24
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v6, v9, :cond_6e

    .line 1668
    add-int/lit8 v9, v6, 0x1

    invoke-virtual {v8, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    const-string v10, "F"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6b

    .line 1669
    const/4 v9, 0x1

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move-object v0, v1

    .line 1671
    .end local v1           #br:Ljava/io/BufferedReader;
    .end local v6           #i:I
    .restart local v0       #br:Ljava/io/BufferedReader;
    :goto_3b
    return v9

    .line 1644
    :catch_3c
    move-exception v9

    move-object v5, v9

    .local v5, fnfe:Ljava/io/FileNotFoundException;
    move v9, v12

    .line 1646
    goto :goto_3b

    .line 1652
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v5           #fnfe:Ljava/io/FileNotFoundException;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_40
    move-exception v9

    move-object v2, v9

    .line 1653
    .local v2, e:Ljava/io/IOException;
    :goto_42
    :try_start_42
    const-string v9, "WimaxService"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "File error : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5a
    .catchall {:try_start_42 .. :try_end_5a} :catchall_63

    .line 1657
    :try_start_5a
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 1658
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_60
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_60} :catch_81

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move v9, v12

    .line 1654
    goto :goto_3b

    .line 1656
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catchall_63
    move-exception v9

    .line 1657
    :goto_64
    :try_start_64
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 1658
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_6a} :catch_72

    .line 1656
    throw v9

    .line 1666
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v6       #i:I
    :cond_6b
    add-int/lit8 v6, v6, 0x1

    goto :goto_24

    :cond_6e
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move v9, v12

    .line 1671
    goto :goto_3b

    .line 1659
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v6           #i:I
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_72
    move-exception v9

    move-object v7, v9

    .line 1660
    .local v7, ioe:Ljava/io/IOException;
    const-string v9, "WimaxService"

    const-string v9, "file close error"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1661
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    :goto_7e
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move v9, v12

    .line 1662
    goto :goto_3b

    .line 1659
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v7           #ioe:Ljava/io/IOException;
    .restart local v2       #e:Ljava/io/IOException;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_81
    move-exception v9

    move-object v7, v9

    .line 1660
    .restart local v7       #ioe:Ljava/io/IOException;
    const-string v9, "WimaxService"

    const-string v9, "file close error"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1661
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7e

    .line 1659
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/io/IOException;
    .end local v7           #ioe:Ljava/io/IOException;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :catch_8e
    move-exception v9

    move-object v7, v9

    .line 1660
    .restart local v7       #ioe:Ljava/io/IOException;
    const-string v9, "WimaxService"

    const-string v9, "file close error"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1661
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move v9, v12

    .line 1662
    goto :goto_3b

    .line 1656
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v7           #ioe:Ljava/io/IOException;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catchall_9e
    move-exception v9

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_64

    .line 1652
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :catch_a1
    move-exception v9

    move-object v2, v9

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_42
.end method

.method private getPersistedNetworkConnectionEnabled()Z
    .registers 6

    .prologue
    const/4 v3, 0x1

    const-string v4, "wimax_network_connection"

    .line 307
    iget-object v2, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 309
    .local v0, cr:Landroid/content/ContentResolver;
    :try_start_9
    const-string v2, "wimax_network_connection"

    invoke-static {v0, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_e
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_9 .. :try_end_e} :catch_15

    move-result v2

    if-ne v2, v3, :cond_13

    move v2, v3

    .line 312
    :goto_12
    return v2

    .line 309
    :cond_13
    const/4 v2, 0x0

    goto :goto_12

    .line 310
    :catch_15
    move-exception v2

    move-object v1, v2

    .line 311
    .local v1, e:Landroid/provider/Settings$SettingNotFoundException;
    const-string v2, "wimax_network_connection"

    invoke-static {v0, v4, v3}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    move v2, v3

    .line 312
    goto :goto_12
.end method

.method private isAirplaneModeOn()Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1292
    invoke-direct {p0}, Lcom/android/server/WimaxService;->isAirplaneSensitive()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "airplane_mode_on"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v3, :cond_18

    move v0, v3

    :goto_17
    return v0

    :cond_18
    move v0, v2

    goto :goto_17
.end method

.method private isAirplaneSensitive()Z
    .registers 4

    .prologue
    .line 1273
    iget-object v1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_radios"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1275
    .local v0, airplaneModeRadios:Ljava/lang/String;
    if-eqz v0, :cond_16

    const-string v1, "wimax"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_18

    :cond_16
    const/4 v1, 0x1

    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method private isAirplaneToggleable()Z
    .registers 4

    .prologue
    .line 1280
    iget-object v1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_toggleable_radios"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1282
    .local v0, toggleableRadios:Ljava/lang/String;
    if-eqz v0, :cond_18

    const-string v1, "wimax"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_18

    const/4 v1, 0x1

    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method private persistNetworkConnectionEnabled(Z)V
    .registers 5
    .parameter "enabled"

    .prologue
    .line 317
    iget-object v1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 318
    .local v0, cr:Landroid/content/ContentResolver;
    const-string v1, "wimax_network_connection"

    if-eqz p1, :cond_f

    const/4 v2, 0x1

    :goto_b
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 319
    return-void

    .line 318
    :cond_f
    const/4 v2, 0x0

    goto :goto_b
.end method

.method private persistWimaxEnabled(Z)V
    .registers 5
    .parameter "enabled"

    .prologue
    .line 302
    iget-object v1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 303
    .local v0, cr:Landroid/content/ContentResolver;
    const-string v1, "wimax_on"

    if-eqz p1, :cond_f

    const/4 v2, 0x1

    :goto_b
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 304
    return-void

    .line 303
    :cond_f
    const/4 v2, 0x0

    goto :goto_b
.end method

.method private registerForBroadcasts()V
    .registers 4

    .prologue
    .line 1261
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1262
    .local v0, intentFilter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1263
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1264
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1265
    const-string v1, "android.net.wifi.WIFI_AP_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1266
    const-string v1, "com.android.settings.TETHERING_WIMAX_REALM_CHANGE_ACTION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1267
    const-string v1, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1268
    iget-object v1, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    const-string v1, "com.android.server.WimaxManager.action.WIMAX_DHCP_RENEW"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1269
    iget-object v1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/WimaxService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1270
    return-void
.end method

.method private releaseWimaxLockLocked(Landroid/os/IBinder;)Z
    .registers 10
    .parameter "lock"

    .prologue
    .line 1495
    iget-object v5, p0, Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;

    #calls: Lcom/android/server/WimaxService$LockList;->removeLock(Landroid/os/IBinder;)Lcom/android/server/WimaxService$WimaxLock;
    invoke-static {v5, p1}, Lcom/android/server/WimaxService$LockList;->access$1800(Lcom/android/server/WimaxService$LockList;Landroid/os/IBinder;)Lcom/android/server/WimaxService$WimaxLock;

    move-result-object v4

    .line 1497
    .local v4, wimaxLock:Lcom/android/server/WimaxService$WimaxLock;
    const-string v5, "WimaxService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "releaseWimaxLockLocked: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1498
    if-eqz v4, :cond_38

    const/4 v5, 0x1

    move v0, v5

    .line 1500
    .local v0, hadLock:Z
    :goto_22
    if-eqz v0, :cond_34

    .line 1501
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    .line 1502
    .local v3, uid:I
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 1504
    .local v1, ident:J
    :try_start_2c
    iget v5, v4, Lcom/android/server/WimaxService$DeathRecipient;->mMode:I
    :try_end_2e
    .catchall {:try_start_2c .. :try_end_2e} :catchall_49
    .catch Landroid/os/RemoteException; {:try_start_2c .. :try_end_2e} :catch_47

    packed-switch v5, :pswitch_data_4e

    .line 1512
    :goto_31
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1516
    .end local v1           #ident:J
    .end local v3           #uid:I
    :cond_34
    invoke-direct {p0}, Lcom/android/server/WimaxService;->updateWimaxStatus()V

    .line 1517
    return v0

    .line 1498
    .end local v0           #hadLock:Z
    :cond_38
    const/4 v5, 0x0

    move v0, v5

    goto :goto_22

    .line 1506
    .restart local v0       #hadLock:Z
    .restart local v1       #ident:J
    .restart local v3       #uid:I
    :pswitch_3b
    :try_start_3b
    iget v5, p0, Lcom/android/server/WimaxService;->mFullLocksReleased:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/android/server/WimaxService;->mFullLocksReleased:I

    .line 1507
    iget-object v5, p0, Lcom/android/server/WimaxService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v5, v3}, Lcom/android/internal/app/IBatteryStats;->noteFullWimaxLockReleased(I)V
    :try_end_46
    .catchall {:try_start_3b .. :try_end_46} :catchall_49
    .catch Landroid/os/RemoteException; {:try_start_3b .. :try_end_46} :catch_47

    goto :goto_31

    .line 1510
    :catch_47
    move-exception v5

    goto :goto_31

    .line 1512
    :catchall_49
    move-exception v5

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5

    .line 1504
    :pswitch_data_4e
    .packed-switch 0x1
        :pswitch_3b
    .end packed-switch
.end method

.method private removeMulticasterLocked(II)V
    .registers 8
    .parameter "i"
    .parameter "uid"

    .prologue
    .line 1610
    iget-object v2, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WimaxService$Multicaster;

    .line 1611
    .local v1, removed:Lcom/android/server/WimaxService$Multicaster;
    if-eqz v1, :cond_d

    .line 1612
    invoke-virtual {v1}, Lcom/android/server/WimaxService$Multicaster;->unlinkDeathRecipient()V

    .line 1614
    :cond_d
    iget-object v2, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_19

    .line 1615
    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    monitor-enter v2

    .line 1617
    :try_start_18
    monitor-exit v2
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_2e

    .line 1620
    :cond_19
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 1622
    .local v0, ident:Ljava/lang/Long;
    :try_start_21
    iget-object v2, p0, Lcom/android/server/WimaxService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v2, p2}, Lcom/android/internal/app/IBatteryStats;->noteWimaxMulticastDisabled(I)V
    :try_end_26
    .catchall {:try_start_21 .. :try_end_26} :catchall_31
    .catch Landroid/os/RemoteException; {:try_start_21 .. :try_end_26} :catch_3a

    .line 1625
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    :goto_2a
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1627
    return-void

    .line 1617
    .end local v0           #ident:Ljava/lang/Long;
    :catchall_2e
    move-exception v3

    :try_start_2f
    monitor-exit v2
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_2e

    throw v3

    .line 1625
    .restart local v0       #ident:Ljava/lang/Long;
    :catchall_31
    move-exception v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 1623
    :catch_3a
    move-exception v2

    .line 1625
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_2a
.end method

.method private sendEnableMessage(ZZI)V
    .registers 9
    .parameter "enable"
    .parameter "persist"
    .parameter "uid"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1232
    iget-object v1, p0, Lcom/android/server/WimaxService;->mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;

    if-eqz p1, :cond_12

    move v2, v3

    :goto_7
    if-eqz p2, :cond_a

    move v3, v4

    :cond_a
    invoke-static {v1, v2, v3, p3}, Landroid/os/Message;->obtain(Landroid/os/Handler;III)Landroid/os/Message;

    move-result-object v0

    .line 1235
    .local v0, msg:Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1236
    return-void

    .end local v0           #msg:Landroid/os/Message;
    :cond_12
    move v2, v4

    .line 1232
    goto :goto_7
.end method

.method private setWimaxEnabledBlocking(ZZI)Z
    .registers 16
    .parameter "enable"
    .parameter "persist"
    .parameter "uid"

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    const-string v9, "WimaxService"

    .line 369
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v1

    .line 370
    .local v1, nWimaxEnabledStatus:I
    if-nez p1, :cond_19

    if-eq v1, v7, :cond_10

    if-nez v1, :cond_19

    .line 371
    :cond_10
    const-string v5, "WimaxService"

    const-string v5, "[setWimaxEnabledBlocking] already disabled"

    invoke-static {v9, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v5, v7

    .line 473
    :goto_18
    return v5

    .line 374
    :cond_19
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iget-boolean v5, v5, Landroid/net/wimax/WimaxStateTracker;->mModemReset:Z

    if-nez v5, :cond_2f

    .line 375
    if-ne p1, v7, :cond_2f

    const/4 v5, 0x3

    if-eq v1, v5, :cond_26

    if-ne v1, v10, :cond_2f

    .line 376
    :cond_26
    const-string v5, "WimaxService"

    const-string v5, "[setWimaxEnabledBlocking] already enabled"

    invoke-static {v9, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v5, v7

    .line 377
    goto :goto_18

    .line 380
    :cond_2f
    if-eqz p1, :cond_12c

    const/4 v5, 0x3

    move v0, v5

    .line 382
    .local v0, eventualWimaxStatus:I
    :goto_33
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getWorkModeState()I

    move-result v3

    .line 383
    .local v3, nWorkModeState:I
    const-string v5, "WimaxService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[setWimaxEnabledBlocking] Workmode = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    if-eqz p1, :cond_12f

    move v5, v10

    :goto_52
    invoke-direct {p0, v5, p3}, Lcom/android/server/WimaxService;->setWimaxEnabledState(II)V

    .line 395
    if-eqz p1, :cond_179

    .line 396
    const-string v5, "WimaxService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "wimax ON ---mModeWhieAPsleep = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-byte v6, Lcom/android/server/WimaxService;->mModeWhieAPsleep:B

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " mModemReset = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iget-boolean v6, v6, Landroid/net/wimax/WimaxStateTracker;->mModemReset:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " mIsDMmode = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-boolean v6, Lcom/android/server/WimaxService;->mIsDMmode:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " mbUSBTethered = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-boolean v6, Lcom/android/server/WimaxService;->mbUSBTethered:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " m_nPluggedType : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/server/WimaxService;->m_nPluggedType:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    invoke-direct {p0}, Lcom/android/server/WimaxService;->getPersistedNetworkConnectionEnabled()Z

    move-result v5

    if-eqz v5, :cond_132

    .line 399
    sput-byte v7, Lcom/android/server/WimaxService;->mModeWhieAPsleep:B

    .line 404
    :goto_ab
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iget-boolean v5, v5, Landroid/net/wimax/WimaxStateTracker;->mModemReset:Z

    if-nez v5, :cond_136

    .line 406
    invoke-direct {p0}, Lcom/android/server/WimaxService;->registerForBroadcasts()V

    .line 407
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v5}, Landroid/net/wimax/WimaxStateTracker;->startEventLoop()V

    .line 411
    :goto_b9
    sget-byte v5, Lcom/android/server/WimaxService;->mModeWhieAPsleep:B

    invoke-static {v5}, Landroid/net/wimax/WimaxNative;->setVirtualIdleWhileAPsleep(B)Z

    .line 413
    sget-boolean v5, Lcom/android/server/WimaxService;->mbUSBTethered:Z

    if-eqz v5, :cond_13c

    iget v5, p0, Lcom/android/server/WimaxService;->m_nPluggedType:I

    if-ne v5, v10, :cond_13c

    .line 414
    invoke-virtual {p0, v7, v7}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 418
    :goto_c9
    sget-boolean v5, Lcom/android/server/WimaxService;->mIsDMmode:Z

    if-eqz v5, :cond_140

    .line 419
    invoke-static {v11}, Landroid/net/wimax/WimaxNative;->setWimaxTethered(B)Z

    .line 424
    :goto_d0
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iput-boolean v8, v5, Landroid/net/wimax/WimaxStateTracker;->m_bPoweroff:Z

    .line 425
    invoke-static {}, Landroid/net/wimax/WimaxNative;->startWimax()Z

    move-result v5

    if-nez v5, :cond_148

    .line 426
    invoke-static {v8}, Landroid/net/wimax/WimaxNative;->loadDriver(B)Z

    .line 427
    const-string v5, "WimaxService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to start Wimax. m_bPoweroff = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iget-boolean v6, v6, Landroid/net/wimax/WimaxStateTracker;->m_bPoweroff:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    iget-object v5, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/WimaxService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v5, v6}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 429
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iget-boolean v5, v5, Landroid/net/wimax/WimaxStateTracker;->m_bPoweroff:Z

    if-eqz v5, :cond_144

    .line 430
    const-string v5, "WimaxService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mWimaxStatus = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/server/WimaxService;->mWimaxStatus:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    invoke-direct {p0, v7, p3}, Lcom/android/server/WimaxService;->setWimaxEnabledState(II)V

    .line 434
    :goto_123
    invoke-direct {p0, v11, p3}, Lcom/android/server/WimaxService;->setWimaxEnabledState(II)V

    .line 435
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->release_sWakeLock()V

    move v5, v8

    .line 436
    goto/16 :goto_18

    .end local v0           #eventualWimaxStatus:I
    .end local v3           #nWorkModeState:I
    :cond_12c
    move v0, v7

    .line 380
    goto/16 :goto_33

    .restart local v0       #eventualWimaxStatus:I
    .restart local v3       #nWorkModeState:I
    :cond_12f
    move v5, v8

    .line 393
    goto/16 :goto_52

    .line 401
    :cond_132
    sput-byte v8, Lcom/android/server/WimaxService;->mModeWhieAPsleep:B

    goto/16 :goto_ab

    .line 409
    :cond_136
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iput-boolean v8, v5, Landroid/net/wimax/WimaxStateTracker;->mModemReset:Z

    goto/16 :goto_b9

    .line 416
    :cond_13c
    invoke-virtual {p0, v7, v8}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    goto :goto_c9

    .line 421
    :cond_140
    invoke-static {v8}, Landroid/net/wimax/WimaxNative;->setWimaxTethered(B)Z

    goto :goto_d0

    .line 433
    :cond_144
    invoke-direct {p0, v11, p3}, Lcom/android/server/WimaxService;->setWimaxEnabledState(II)V

    goto :goto_123

    .line 439
    :cond_148
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v2

    .line 440
    .local v2, nWimaxMode:I
    if-eq v2, v11, :cond_150

    if-ne v2, v10, :cond_159

    .line 441
    :cond_150
    iget v5, p0, Lcom/android/server/WimaxService;->m_nCallState:I

    if-ne v5, v10, :cond_159

    .line 442
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v5, v7}, Landroid/net/wimax/WimaxStateTracker;->SetNoBackOff(Z)V

    .line 469
    .end local v2           #nWimaxMode:I
    :cond_159
    :goto_159
    if-eqz p2, :cond_176

    .line 470
    const-string v5, "WimaxService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[setWimaxEnabledBlocking] persist = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService;->persistWimaxEnabled(Z)V

    :cond_176
    move v5, v7

    .line 473
    goto/16 :goto_18

    .line 445
    :cond_179
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iput-boolean v7, v5, Landroid/net/wimax/WimaxStateTracker;->m_bPoweroff:Z

    .line 446
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iput v8, v5, Landroid/net/wimax/WimaxStateTracker;->nRetryFlag:I

    .line 447
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v5}, Landroid/net/wimax/WimaxStateTracker;->resetOldState()V

    .line 449
    if-eq v11, v1, :cond_18f

    .line 450
    iget-object v5, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/WimaxService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v5, v6}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 451
    :cond_18f
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v5}, Landroid/net/wimax/WimaxStateTracker;->getCurrentWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    .line 452
    .local v4, wimaxState:Landroid/net/wimax/WimaxState;
    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTED:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_1a1

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_1a1

    sget-object v5, Landroid/net/wimax/WimaxState;->OBTAINING_IPADDR:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_1d0

    .line 454
    :cond_1a1
    const-string v5, "WimaxService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "state("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") :  DisconnectWimax before turn off"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v5}, Landroid/net/wimax/WimaxStateTracker;->resetInterface()V

    .line 456
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    sget-boolean v6, Lcom/android/server/WimaxService;->mIsTetheredmode:Z

    iput-boolean v6, v5, Landroid/net/wimax/WimaxStateTracker;->mIsTetheredmode:Z

    .line 457
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v5}, Landroid/net/wimax/WimaxStateTracker;->disconnectAndStop()Z

    goto :goto_159

    .line 459
    :cond_1d0
    const-string v5, "WimaxService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "state("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") : stopWimax"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    sget-boolean v6, Lcom/android/server/WimaxService;->mIsTetheredmode:Z

    iput-boolean v6, v5, Landroid/net/wimax/WimaxStateTracker;->mIsTetheredmode:Z

    .line 461
    invoke-static {}, Landroid/net/wimax/WimaxNative;->stopWimax()Z

    move-result v5

    if-nez v5, :cond_201

    .line 462
    const-string v5, "WimaxService"

    const-string v5, "fail to stop wimax.."

    invoke-static {v9, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    :cond_201
    invoke-static {v8}, Landroid/net/wimax/WimaxNative;->loadDriver(B)Z

    move-result v5

    if-eqz v5, :cond_159

    .line 465
    iget-object v5, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v5}, Landroid/net/wimax/WimaxStateTracker;->notifyDriverStopped()V

    goto/16 :goto_159
.end method

.method private setWimaxEnabledState(II)V
    .registers 9
    .parameter "WimaxStatus"
    .parameter "uid"

    .prologue
    .line 477
    iget v3, p0, Lcom/android/server/WimaxService;->mWimaxStatus:I

    .line 478
    .local v3, previousWimaxStatus:I
    iget-boolean v4, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v4, :cond_d

    const-string v4, "WimaxService"

    const-string v5, "[setWimaxEnabledState] "

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    :cond_d
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 482
    .local v0, ident:J
    const/4 v4, 0x3

    if-ne p1, v4, :cond_3a

    .line 483
    :try_start_14
    iget-object v4, p0, Lcom/android/server/WimaxService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v4, p2}, Lcom/android/internal/app/IBatteryStats;->noteWimaxOn(I)V
    :try_end_19
    .catchall {:try_start_14 .. :try_end_19} :catchall_45
    .catch Landroid/os/RemoteException; {:try_start_14 .. :try_end_19} :catch_43

    .line 489
    :cond_19
    :goto_19
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 492
    iput p1, p0, Lcom/android/server/WimaxService;->mWimaxStatus:I

    .line 494
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.net.wimax.WIMAX_STATUS_CHANGED"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 495
    .local v2, intent:Landroid/content/Intent;
    const/high16 v4, 0x1000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 496
    const-string v4, "wimax_status"

    invoke-virtual {v2, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 497
    const-string v4, "previous_wimax_status"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 498
    iget-object v4, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    .line 499
    return-void

    .line 484
    .end local v2           #intent:Landroid/content/Intent;
    :cond_3a
    const/4 v4, 0x1

    if-ne p1, v4, :cond_19

    .line 485
    :try_start_3d
    iget-object v4, p0, Lcom/android/server/WimaxService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v4, p2}, Lcom/android/internal/app/IBatteryStats;->noteWimaxOff(I)V
    :try_end_42
    .catchall {:try_start_3d .. :try_end_42} :catchall_45
    .catch Landroid/os/RemoteException; {:try_start_3d .. :try_end_42} :catch_43

    goto :goto_19

    .line 487
    :catch_43
    move-exception v4

    goto :goto_19

    .line 489
    :catchall_45
    move-exception v4

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4
.end method

.method private static stateName(I)Ljava/lang/String;
    .registers 2
    .parameter "WimaxStatus"

    .prologue
    .line 1365
    packed-switch p0, :pswitch_data_16

    .line 1377
    const-string v0, "[invalid status]"

    :goto_5
    return-object v0

    .line 1367
    :pswitch_6
    const-string v0, "disabling"

    goto :goto_5

    .line 1369
    :pswitch_9
    const-string v0, "disabled"

    goto :goto_5

    .line 1371
    :pswitch_c
    const-string v0, "enabling"

    goto :goto_5

    .line 1373
    :pswitch_f
    const-string v0, "enabled"

    goto :goto_5

    .line 1375
    :pswitch_12
    const-string v0, "unknown status"

    goto :goto_5

    .line 1365
    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_6
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
    .end packed-switch
.end method

.method private updateWimaxStatus()V
    .registers 8

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string v3, "WimaxService"

    .line 1239
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getPersistedWimaxEnabled()Z

    move-result v0

    .line 1240
    .local v0, WimaxEnabled:Z
    invoke-direct {p0}, Lcom/android/server/WimaxService;->isAirplaneModeOn()Z

    move-result v3

    if-eqz v3, :cond_2b

    iget-boolean v3, p0, Lcom/android/server/WimaxService;->mAirplaneModeOverwridden:Z

    if-nez v3, :cond_2b

    move v2, v5

    .line 1241
    .local v2, airplaneMode:Z
    :goto_13
    if-eqz v0, :cond_2d

    if-nez v2, :cond_2d

    move v1, v5

    .line 1243
    .local v1, WimaxShouldBeEnabled:Z
    :goto_18
    iget-object v3, p0, Lcom/android/server/WimaxService;->mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;

    monitor-enter v3

    .line 1244
    :try_start_1b
    iget v4, p0, Lcom/android/server/WimaxService;->mWimaxStatus:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2f

    if-nez v2, :cond_2f

    .line 1245
    const-string v4, "WimaxService"

    const-string v5, "[updateWimaxStatus] mWimaxStatus == WIMAX_STATUS_ENABLING && !airplaneMode return ;"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1246
    monitor-exit v3

    .line 1258
    :goto_2a
    return-void

    .end local v1           #WimaxShouldBeEnabled:Z
    .end local v2           #airplaneMode:Z
    :cond_2b
    move v2, v4

    .line 1240
    goto :goto_13

    .restart local v2       #airplaneMode:Z
    :cond_2d
    move v1, v4

    .line 1241
    goto :goto_18

    .line 1248
    .restart local v1       #WimaxShouldBeEnabled:Z
    :cond_2f
    if-eqz v1, :cond_4d

    .line 1249
    iget-boolean v4, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v4, :cond_3c

    const-string v4, "WimaxService"

    const-string v5, "[updateWimaxStatus] WimaxShouldBeEnabled == true"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1250
    :cond_3c
    sget-object v4, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-direct {p0, v4}, Lcom/android/server/WimaxService;->acquire_WakeLock(Landroid/os/PowerManager$WakeLock;)V

    .line 1251
    const/4 v4, 0x1

    const/4 v5, 0x0

    iget v6, p0, Lcom/android/server/WimaxService;->mLastEnableUid:I

    invoke-direct {p0, v4, v5, v6}, Lcom/android/server/WimaxService;->sendEnableMessage(ZZI)V

    .line 1257
    :goto_48
    monitor-exit v3

    goto :goto_2a

    :catchall_4a
    move-exception v4

    monitor-exit v3
    :try_end_4c
    .catchall {:try_start_1b .. :try_end_4c} :catchall_4a

    throw v4

    .line 1253
    :cond_4d
    :try_start_4d
    iget-boolean v4, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v4, :cond_58

    const-string v4, "WimaxService"

    const-string v5, "[updateWiMAXState] WimaxShouldBeEnabled == false acquire sWakeLock"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1254
    :cond_58
    sget-object v4, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-direct {p0, v4}, Lcom/android/server/WimaxService;->acquire_WakeLock(Landroid/os/PowerManager$WakeLock;)V

    .line 1255
    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v6, p0, Lcom/android/server/WimaxService;->mLastEnableUid:I

    invoke-direct {p0, v4, v5, v6}, Lcom/android/server/WimaxService;->sendEnableMessage(ZZI)V
    :try_end_64
    .catchall {:try_start_4d .. :try_end_64} :catchall_4a

    goto :goto_48
.end method


# virtual methods
.method public CheckWimaxState()Z
    .registers 2

    .prologue
    .line 781
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 782
    invoke-static {}, Landroid/net/wimax/WimaxNative;->getLinkState()Z

    move-result v0

    return v0
.end method

.method public OdbAddReq([B)I
    .registers 3
    .parameter "tlvDataArray"

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 945
    invoke-static {p1}, Landroid/net/wimax/WimaxNative;->OdbAddReq([B)I

    move-result v0

    return v0
.end method

.method public OdbDeleteReq([B)I
    .registers 3
    .parameter "tlvDataArray"

    .prologue
    .line 950
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 951
    invoke-static {p1}, Landroid/net/wimax/WimaxNative;->OdbDeleteReq([B)I

    move-result v0

    return v0
.end method

.method public OdbReadReq([B)I
    .registers 3
    .parameter "tlvDataArray"

    .prologue
    .line 926
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 927
    invoke-static {p1}, Landroid/net/wimax/WimaxNative;->OdbReadReq([B)I

    move-result v0

    return v0
.end method

.method public OdbUpdateReq()I
    .registers 2

    .prologue
    .line 938
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 939
    invoke-static {}, Landroid/net/wimax/WimaxNative;->OdbUpdateReq()I

    move-result v0

    return v0
.end method

.method public OdbWriteReq([B)I
    .registers 3
    .parameter "tlvDataArray"

    .prologue
    .line 932
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 933
    invoke-static {p1}, Landroid/net/wimax/WimaxNative;->OdbWriteReq([B)I

    move-result v0

    return v0
.end method

.method public acquireMulticastLock(Landroid/os/IBinder;Ljava/lang/String;)V
    .registers 8
    .parameter "binder"
    .parameter "tag"

    .prologue
    .line 1568
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceMulticastChangePermission()V

    .line 1570
    iget-object v2, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    monitor-enter v2

    .line 1571
    :try_start_6
    iget v3, p0, Lcom/android/server/WimaxService;->mMulticastEnabled:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/server/WimaxService;->mMulticastEnabled:I

    .line 1572
    iget-object v3, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    new-instance v4, Lcom/android/server/WimaxService$Multicaster;

    invoke-direct {v4, p0, p2, p1}, Lcom/android/server/WimaxService$Multicaster;-><init>(Lcom/android/server/WimaxService;Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1577
    iget-object v3, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    monitor-enter v3
    :try_end_19
    .catchall {:try_start_6 .. :try_end_19} :catchall_37

    .line 1579
    :try_start_19
    monitor-exit v3
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_34

    .line 1580
    :try_start_1a
    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_37

    .line 1582
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 1583
    .local v1, uid:I
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 1585
    .local v0, ident:Ljava/lang/Long;
    :try_start_27
    iget-object v2, p0, Lcom/android/server/WimaxService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v2, v1}, Lcom/android/internal/app/IBatteryStats;->noteWifiMulticastEnabled(I)V
    :try_end_2c
    .catchall {:try_start_27 .. :try_end_2c} :catchall_3a
    .catch Landroid/os/RemoteException; {:try_start_27 .. :try_end_2c} :catch_43

    .line 1588
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    :goto_30
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1590
    return-void

    .line 1579
    .end local v0           #ident:Ljava/lang/Long;
    .end local v1           #uid:I
    :catchall_34
    move-exception v4

    :try_start_35
    monitor-exit v3
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    :try_start_36
    throw v4

    .line 1580
    :catchall_37
    move-exception v3

    monitor-exit v2
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_37

    throw v3

    .line 1588
    .restart local v0       #ident:Ljava/lang/Long;
    .restart local v1       #uid:I
    :catchall_3a
    move-exception v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 1586
    :catch_43
    move-exception v2

    .line 1588
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_30
.end method

.method public acquireWimaxLock(Landroid/os/IBinder;ILjava/lang/String;)Z
    .registers 8
    .parameter "binder"
    .parameter "lockMode"
    .parameter "tag"

    .prologue
    .line 1454
    iget-object v1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.WAKE_LOCK"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1455
    const/4 v1, 0x1

    if-eq p2, v1, :cond_10

    const/4 v1, 0x2

    if-eq p2, v1, :cond_10

    .line 1456
    const/4 v1, 0x0

    .line 1460
    :goto_f
    return v1

    .line 1458
    :cond_10
    new-instance v0, Lcom/android/server/WimaxService$WimaxLock;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/android/server/WimaxService$WimaxLock;-><init>(Lcom/android/server/WimaxService;ILjava/lang/String;Landroid/os/IBinder;)V

    .line 1459
    .local v0, WimaxLock:Lcom/android/server/WimaxService$WimaxLock;
    iget-object v1, p0, Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;

    monitor-enter v1

    .line 1460
    :try_start_18
    invoke-direct {p0, v0}, Lcom/android/server/WimaxService;->acquireWimaxLockLocked(Lcom/android/server/WimaxService$WimaxLock;)Z

    move-result v2

    monitor-exit v1

    move v1, v2

    goto :goto_f

    .line 1461
    :catchall_1f
    move-exception v2

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_18 .. :try_end_21} :catchall_1f

    throw v2
.end method

.method public checkUSBstate()Z
    .registers 15

    .prologue
    const/4 v11, 0x0

    const-string v13, "file close error"

    const-string v12, "WimaxService"

    .line 625
    const/4 v7, 0x0

    .line 627
    .local v7, msg:Ljava/lang/String;
    const/4 v0, 0x0

    .line 628
    .local v0, br:Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .line 630
    .local v3, fis:Ljava/io/FileInputStream;
    :try_start_8
    new-instance v4, Ljava/io/FileInputStream;

    const-string v8, "/sys/class/sec/switch/usb_state"

    invoke-direct {v4, v8}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_f} :catch_34

    .line 637
    .end local v3           #fis:Ljava/io/FileInputStream;
    .local v4, fis:Ljava/io/FileInputStream;
    :try_start_f
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_19
    .catchall {:try_start_f .. :try_end_19} :catchall_5b
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_19} :catch_38

    .line 638
    .end local v0           #br:Ljava/io/BufferedReader;
    .local v1, br:Ljava/io/BufferedReader;
    :try_start_19
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_97
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_9a

    move-result-object v7

    .line 644
    :try_start_1d
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 645
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_23} :catch_87

    .line 653
    const-string v8, "USB_STATE_CONFIGURED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_67

    .line 655
    iget v8, p0, Lcom/android/server/WimaxService;->m_nPluggedType:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_63

    .line 656
    const/4 v8, 0x1

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move-object v0, v1

    .line 661
    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    :goto_33
    return v8

    .line 631
    :catch_34
    move-exception v8

    move-object v5, v8

    .local v5, fnfe:Ljava/io/FileNotFoundException;
    move v8, v11

    .line 633
    goto :goto_33

    .line 639
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v5           #fnfe:Ljava/io/FileNotFoundException;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_38
    move-exception v8

    move-object v2, v8

    .line 640
    .local v2, e:Ljava/io/IOException;
    :goto_3a
    :try_start_3a
    const-string v8, "WimaxService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "File error : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_52
    .catchall {:try_start_3a .. :try_end_52} :catchall_5b

    .line 644
    :try_start_52
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 645
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_58} :catch_7a

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move v8, v11

    .line 641
    goto :goto_33

    .line 643
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catchall_5b
    move-exception v8

    .line 644
    :goto_5c
    :try_start_5c
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 645
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_62} :catch_6b

    .line 643
    throw v8

    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :cond_63
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move v8, v11

    .line 658
    goto :goto_33

    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :cond_67
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move v8, v11

    .line 661
    goto :goto_33

    .line 646
    .end local v3           #fis:Ljava/io/FileInputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_6b
    move-exception v8

    move-object v6, v8

    .line 647
    .local v6, ioe:Ljava/io/IOException;
    const-string v8, "WimaxService"

    const-string v8, "file close error"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    :goto_77
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move v8, v11

    .line 649
    goto :goto_33

    .line 646
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v6           #ioe:Ljava/io/IOException;
    .restart local v2       #e:Ljava/io/IOException;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_7a
    move-exception v8

    move-object v6, v8

    .line 647
    .restart local v6       #ioe:Ljava/io/IOException;
    const-string v8, "WimaxService"

    const-string v8, "file close error"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_77

    .line 646
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/io/IOException;
    .end local v6           #ioe:Ljava/io/IOException;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :catch_87
    move-exception v8

    move-object v6, v8

    .line 647
    .restart local v6       #ioe:Ljava/io/IOException;
    const-string v8, "WimaxService"

    const-string v8, "file close error"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move v8, v11

    .line 649
    goto :goto_33

    .line 643
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v6           #ioe:Ljava/io/IOException;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catchall_97
    move-exception v8

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_5c

    .line 639
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :catch_9a
    move-exception v8

    move-object v2, v8

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_3a
.end method

.method public connect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .registers 12
    .parameter "homeNspName"
    .parameter "roamingNspName"
    .parameter "userName"
    .parameter "passWord"

    .prologue
    const/4 v6, 0x0

    const-string v5, "WimaxService"

    const-string v4, ""

    .line 733
    iget-boolean v2, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v2, :cond_21

    const-string v2, "WimaxService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[connect] homeNspName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 735
    :cond_21
    const-string v2, ""

    const-string v2, ""

    const-string v2, ""

    invoke-static {p1, v4, v4, v6, v4}, Landroid/net/wimax/WimaxNative;->connectmWimax(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)I

    move-result v0

    .line 736
    .local v0, result:I
    if-nez v0, :cond_46

    .line 737
    iget-boolean v2, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v2, :cond_38

    const-string v2, "WimaxService"

    const-string v2, "^^^^^ Connection req. is success ^^^^^"

    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    :cond_38
    const/4 v0, 0x0

    .line 745
    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/net/wimax/WimaxStateTracker;->setHaveLinkInfo(Z)V

    .line 746
    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v2, v6}, Landroid/net/wimax/WimaxStateTracker;->setIdleState(Z)V

    move v1, v0

    .line 748
    .end local v0           #result:I
    .local v1, result:I
    :goto_45
    return v1

    .line 740
    .end local v1           #result:I
    .restart local v0       #result:I
    :cond_46
    const-string v2, "WimaxService"

    const-string v2, "connectmWimax() returns fail."

    invoke-static {v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    const/4 v0, -0x1

    move v1, v0

    .line 742
    .end local v0           #result:I
    .restart local v1       #result:I
    goto :goto_45
.end method

.method public deleteStaticIP()I
    .registers 7

    .prologue
    .line 1737
    const/4 v1, 0x0

    .line 1739
    .local v1, fOut:Ljava/io/FileWriter;
    :try_start_1
    new-instance v2, Ljava/io/FileWriter;

    const-string v4, "/data/wimax_ip.txt"

    invoke-direct {v2, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_8} :catch_1b

    .line 1740
    .end local v1           #fOut:Ljava/io/FileWriter;
    .local v2, fOut:Ljava/io/FileWriter;
    :try_start_8
    new-instance v3, Ljava/io/BufferedWriter;

    invoke-direct {v3, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 1741
    .local v3, osw:Ljava/io/BufferedWriter;
    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1743
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 1744
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_18} :catch_26

    .line 1745
    const/4 v4, 0x1

    move-object v1, v2

    .line 1749
    .end local v2           #fOut:Ljava/io/FileWriter;
    .end local v3           #osw:Ljava/io/BufferedWriter;
    .restart local v1       #fOut:Ljava/io/FileWriter;
    :goto_1a
    return v4

    .line 1747
    :catch_1b
    move-exception v4

    move-object v0, v4

    .line 1748
    .local v0, e:Ljava/io/IOException;
    :goto_1d
    const-string v4, "WimaxService"

    const-string v5, "File wimax_ip.txt not reset"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1749
    const/4 v4, -0x1

    goto :goto_1a

    .line 1747
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #fOut:Ljava/io/FileWriter;
    .restart local v2       #fOut:Ljava/io/FileWriter;
    :catch_26
    move-exception v4

    move-object v0, v4

    move-object v1, v2

    .end local v2           #fOut:Ljava/io/FileWriter;
    .restart local v1       #fOut:Ljava/io/FileWriter;
    goto :goto_1d
.end method

.method public disconnect()Z
    .registers 2

    .prologue
    .line 755
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v0}, Landroid/net/wimax/WimaxStateTracker;->resetInterface()V

    .line 756
    invoke-static {}, Landroid/net/wimax/WimaxNative;->disconnectWimax()Z

    move-result v0

    return v0
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 9
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    const-string v4, " full"

    .line 1341
    iget-object v0, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.DUMP"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_35

    .line 1343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Permission Denial: can\'t dump WimaxService from from pid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1362
    :goto_34
    return-void

    .line 1348
    :cond_35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Wimax is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/WimaxService;->mWimaxStatus:I

    invoke-static {v1}, Lcom/android/server/WimaxService;->stateName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1349
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Stay-awake conditions: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "stay_on_while_plugged_in"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1352
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 1354
    const-string v0, "Internal state:"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1355
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1356
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 1357
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Locks acquired: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/WimaxService;->mFullLocksAcquired:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " full"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1358
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Locks released: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/WimaxService;->mFullLocksReleased:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " full"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1359
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 1360
    const-string v0, "Locks held:"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1361
    iget-object v0, p0, Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;

    #calls: Lcom/android/server/WimaxService$LockList;->dump(Ljava/io/PrintWriter;)V
    invoke-static {v0, p2}, Lcom/android/server/WimaxService$LockList;->access$1400(Lcom/android/server/WimaxService$LockList;Ljava/io/PrintWriter;)V

    goto/16 :goto_34
.end method

.method public getAvailableNetworks()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/net/wimax/structs/NspInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 669
    iget-object v2, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 670
    iget-object v2, p0, Lcom/android/server/WimaxService;->mNetworkList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 671
    iget-object v2, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    invoke-static {v2}, Landroid/net/wimax/WimaxNative;->setAvailableList(Ljava/util/List;)V

    .line 672
    iget-object v2, p0, Lcom/android/server/WimaxService;->mNspInfo:Landroid/net/wimax/structs/NspInfo;

    invoke-static {v2}, Landroid/net/wimax/WimaxNative;->getAvailableNetworks(Landroid/net/wimax/structs/NspInfo;)Z

    .line 675
    iget-object v2, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 677
    .local v1, nSize:I
    if-eqz v1, :cond_60

    .line 678
    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v2}, Landroid/net/wimax/WimaxStateTracker;->requestConnectionInfo()Landroid/net/wimax/WimaxInfo;

    move-result-object v0

    .line 680
    .local v0, LinkInfo:Landroid/net/wimax/WimaxInfo;
    iget-object v2, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wimax/structs/NspInfo;

    invoke-virtual {v0}, Landroid/net/wimax/WimaxInfo;->getNAPID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/wimax/structs/NspInfo;->setNapId(Ljava/lang/String;)V

    .line 681
    const-string v3, "WimaxService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[getAvailableNetworks] list size: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " NAP-ID = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wimax/structs/NspInfo;

    invoke-virtual {v2}, Landroid/net/wimax/structs/NspInfo;->getNapId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 684
    .end local v0           #LinkInfo:Landroid/net/wimax/WimaxInfo;
    :cond_60
    iget-object v2, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    iput-object v2, p0, Lcom/android/server/WimaxService;->mNetworkList:Ljava/util/List;

    .line 685
    iget-object v2, p0, Lcom/android/server/WimaxService;->mAvailableList:Ljava/util/List;

    return-object v2
.end method

.method public getConnectedNSP()Landroid/net/wimax/structs/NspInfo;
    .registers 2

    .prologue
    .line 693
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectedNspInfo:Landroid/net/wimax/structs/NspInfo;

    invoke-static {v0}, Landroid/net/wimax/WimaxNative;->getConnectedNSP(Landroid/net/wimax/structs/NspInfo;)I

    .line 694
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectedNspInfo:Landroid/net/wimax/structs/NspInfo;

    return-object v0
.end method

.method public getConnectionInfo()Landroid/net/wimax/WimaxInfo;
    .registers 2

    .prologue
    .line 717
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 722
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v0}, Landroid/net/wimax/WimaxStateTracker;->requestConnectionInfo()Landroid/net/wimax/WimaxInfo;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionStatistics()Landroid/net/wimax/ConnectionStatistics;
    .registers 2

    .prologue
    .line 698
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    invoke-virtual {v0}, Landroid/net/wimax/ConnectionStatistics;->getTotalRxBytes()J

    .line 699
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    invoke-virtual {v0}, Landroid/net/wimax/ConnectionStatistics;->getTotalRxPackets()J

    .line 700
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    invoke-virtual {v0}, Landroid/net/wimax/ConnectionStatistics;->getTotalTxBytes()J

    .line 701
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    invoke-virtual {v0}, Landroid/net/wimax/ConnectionStatistics;->getTotalTxPackets()J

    .line 702
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    invoke-static {}, Landroid/net/wimax/ConnectionStatistics;->getUplinkThroughput()J

    .line 703
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    invoke-static {}, Landroid/net/wimax/ConnectionStatistics;->getDownlinkThroughput()J

    .line 704
    iget-object v0, p0, Lcom/android/server/WimaxService;->mConnectionStatistics:Landroid/net/wimax/ConnectionStatistics;

    return-object v0
.end method

.method public getDeviceInformation()Landroid/net/wimax/DeviceInfo;
    .registers 2

    .prologue
    .line 708
    iget-object v0, p0, Lcom/android/server/WimaxService;->mDeviceInfo:Landroid/net/wimax/DeviceInfo;

    invoke-static {v0}, Landroid/net/wimax/WimaxNative;->getDeviceInformation(Landroid/net/wimax/DeviceInfo;)Z

    .line 709
    iget-object v0, p0, Lcom/android/server/WimaxService;->mDeviceInfo:Landroid/net/wimax/DeviceInfo;

    return-object v0
.end method

.method public getDhcpInfo()Landroid/net/DhcpInfo;
    .registers 2

    .prologue
    .line 791
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 792
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v0}, Landroid/net/wimax/WimaxStateTracker;->getDhcpInfo()Landroid/net/DhcpInfo;

    move-result-object v0

    return-object v0
.end method

.method public getMruList()V
    .registers 2

    .prologue
    .line 858
    sget-object v0, Landroid/net/wimax/WimaxNative;->mMruListRsp:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 859
    invoke-static {}, Landroid/net/wimax/WimaxNative;->getMruList()Z

    .line 860
    return-void
.end method

.method public getMruListRsp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/net/wimax/MruList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 863
    sget-object v0, Landroid/net/wimax/WimaxNative;->mMruListRsp:Ljava/util/List;

    return-object v0
.end method

.method public getMruUpdate(Ljava/lang/String;I)Z
    .registers 14
    .parameter "strUpdate"
    .parameter "nSize"

    .prologue
    const/4 v10, 0x0

    .line 867
    iget-boolean v7, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v7, :cond_1d

    const-string v7, "WimaxService"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getMruUpdate nSize: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 868
    :cond_1d
    if-nez p2, :cond_24

    .line 869
    invoke-static {v10, v10, v10, p2}, Landroid/net/wimax/WimaxNative;->getMruUpdate([I[B[BI)Z

    move-result v7

    .line 895
    :goto_23
    return v7

    .line 871
    :cond_24
    new-instance v4, Ljava/util/StringTokenizer;

    const-string v7, "@"

    invoke-direct {v4, p1, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 873
    .local v4, st:Ljava/util/StringTokenizer;
    new-array v1, p2, [I

    .line 874
    .local v1, arCF:[I
    new-array v0, p2, [B

    .line 875
    .local v0, arBW:[B
    new-array v2, p2, [B

    .line 876
    .local v2, arFFT:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_32
    if-ge v3, p2, :cond_7a

    .line 877
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_77

    .line 878
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    .line 879
    .local v6, temp:Ljava/lang/String;
    if-eqz v6, :cond_77

    .line 880
    new-instance v5, Ljava/util/StringTokenizer;

    const-string v7, "#"

    invoke-direct {v5, v6, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 881
    .local v5, stList:Ljava/util/StringTokenizer;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_77

    .line 882
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    aput v7, v1, v3

    .line 883
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_77

    .line 885
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v7

    aput-byte v7, v0, v3

    .line 886
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_77

    .line 888
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v7

    aput-byte v7, v2, v3

    .line 876
    .end local v5           #stList:Ljava/util/StringTokenizer;
    .end local v6           #temp:Ljava/lang/String;
    :cond_77
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    .line 895
    :cond_7a
    invoke-static {v1, v0, v2, p2}, Landroid/net/wimax/WimaxNative;->getMruUpdate([I[B[BI)Z

    move-result v7

    goto :goto_23
.end method

.method public getNeighborList()V
    .registers 1

    .prologue
    .line 796
    invoke-static {}, Landroid/net/wimax/WimaxNative;->getNeighborList()Z

    .line 797
    return-void
.end method

.method public getNetworkConnectionSetting()I
    .registers 2

    .prologue
    .line 326
    sget-byte v0, Lcom/android/server/WimaxService;->mModeWhieAPsleep:B

    return v0
.end method

.method public getNetworkEntryCompleteTimes()[I
    .registers 2

    .prologue
    .line 727
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 729
    invoke-static {}, Landroid/net/wimax/WimaxNative;->getNetworkEntryCompleteTimes()[I

    move-result-object v0

    return-object v0
.end method

.method public getNetworkList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/net/wimax/structs/NspInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 689
    iget-object v0, p0, Lcom/android/server/WimaxService;->mNetworkList:Ljava/util/List;

    return-object v0
.end method

.method getNetworkStateTracker()Landroid/net/NetworkStateTracker;
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    return-object v0
.end method

.method public getPersistedWimaxEnabled()Z
    .registers 7

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const-string v5, "wimax_on"

    .line 292
    iget-object v2, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 294
    .local v0, cr:Landroid/content/ContentResolver;
    :try_start_a
    const-string v2, "wimax_on"

    invoke-static {v0, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_f
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_a .. :try_end_f} :catch_16

    move-result v2

    if-ne v2, v4, :cond_14

    move v2, v4

    .line 297
    :goto_13
    return v2

    :cond_14
    move v2, v3

    .line 294
    goto :goto_13

    .line 295
    :catch_16
    move-exception v2

    move-object v1, v2

    .line 296
    .local v1, e:Landroid/provider/Settings$SettingNotFoundException;
    const-string v2, "wimax_on"

    invoke-static {v0, v5, v3}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    move v2, v3

    .line 297
    goto :goto_13
.end method

.method public getRadioInfo()V
    .registers 1

    .prologue
    .line 800
    invoke-static {}, Landroid/net/wimax/WimaxNative;->getRadioInfo()Z

    .line 801
    return-void
.end method

.method public getRadioInfoResponse()Landroid/net/wimax/RadioInfo;
    .registers 2

    .prologue
    .line 803
    sget-object v0, Landroid/net/wimax/WimaxNative;->radioInfo:Landroid/net/wimax/RadioInfo;

    return-object v0
.end method

.method public getWimaxEnabledStatus()I
    .registers 2

    .prologue
    .line 524
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 525
    iget v0, p0, Lcom/android/server/WimaxService;->mWimaxStatus:I

    return v0
.end method

.method public getWimaxMode()I
    .registers 3

    .prologue
    .line 569
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 570
    const/4 v0, 0x0

    .line 572
    .local v0, nMode:I
    sget-boolean v1, Lcom/android/server/WimaxService;->mIsTetheredmode:Z

    if-eqz v1, :cond_a

    .line 573
    const/4 v0, 0x1

    .line 589
    :goto_9
    return v0

    .line 575
    :cond_a
    sget-boolean v1, Lcom/android/server/WimaxService;->mIsDMmode:Z

    if-eqz v1, :cond_16

    .line 576
    sget-boolean v1, Lcom/android/server/WimaxService;->mIsBackhaulMode:Z

    if-eqz v1, :cond_14

    .line 577
    const/4 v0, 0x4

    goto :goto_9

    .line 579
    :cond_14
    const/4 v0, 0x3

    goto :goto_9

    .line 582
    :cond_16
    sget-boolean v1, Lcom/android/server/WimaxService;->mIsBackhaulMode:Z

    if-eqz v1, :cond_1c

    .line 583
    const/4 v0, 0x2

    goto :goto_9

    .line 585
    :cond_1c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public getWimaxState()Landroid/net/wimax/WimaxState;
    .registers 2

    .prologue
    .line 537
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 538
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v0}, Landroid/net/wimax/WimaxStateTracker;->getCurrentWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v0

    return-object v0
.end method

.method public getWorkModeState()I
    .registers 8

    .prologue
    const-string v6, "WimaxService"

    .line 806
    const/4 v3, 0x0

    .line 807
    .local v3, selectedMode:Ljava/lang/String;
    const/4 v1, 0x0

    .line 809
    .local v1, mode:I
    :try_start_4
    iget-object v4, p0, Lcom/android/server/WimaxService;->mSprintExtension:Lcom/sprint/internal/SystemProperties;

    const/16 v5, 0x1f4

    invoke-virtual {v4, v5}, Lcom/sprint/internal/SystemProperties;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 810
    if-eqz v3, :cond_3f

    .line 811
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_11
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_11} :catch_14
    .catch Lcom/sprint/internal/SystemPropertiesException; {:try_start_4 .. :try_end_11} :catch_32

    move-result v1

    move v2, v1

    .line 821
    .end local v1           #mode:I
    .local v2, mode:I
    :goto_13
    return v2

    .line 814
    .end local v2           #mode:I
    .restart local v1       #mode:I
    :catch_14
    move-exception v4

    move-object v0, v4

    .line 815
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v1

    .line 816
    .end local v1           #mode:I
    .restart local v2       #mode:I
    goto :goto_13

    .line 817
    .end local v0           #e:Ljava/lang/NumberFormatException;
    .end local v2           #mode:I
    .restart local v1       #mode:I
    :catch_32
    move-exception v4

    move-object v0, v4

    .line 818
    .local v0, e:Lcom/sprint/internal/SystemPropertiesException;
    const-string v4, "WimaxService"

    invoke-virtual {v0}, Lcom/sprint/internal/SystemPropertiesException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v1

    .line 819
    .end local v1           #mode:I
    .restart local v2       #mode:I
    goto :goto_13

    .end local v0           #e:Lcom/sprint/internal/SystemPropertiesException;
    .end local v2           #mode:I
    .restart local v1       #mode:I
    :cond_3f
    move v2, v1

    .line 821
    .end local v1           #mode:I
    .restart local v2       #mode:I
    goto :goto_13
.end method

.method public isMulticastEnabled()Z
    .registers 3

    .prologue
    .line 1630
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 1632
    iget-object v0, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    monitor-enter v0

    .line 1633
    :try_start_6
    iget-object v1, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_11

    const/4 v1, 0x1

    :goto_f
    monitor-exit v0

    return v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_f

    .line 1634
    :catchall_13
    move-exception v1

    monitor-exit v0
    :try_end_15
    .catchall {:try_start_6 .. :try_end_15} :catchall_13

    throw v1
.end method

.method public makeOdbTlvData([BIIII[B)I
    .registers 11
    .parameter "pBuffer"
    .parameter "nBufferIndex"
    .parameter "wBufferLen"
    .parameter "wTag"
    .parameter "wLength"
    .parameter "pbValue"

    .prologue
    .line 905
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 907
    shr-int/lit8 v2, p4, 0x0

    and-int/lit16 v2, v2, 0xff

    int-to-byte v0, v2

    .line 908
    .local v0, highByte:B
    shr-int/lit8 v2, p4, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v1, v2

    .line 910
    .local v1, lowByte:B
    add-int/lit8 v2, p2, 0x0

    aput-byte v0, p1, v2

    .line 911
    add-int/lit8 v2, p2, 0x1

    aput-byte v1, p1, v2

    .line 913
    shr-int/lit8 v2, p5, 0x0

    and-int/lit16 v2, v2, 0xff

    int-to-byte v0, v2

    .line 914
    shr-int/lit8 v2, p5, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v1, v2

    .line 916
    add-int/lit8 v2, p2, 0x2

    aput-byte v0, p1, v2

    .line 917
    add-int/lit8 v2, p2, 0x3

    aput-byte v1, p1, v2

    .line 919
    const/4 v2, 0x0

    add-int/lit8 v3, p2, 0x4

    invoke-static {p6, v2, p1, v3, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 921
    add-int/lit8 v2, p5, 0x4

    int-to-short v2, v2

    return v2
.end method

.method public readStaticIP(I)Ljava/lang/String;
    .registers 14
    .parameter "nIndex"

    .prologue
    .line 1703
    const/4 v7, 0x0

    .line 1705
    .local v7, msg:Ljava/lang/String;
    const/4 v0, 0x0

    .line 1706
    .local v0, br:Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .line 1708
    .local v3, fis:Ljava/io/FileReader;
    :try_start_3
    new-instance v4, Ljava/io/FileReader;

    const-string v9, "/data/wimax_ip.txt"

    invoke-direct {v4, v9}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_a} :catch_22

    .line 1716
    .end local v3           #fis:Ljava/io/FileReader;
    .local v4, fis:Ljava/io/FileReader;
    :try_start_a
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_63
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_f} :catch_3f

    .end local v0           #br:Ljava/io/BufferedReader;
    .local v1, br:Ljava/io/BufferedReader;
    move v8, p1

    .line 1718
    .end local p1
    .local v8, nIndex:I
    :goto_10
    :try_start_10
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_9b
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_13} :catch_9f

    move-result-object v7

    .line 1719
    add-int/lit8 p1, v8, -0x1

    .end local v8           #nIndex:I
    .restart local p1
    if-gtz v8, :cond_a4

    .line 1725
    :try_start_18
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 1726
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1e} :catch_8a

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileReader;
    .restart local v3       #fis:Ljava/io/FileReader;
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move-object v9, v7

    .line 1733
    :goto_21
    return-object v9

    .line 1709
    :catch_22
    move-exception v9

    move-object v5, v9

    .line 1711
    .local v5, fnfe:Ljava/io/FileNotFoundException;
    const-string v9, "WimaxService"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "File Not found exception"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1712
    const-string v9, "no file error"

    goto :goto_21

    .line 1720
    .end local v3           #fis:Ljava/io/FileReader;
    .end local v5           #fnfe:Ljava/io/FileNotFoundException;
    .restart local v4       #fis:Ljava/io/FileReader;
    :catch_3f
    move-exception v9

    move-object v2, v9

    .line 1721
    .local v2, e:Ljava/io/IOException;
    :goto_41
    :try_start_41
    const-string v9, "WimaxService"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Read file error : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1722
    const-string v9, "read file error"
    :try_end_5b
    .catchall {:try_start_41 .. :try_end_5b} :catchall_63

    .line 1725
    :try_start_5b
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 1726
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_61} :catch_7b

    move-object v3, v4

    .line 1722
    .end local v4           #fis:Ljava/io/FileReader;
    .restart local v3       #fis:Ljava/io/FileReader;
    goto :goto_21

    .line 1724
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #fis:Ljava/io/FileReader;
    .restart local v4       #fis:Ljava/io/FileReader;
    :catchall_63
    move-exception v9

    .line 1725
    :goto_64
    :try_start_64
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 1726
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_6a} :catch_6b

    .line 1724
    throw v9

    .line 1727
    :catch_6b
    move-exception v9

    move-object v6, v9

    .line 1728
    .local v6, ioe:Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    .line 1729
    const-string v9, "WimaxService"

    const-string v10, "Close error"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1730
    const-string v9, "close error"

    :goto_79
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileReader;
    .restart local v3       #fis:Ljava/io/FileReader;
    goto :goto_21

    .line 1727
    .end local v3           #fis:Ljava/io/FileReader;
    .end local v6           #ioe:Ljava/io/IOException;
    .restart local v2       #e:Ljava/io/IOException;
    .restart local v4       #fis:Ljava/io/FileReader;
    :catch_7b
    move-exception v9

    move-object v6, v9

    .line 1728
    .restart local v6       #ioe:Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    .line 1729
    const-string v9, "WimaxService"

    const-string v10, "Close error"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1730
    const-string v9, "close error"

    goto :goto_79

    .line 1727
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/io/IOException;
    .end local v6           #ioe:Ljava/io/IOException;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :catch_8a
    move-exception v9

    move-object v6, v9

    .line 1728
    .restart local v6       #ioe:Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    .line 1729
    const-string v9, "WimaxService"

    const-string v10, "Close error"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1730
    const-string v9, "close error"

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileReader;
    .restart local v3       #fis:Ljava/io/FileReader;
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_21

    .line 1724
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fis:Ljava/io/FileReader;
    .end local v6           #ioe:Ljava/io/IOException;
    .end local p1
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fis:Ljava/io/FileReader;
    .restart local v8       #nIndex:I
    :catchall_9b
    move-exception v9

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move p1, v8

    .end local v8           #nIndex:I
    .restart local p1
    goto :goto_64

    .line 1720
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local p1
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v8       #nIndex:I
    :catch_9f
    move-exception v9

    move-object v2, v9

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move p1, v8

    .end local v8           #nIndex:I
    .restart local p1
    goto :goto_41

    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :cond_a4
    move v8, p1

    .end local p1
    .restart local v8       #nIndex:I
    goto/16 :goto_10
.end method

.method public releaseMulticastLock()V
    .registers 7

    .prologue
    .line 1593
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceMulticastChangePermission()V

    .line 1595
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    .line 1596
    .local v3, uid:I
    iget-object v4, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    monitor-enter v4

    .line 1597
    :try_start_a
    iget v5, p0, Lcom/android/server/WimaxService;->mMulticastDisabled:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/android/server/WimaxService;->mMulticastDisabled:I

    .line 1598
    iget-object v5, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    .line 1599
    .local v2, size:I
    const/4 v5, 0x1

    sub-int v0, v2, v5

    .local v0, i:I
    :goto_19
    if-ltz v0, :cond_31

    .line 1600
    iget-object v5, p0, Lcom/android/server/WimaxService;->mMulticasters:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WimaxService$Multicaster;

    .line 1601
    .local v1, m:Lcom/android/server/WimaxService$Multicaster;
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Lcom/android/server/WimaxService$Multicaster;->getUid()I

    move-result v5

    if-ne v5, v3, :cond_2e

    .line 1602
    invoke-direct {p0, v0, v3}, Lcom/android/server/WimaxService;->removeMulticasterLocked(II)V

    .line 1599
    :cond_2e
    add-int/lit8 v0, v0, -0x1

    goto :goto_19

    .line 1605
    .end local v1           #m:Lcom/android/server/WimaxService$Multicaster;
    :cond_31
    monitor-exit v4

    .line 1606
    return-void

    .line 1605
    .end local v0           #i:I
    .end local v2           #size:I
    :catchall_33
    move-exception v5

    monitor-exit v4
    :try_end_35
    .catchall {:try_start_a .. :try_end_35} :catchall_33

    throw v5
.end method

.method public releaseWimaxLock(Landroid/os/IBinder;)Z
    .registers 5
    .parameter "lock"

    .prologue
    .line 1486
    iget-object v0, p0, Lcom/android/server/WimaxService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.WAKE_LOCK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1487
    iget-object v0, p0, Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;

    monitor-enter v0

    .line 1488
    :try_start_b
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService;->releaseWimaxLockLocked(Landroid/os/IBinder;)Z

    move-result v1

    monitor-exit v0

    return v1

    .line 1489
    :catchall_11
    move-exception v1

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_b .. :try_end_13} :catchall_11

    throw v1
.end method

.method public release_sWakeLock()V
    .registers 3

    .prologue
    .line 557
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceAccessPermission()V

    .line 558
    sget-object v0, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 560
    const-string v0, "WimaxService"

    const-string v1, "------release WakeLock----------------"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    sget-object v0, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 563
    :cond_17
    return-void
.end method

.method public saveStaticIP(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .registers 13
    .parameter "ip"
    .parameter "gateway"
    .parameter "netmask"
    .parameter "dns1"
    .parameter "dns2"

    .prologue
    const-string v6, "WimaxService"

    const-string v4, "\n"

    .line 1675
    const/4 v1, 0x0

    .line 1677
    .local v1, fOut:Ljava/io/FileWriter;
    :try_start_5
    new-instance v2, Ljava/io/FileWriter;

    const-string v4, "/data/wimax_ip.txt"

    invoke-direct {v2, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_c} :catch_78

    .line 1684
    .end local v1           #fOut:Ljava/io/FileWriter;
    .local v2, fOut:Ljava/io/FileWriter;
    :try_start_c
    new-instance v3, Ljava/io/BufferedWriter;

    invoke-direct {v3, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 1685
    .local v3, osw:Ljava/io/BufferedWriter;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1686
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1687
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1688
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1689
    invoke-virtual {v3, p5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1691
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 1692
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 1693
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_75} :catch_94

    .line 1694
    const/4 v4, 0x1

    move-object v1, v2

    .line 1698
    .end local v2           #fOut:Ljava/io/FileWriter;
    .end local v3           #osw:Ljava/io/BufferedWriter;
    .restart local v1       #fOut:Ljava/io/FileWriter;
    :goto_77
    return v4

    .line 1679
    :catch_78
    move-exception v4

    move-object v0, v4

    .line 1680
    .local v0, e:Ljava/io/IOException;
    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "File wimax_ip.txt not created "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1681
    const/4 v4, -0x1

    goto :goto_77

    .line 1696
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #fOut:Ljava/io/FileWriter;
    .restart local v2       #fOut:Ljava/io/FileWriter;
    :catch_94
    move-exception v4

    move-object v0, v4

    .line 1697
    .restart local v0       #e:Ljava/io/IOException;
    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "File write error"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1698
    const/4 v4, -0x2

    move-object v1, v2

    .end local v2           #fOut:Ljava/io/FileWriter;
    .restart local v1       #fOut:Ljava/io/FileWriter;
    goto :goto_77
.end method

.method public setFactoryDefault(I)Z
    .registers 3
    .parameter "nType"

    .prologue
    .line 956
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 958
    const/4 v0, 0x1

    if-ne p1, v0, :cond_b

    .line 959
    invoke-static {}, Landroid/net/wimax/WimaxNative;->OdbDefaultReq()Z

    move-result v0

    .line 961
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setMruWorking(Z)V
    .registers 3
    .parameter "bWorking"

    .prologue
    .line 900
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iput-boolean p1, v0, Landroid/net/wimax/WimaxStateTracker;->m_bMruWorking:Z

    .line 901
    return-void
.end method

.method public setVirtualIdleWhileAPsleep(B)I
    .registers 4
    .parameter "bMode"

    .prologue
    .line 967
    const/4 v1, 0x1

    if-ne p1, v1, :cond_b

    .line 968
    const/4 v0, 0x1

    .line 973
    .local v0, enable:Z
    :goto_4
    invoke-direct {p0, v0}, Lcom/android/server/WimaxService;->persistNetworkConnectionEnabled(Z)V

    .line 974
    sput-byte p1, Lcom/android/server/WimaxService;->mModeWhieAPsleep:B

    .line 975
    const/4 v1, 0x0

    return v1

    .line 971
    .end local v0           #enable:Z
    :cond_b
    const/4 v0, 0x0

    .restart local v0       #enable:Z
    goto :goto_4
.end method

.method public setWimaxEnabled(Z)Z
    .registers 9
    .parameter "enable"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const-string v2, "WimaxService"

    .line 337
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 338
    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;

    if-nez v2, :cond_d

    move v2, v5

    .line 357
    :goto_c
    return v2

    .line 340
    :cond_d
    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;

    monitor-enter v2

    .line 342
    :try_start_10
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 343
    .local v0, ident:J
    iget-boolean v3, p0, Lcom/android/server/WimaxService;->m_bLog:Z

    if-eqz v3, :cond_1f

    const-string v3, "WimaxService"

    const-string v4, "acquire sWakeLock----------------------"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    :cond_1f
    sget-object v3, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-direct {p0, v3}, Lcom/android/server/WimaxService;->acquire_WakeLock(Landroid/os/PowerManager$WakeLock;)V

    .line 345
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 347
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    iput v3, p0, Lcom/android/server/WimaxService;->mLastEnableUid:I

    .line 349
    if-eqz p1, :cond_54

    invoke-direct {p0}, Lcom/android/server/WimaxService;->isAirplaneModeOn()Z

    move-result v3

    if-eqz v3, :cond_54

    invoke-direct {p0}, Lcom/android/server/WimaxService;->isAirplaneToggleable()Z

    move-result v3

    if-eqz v3, :cond_54

    move v3, v6

    :goto_3c
    iput-boolean v3, p0, Lcom/android/server/WimaxService;->mAirplaneModeOverwridden:Z

    .line 350
    if-eqz p1, :cond_56

    invoke-direct {p0}, Lcom/android/server/WimaxService;->isAirplaneModeOn()Z

    move-result v3

    if-eqz v3, :cond_56

    iget-boolean v3, p0, Lcom/android/server/WimaxService;->mAirplaneModeOverwridden:Z

    if-nez v3, :cond_56

    .line 351
    const-string v3, "WimaxService"

    const-string v4, "[setWimaxEnabled] can\'t enable 4G because isAirplaneModeOn() is true"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    monitor-exit v2

    move v2, v5

    goto :goto_c

    :cond_54
    move v3, v5

    .line 349
    goto :goto_3c

    .line 354
    :cond_56
    const/4 v3, 0x1

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v4

    invoke-direct {p0, p1, v3, v4}, Lcom/android/server/WimaxService;->sendEnableMessage(ZZI)V

    .line 355
    monitor-exit v2

    move v2, v6

    .line 357
    goto :goto_c

    .line 355
    .end local v0           #ident:J
    :catchall_61
    move-exception v3

    monitor-exit v2
    :try_end_63
    .catchall {:try_start_10 .. :try_end_63} :catchall_61

    throw v3
.end method

.method public setWimaxMode(IZ)I
    .registers 7
    .parameter "nMode"
    .parameter "enable"

    .prologue
    .line 593
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 594
    const-string v1, "WimaxService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setWimaxMode nMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " enable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    const/4 v0, -0x1

    .line 598
    .local v0, nRet:I
    packed-switch p1, :pswitch_data_52

    .line 620
    :cond_29
    :goto_29
    return v0

    .line 600
    :pswitch_2a
    iget-object v1, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v1}, Landroid/net/wimax/WimaxStateTracker;->getNoBackoff()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 601
    iget-object v1, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/net/wimax/WimaxStateTracker;->SetNoBackOff(Z)V

    goto :goto_29

    .line 604
    :pswitch_39
    sput-boolean p2, Lcom/android/server/WimaxService;->mIsTetheredmode:Z

    .line 605
    const/4 v0, 0x0

    .line 606
    invoke-static {p2}, Landroid/net/wimax/WimaxNative;->setBackhaulMode(Z)V

    goto :goto_29

    .line 609
    :pswitch_40
    sput-boolean p2, Lcom/android/server/WimaxService;->mIsBackhaulMode:Z

    .line 610
    invoke-static {p2}, Landroid/net/wimax/WimaxNative;->setBackhaulMode(Z)V

    goto :goto_29

    .line 614
    :pswitch_46
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_29

    .line 615
    sput-boolean p2, Lcom/android/server/WimaxService;->mIsDMmode:Z

    .line 616
    const/4 v0, 0x0

    goto :goto_29

    .line 598
    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_39
        :pswitch_40
        :pswitch_46
        :pswitch_46
    .end packed-switch
.end method

.method public setWimaxStatus(I)V
    .registers 3
    .parameter "wimaxStatus"

    .prologue
    .line 529
    invoke-direct {p0}, Lcom/android/server/WimaxService;->enforceChangePermission()V

    .line 530
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/server/WimaxService;->setWimaxEnabledState(II)V

    .line 531
    return-void
.end method

.method public setWorkModeState(I)Z
    .registers 11
    .parameter "workMode"

    .prologue
    const/4 v8, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    const-string v7, "WimaxService"

    .line 824
    const-string v2, "WimaxService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[setWorkModeState] workMode ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 825
    if-gt p1, v8, :cond_83

    if-ltz p1, :cond_83

    .line 827
    :try_start_21
    iget-object v2, p0, Lcom/android/server/WimaxService;->mSprintExtension:Lcom/sprint/internal/SystemProperties;

    const/16 v3, 0x1f4

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/sprint/internal/SystemProperties;->setString(ILjava/lang/String;)V

    .line 828
    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v2, p1}, Landroid/net/wimax/WimaxStateTracker;->sendWorkModeBroadCast(I)V

    .line 830
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v1

    .line 831
    .local v1, nEnabledStatus:I
    const-string v2, "WimaxService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[setWorkModeState] getWimaxEnabledStatus ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 832
    if-gt p1, v5, :cond_65

    .line 833
    const/4 v2, 0x3

    if-eq v1, v2, :cond_54

    if-ne v1, v8, :cond_63

    .line 834
    :cond_54
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v2

    if-ne v2, v5, :cond_5f

    .line 835
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 837
    :cond_5f
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/server/WimaxService;->setWimaxEnabled(Z)Z

    :cond_63
    :goto_63
    move v2, v5

    .line 853
    .end local v1           #nEnabledStatus:I
    :goto_64
    return v2

    .line 839
    .restart local v1       #nEnabledStatus:I
    :cond_65
    if-ne p1, v8, :cond_63

    .line 840
    if-eq v1, v5, :cond_6b

    if-nez v1, :cond_63

    .line 841
    :cond_6b
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->getPersistedWimaxEnabled()Z

    move-result v2

    if-ne v2, v5, :cond_63

    .line 842
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/android/server/WimaxService;->setWimaxEnabled(Z)Z
    :try_end_75
    .catch Lcom/sprint/internal/SystemPropertiesException; {:try_start_21 .. :try_end_75} :catch_76

    goto :goto_63

    .line 847
    .end local v1           #nEnabledStatus:I
    :catch_76
    move-exception v2

    move-object v0, v2

    .line 848
    .local v0, e:Lcom/sprint/internal/SystemPropertiesException;
    const-string v2, "WimaxService"

    invoke-virtual {v0}, Lcom/sprint/internal/SystemPropertiesException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v6

    .line 849
    goto :goto_64

    .line 852
    .end local v0           #e:Lcom/sprint/internal/SystemPropertiesException;
    :cond_83
    const-string v2, "WimaxService"

    const-string v2, "workMode out of range return false"

    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v6

    .line 853
    goto :goto_64
.end method

.method public startScan(Z)Z
    .registers 5
    .parameter "bUserReq"

    .prologue
    .line 763
    const-string v0, "WimaxService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[startScan] bUserReq : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " nScanAttempt = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iget v2, v2, Landroid/net/wimax/WimaxStateTracker;->nScanAttempt:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    sget-object v0, Lcom/android/server/WimaxService;->sWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-direct {p0, v0}, Lcom/android/server/WimaxService;->acquire_WakeLock(Landroid/os/PowerManager$WakeLock;)V

    .line 766
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    sget-object v1, Landroid/net/wimax/WimaxState;->SCANNING:Landroid/net/wimax/WimaxState;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/net/wimax/WimaxStateTracker;->notifyStateChange(Landroid/net/wimax/WimaxState;Landroid/net/wimax/DeviceStatusInfo$ConnectionProgressInfo;)V

    .line 767
    invoke-static {}, Landroid/net/wimax/WimaxNative;->scanCommand()Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 768
    if-eqz p1, :cond_40

    .line 769
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    invoke-virtual {v0}, Landroid/net/wimax/WimaxStateTracker;->clearRetryFlag()V

    .line 771
    :cond_40
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    iget v1, v0, Landroid/net/wimax/WimaxStateTracker;->nScanAttempt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Landroid/net/wimax/WimaxStateTracker;->nScanAttempt:I

    .line 772
    const/4 v0, 0x1

    .line 776
    :goto_49
    return v0

    .line 774
    :cond_4a
    iget-object v0, p0, Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;

    sget-object v1, Landroid/net/wimax/WimaxState;->DISCONNECTED:Landroid/net/wimax/WimaxState;

    sget-object v2, Landroid/net/wimax/DeviceStatusInfo$ConnectionProgressInfo;->Syncup_PHY:Landroid/net/wimax/DeviceStatusInfo$ConnectionProgressInfo;

    invoke-virtual {v0, v1, v2}, Landroid/net/wimax/WimaxStateTracker;->notifyStateChange(Landroid/net/wimax/WimaxState;Landroid/net/wimax/DeviceStatusInfo$ConnectionProgressInfo;)V

    .line 775
    invoke-virtual {p0}, Lcom/android/server/WimaxService;->release_sWakeLock()V

    .line 776
    const/4 v0, 0x0

    goto :goto_49
.end method
