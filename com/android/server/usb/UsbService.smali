.class public Lcom/android/server/usb/UsbService;
.super Landroid/hardware/usb/IUsbManager$Stub;
.source "UsbService.java"


# static fields
.field private static final LOG:Z = false

.field private static final MSG_FUNCTION_DISABLED:I = 0x2

.field private static final MSG_FUNCTION_ENABLED:I = 0x1

.field private static final MSG_UPDATE_STATE:I = 0x0

.field private static final TAG:Ljava/lang/String; = null

.field private static final UPDATE_DELAY:I = 0x3e8

.field private static final USB_COMPOSITE_CLASS_PATH:Ljava/lang/String; = "/sys/class/usb_composite"

.field private static final USB_CONFIGURATION_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/switch/usb_configuration"

.field private static final USB_CONFIGURATION_PATH:Ljava/lang/String; = "/sys/class/switch/usb_configuration/state"

.field private static final USB_CONNECTED_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/switch/usb_connected"

.field private static final USB_CONNECTED_PATH:Ljava/lang/String; = "/sys/class/switch/usb_connected/state"

.field private static final USB_FUNCTIONS_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/usb_composite/"


# instance fields
.field private final mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

.field private mConfiguration:I

.field private mConnected:I

.field private final mContext:Landroid/content/Context;

.field private mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

.field private final mDefaultFunctions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

.field private final mDisabledFunctions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mEnabledFunctions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private final mHasUsbAccessory:Z

.field private mLastConfiguration:I

.field private mLastConnected:I

.field private final mLock:Ljava/lang/Object;

.field private mSystemReady:Z

.field private final mUEventObserver:Landroid/os/UEventObserver;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 58
    const-class v0, Lcom/android/server/usb/UsbService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    const/4 v1, -0x1

    .line 213
    invoke-direct {p0}, Landroid/hardware/usb/IUsbManager$Stub;-><init>()V

    .line 88
    iput v1, p0, Lcom/android/server/usb/UsbService;->mLastConnected:I

    .line 89
    iput v1, p0, Lcom/android/server/usb/UsbService;->mLastConfiguration:I

    .line 92
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    .line 93
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    .line 99
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mDefaultFunctions:Ljava/util/ArrayList;

    .line 102
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    .line 145
    new-instance v1, Lcom/android/server/usb/UsbService$1;

    invoke-direct {v1, p0}, Lcom/android/server/usb/UsbService$1;-><init>(Lcom/android/server/usb/UsbService;)V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mUEventObserver:Landroid/os/UEventObserver;

    .line 202
    new-instance v1, Lcom/android/server/usb/UsbService$2;

    invoke-direct {v1, p0}, Lcom/android/server/usb/UsbService$2;-><init>(Lcom/android/server/usb/UsbService;)V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    .line 382
    new-instance v1, Lcom/android/server/usb/UsbService$3;

    invoke-direct {v1, p0}, Lcom/android/server/usb/UsbService$3;-><init>(Lcom/android/server/usb/UsbService;)V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mHandler:Landroid/os/Handler;

    .line 214
    iput-object p1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    .line 215
    new-instance v1, Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-direct {v1, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    .line 216
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 217
    .local v0, pm:Landroid/content/pm/PackageManager;
    const-string v1, "android.hardware.usb.accessory"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/server/usb/UsbService;->mHasUsbAccessory:Z

    .line 219
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 220
    :try_start_53
    invoke-direct {p0}, Lcom/android/server/usb/UsbService;->init()V

    .line 223
    iget v2, p0, Lcom/android/server/usb/UsbService;->mConfiguration:I

    if-ltz v2, :cond_6f

    .line 224
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mUEventObserver:Landroid/os/UEventObserver;

    const-string v3, "DEVPATH=/devices/virtual/switch/usb_connected"

    invoke-virtual {v2, v3}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 225
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mUEventObserver:Landroid/os/UEventObserver;

    const-string v3, "DEVPATH=/devices/virtual/switch/usb_configuration"

    invoke-virtual {v2, v3}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 226
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mUEventObserver:Landroid/os/UEventObserver;

    const-string v3, "DEVPATH=/devices/virtual/usb_composite/"

    invoke-virtual {v2, v3}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 228
    :cond_6f
    monitor-exit v1

    .line 229
    return-void

    .line 228
    :catchall_71
    move-exception v2

    monitor-exit v1
    :try_end_73
    .catchall {:try_start_53 .. :try_end_73} :catchall_71

    throw v2
.end method

.method static synthetic access$000()Ljava/lang/String;
    .registers 1

    .prologue
    .line 57
    sget-object v0, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/usb/UsbService;)Ljava/lang/Object;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/server/usb/UsbService;)Ljava/util/ArrayList;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/server/usb/UsbService;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget v0, p0, Lcom/android/server/usb/UsbService;->mLastConnected:I

    return v0
.end method

.method static synthetic access$1102(Lcom/android/server/usb/UsbService;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput p1, p0, Lcom/android/server/usb/UsbService;->mLastConnected:I

    return p1
.end method

.method static synthetic access$1200(Lcom/android/server/usb/UsbService;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget v0, p0, Lcom/android/server/usb/UsbService;->mLastConfiguration:I

    return v0
.end method

.method static synthetic access$1202(Lcom/android/server/usb/UsbService;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput p1, p0, Lcom/android/server/usb/UsbService;->mLastConfiguration:I

    return p1
.end method

.method static synthetic access$1300(Lcom/android/server/usb/UsbService;)Ljava/util/ArrayList;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDefaultFunctions:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/server/usb/UsbService;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/server/usb/UsbService;Ljava/lang/String;Z)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/android/server/usb/UsbService;->functionEnabledLocked(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/usb/UsbService;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget v0, p0, Lcom/android/server/usb/UsbService;->mConnected:I

    return v0
.end method

.method static synthetic access$202(Lcom/android/server/usb/UsbService;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput p1, p0, Lcom/android/server/usb/UsbService;->mConnected:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/server/usb/UsbService;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget v0, p0, Lcom/android/server/usb/UsbService;->mConfiguration:I

    return v0
.end method

.method static synthetic access$302(Lcom/android/server/usb/UsbService;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput p1, p0, Lcom/android/server/usb/UsbService;->mConfiguration:I

    return p1
.end method

.method static synthetic access$400(Lcom/android/server/usb/UsbService;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-boolean v0, p0, Lcom/android/server/usb/UsbService;->mSystemReady:Z

    return v0
.end method

.method static synthetic access$500(Lcom/android/server/usb/UsbService;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbService;->update(Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/server/usb/UsbService;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/server/usb/UsbService;)Landroid/hardware/usb/UsbAccessory;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    return-object v0
.end method

.method static synthetic access$702(Lcom/android/server/usb/UsbService;Landroid/hardware/usb/UsbAccessory;)Landroid/hardware/usb/UsbAccessory;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput-object p1, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    return-object p1
.end method

.method static synthetic access$800(Lcom/android/server/usb/UsbService;)Lcom/android/server/usb/UsbDeviceSettingsManager;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/server/usb/UsbService;)Ljava/util/ArrayList;
    .registers 2
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    return-object v0
.end method

.method private final functionEnabledLocked(Ljava/lang/String;Z)V
    .registers 4
    .parameter "function"
    .parameter "enabled"

    .prologue
    .line 125
    if-eqz p2, :cond_20

    .line 126
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 127
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    :cond_f
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 131
    const-string v0, "accessory"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 132
    invoke-direct {p0}, Lcom/android/server/usb/UsbService;->readCurrentAccessoryLocked()V

    .line 140
    :cond_1f
    :goto_1f
    return-void

    .line 135
    :cond_20
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 136
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    :cond_2d
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1f
.end method

.method private final init()V
    .registers 16

    .prologue
    const/16 v10, 0x400

    const-string v14, "mtp"

    const-string v13, "mass_storage"

    const-string v12, ""

    .line 232
    new-array v0, v10, [C

    .line 233
    .local v0, buffer:[C
    const/4 v6, 0x0

    .line 236
    .local v6, inAccessoryMode:Z
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/server/usb/UsbService;->mConfiguration:I

    .line 238
    :try_start_e
    new-instance v2, Ljava/io/FileReader;

    const-string v10, "/sys/class/switch/usb_connected/state"

    invoke-direct {v2, v10}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 239
    .local v2, file:Ljava/io/FileReader;
    const/4 v10, 0x0

    const/16 v11, 0x400

    invoke-virtual {v2, v0, v10, v11}, Ljava/io/FileReader;->read([CII)I

    move-result v7

    .line 240
    .local v7, len:I
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    .line 241
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11, v7}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    iput v10, p0, Lcom/android/server/usb/UsbService;->mConnected:I

    .line 243
    new-instance v2, Ljava/io/FileReader;

    .end local v2           #file:Ljava/io/FileReader;
    const-string v10, "/sys/class/switch/usb_configuration/state"

    invoke-direct {v2, v10}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 244
    .restart local v2       #file:Ljava/io/FileReader;
    const/4 v10, 0x0

    const/16 v11, 0x400

    invoke-virtual {v2, v0, v10, v11}, Ljava/io/FileReader;->read([CII)I

    move-result v7

    .line 245
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    .line 246
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11, v7}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    iput v10, p0, Lcom/android/server/usb/UsbService;->mConfiguration:I
    :try_end_58
    .catch Ljava/io/FileNotFoundException; {:try_start_e .. :try_end_58} :catch_5d
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_58} :catch_67

    .line 253
    .end local v2           #file:Ljava/io/FileReader;
    .end local v7           #len:I
    :goto_58
    iget v10, p0, Lcom/android/server/usb/UsbService;->mConfiguration:I

    if-gez v10, :cond_71

    .line 303
    :cond_5c
    :goto_5c
    return-void

    .line 248
    :catch_5d
    move-exception v10

    move-object v1, v10

    .line 249
    .local v1, e:Ljava/io/FileNotFoundException;
    sget-object v10, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    const-string v11, "This kernel does not have USB configuration switch support"

    invoke-static {v10, v11}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_58

    .line 250
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_67
    move-exception v10

    move-object v1, v10

    .line 251
    .local v1, e:Ljava/lang/Exception;
    sget-object v10, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    const-string v11, ""

    invoke-static {v10, v12, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_58

    .line 260
    .end local v1           #e:Ljava/lang/Exception;
    :cond_71
    :try_start_71
    new-instance v10, Ljava/io/File;

    const-string v11, "/sys/class/usb_composite"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 261
    .local v3, files:[Ljava/io/File;
    const/4 v5, 0x0

    .local v5, i:I
    :goto_7d
    array-length v10, v3

    if-ge v5, v10, :cond_db

    .line 262
    new-instance v2, Ljava/io/File;

    aget-object v10, v3, v5

    const-string v11, "enable"

    invoke-direct {v2, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 263
    .local v2, file:Ljava/io/File;
    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 264
    .local v8, reader:Ljava/io/FileReader;
    const/4 v10, 0x0

    const/16 v11, 0x400

    invoke-virtual {v8, v0, v10, v11}, Ljava/io/FileReader;->read([CII)I

    move-result v7

    .line 265
    .restart local v7       #len:I
    invoke-virtual {v8}, Ljava/io/FileReader;->close()V

    .line 266
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11, v7}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 267
    .local v9, value:I
    aget-object v10, v3, v5

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 268
    .local v4, functionName:Ljava/lang/String;
    const/4 v10, 0x1

    if-ne v9, v10, :cond_f3

    .line 269
    iget-object v10, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    const-string v10, "accessory"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c4

    .line 273
    const/4 v6, 0x1

    .line 261
    :cond_c1
    :goto_c1
    add-int/lit8 v5, v5, 0x1

    goto :goto_7d

    .line 274
    :cond_c4
    const-string v10, "adb"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c1

    .line 277
    iget-object v10, p0, Lcom/android/server/usb/UsbService;->mDefaultFunctions:Ljava/util/ArrayList;

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_d1
    .catch Ljava/io/FileNotFoundException; {:try_start_71 .. :try_end_d1} :catch_d2
    .catch Ljava/lang/Exception; {:try_start_71 .. :try_end_d1} :catch_f9

    goto :goto_c1

    .line 283
    .end local v2           #file:Ljava/io/File;
    .end local v3           #files:[Ljava/io/File;
    .end local v4           #functionName:Ljava/lang/String;
    .end local v5           #i:I
    .end local v7           #len:I
    .end local v8           #reader:Ljava/io/FileReader;
    .end local v9           #value:I
    :catch_d2
    move-exception v10

    move-object v1, v10

    .line 284
    .local v1, e:Ljava/io/FileNotFoundException;
    sget-object v10, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    const-string v11, "This kernel does not have USB composite class support"

    invoke-static {v10, v11}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :cond_db
    :goto_db
    if-eqz v6, :cond_5c

    .line 292
    invoke-direct {p0}, Lcom/android/server/usb/UsbService;->readCurrentAccessoryLocked()V

    .line 297
    iget-object v10, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    const-string v11, "mtp"

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_103

    .line 298
    iget-object v10, p0, Lcom/android/server/usb/UsbService;->mDefaultFunctions:Ljava/util/ArrayList;

    const-string v11, "mtp"

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_5c

    .line 280
    .restart local v2       #file:Ljava/io/File;
    .restart local v3       #files:[Ljava/io/File;
    .restart local v4       #functionName:Ljava/lang/String;
    .restart local v5       #i:I
    .restart local v7       #len:I
    .restart local v8       #reader:Ljava/io/FileReader;
    .restart local v9       #value:I
    :cond_f3
    :try_start_f3
    iget-object v10, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f8
    .catch Ljava/io/FileNotFoundException; {:try_start_f3 .. :try_end_f8} :catch_d2
    .catch Ljava/lang/Exception; {:try_start_f3 .. :try_end_f8} :catch_f9

    goto :goto_c1

    .line 285
    .end local v2           #file:Ljava/io/File;
    .end local v3           #files:[Ljava/io/File;
    .end local v4           #functionName:Ljava/lang/String;
    .end local v5           #i:I
    .end local v7           #len:I
    .end local v8           #reader:Ljava/io/FileReader;
    .end local v9           #value:I
    :catch_f9
    move-exception v10

    move-object v1, v10

    .line 286
    .local v1, e:Ljava/lang/Exception;
    sget-object v10, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    const-string v11, ""

    invoke-static {v10, v12, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_db

    .line 299
    .end local v1           #e:Ljava/lang/Exception;
    :cond_103
    iget-object v10, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    const-string v11, "mass_storage"

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5c

    .line 300
    iget-object v10, p0, Lcom/android/server/usb/UsbService;->mDefaultFunctions:Ljava/util/ArrayList;

    const-string v11, "mass_storage"

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_5c
.end method

.method private native nativeGetAccessoryStrings()[Ljava/lang/String;
.end method

.method private native nativeOpenAccessory()Landroid/os/ParcelFileDescriptor;
.end method

.method private final readCurrentAccessoryLocked()V
    .registers 5

    .prologue
    .line 107
    iget-boolean v1, p0, Lcom/android/server/usb/UsbService;->mHasUsbAccessory:Z

    if-eqz v1, :cond_36

    .line 108
    invoke-direct {p0}, Lcom/android/server/usb/UsbService;->nativeGetAccessoryStrings()[Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, strings:[Ljava/lang/String;
    if-eqz v0, :cond_37

    .line 110
    new-instance v1, Landroid/hardware/usb/UsbAccessory;

    invoke-direct {v1, v0}, Landroid/hardware/usb/UsbAccessory;-><init>([Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    .line 111
    sget-object v1, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "entering USB accessory mode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    iget-boolean v1, p0, Lcom/android/server/usb/UsbService;->mSystemReady:Z

    if-eqz v1, :cond_36

    .line 113
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v1, v2}, Lcom/android/server/usb/UsbDeviceSettingsManager;->accessoryAttached(Landroid/hardware/usb/UsbAccessory;)V

    .line 119
    .end local v0           #strings:[Ljava/lang/String;
    :cond_36
    :goto_36
    return-void

    .line 116
    .restart local v0       #strings:[Ljava/lang/String;
    :cond_37
    sget-object v1, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    const-string v2, "nativeGetAccessoryStrings failed"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_36
.end method

.method private final update(Z)V
    .registers 6
    .parameter "delayed"

    .prologue
    const/4 v3, 0x0

    .line 325
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 326
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_10

    const-wide/16 v1, 0x3e8

    :goto_c
    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 327
    return-void

    .line 326
    :cond_10
    const-wide/16 v1, 0x0

    goto :goto_c
.end method


# virtual methods
.method public clearDefaults(Ljava/lang/String;)V
    .registers 5
    .parameter "packageName"

    .prologue
    .line 375
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->clearDefaults(Ljava/lang/String;)V

    .line 377
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 8
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    const-string v1, " "

    const-string v1, ""

    .line 453
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.DUMP"

    invoke-virtual {v1, v2}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_37

    .line 455
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Permission Denial: can\'t dump UsbManager from from pid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", uid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 485
    :goto_36
    return-void

    .line 461
    :cond_37
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 462
    :try_start_3a
    const-string v1, "USB Manager State:"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 464
    const-string v1, "  USB Device State:"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 465
    const-string v1, "    Enabled Functions: "

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 466
    const/4 v0, 0x0

    .local v0, i:I
    :goto_4a
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_73

    .line 467
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mEnabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 466
    add-int/lit8 v0, v0, 0x1

    goto :goto_4a

    .line 469
    :cond_73
    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 470
    const-string v1, "    Disabled Functions: "

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 471
    const/4 v0, 0x0

    :goto_7e
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_a7

    .line 472
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mDisabledFunctions:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 471
    add-int/lit8 v0, v0, 0x1

    goto :goto_7e

    .line 474
    :cond_a7
    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 475
    const-string v1, "    Default Functions: "

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 476
    const/4 v0, 0x0

    :goto_b2
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mDefaultFunctions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_db

    .line 477
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mDefaultFunctions:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 476
    add-int/lit8 v0, v0, 0x1

    goto :goto_b2

    .line 479
    :cond_db
    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 480
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "    mConnected: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/android/server/usb/UsbService;->mConnected:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", mConfiguration: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/android/server/usb/UsbService;->mConfiguration:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 481
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "    mCurrentAccessory: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 483
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-virtual {v1, p1, p2}, Lcom/android/server/usb/UsbDeviceSettingsManager;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;)V

    .line 484
    monitor-exit v2

    goto/16 :goto_36

    .end local v0           #i:I
    :catchall_124
    move-exception v1

    monitor-exit v2
    :try_end_126
    .catchall {:try_start_3a .. :try_end_126} :catchall_124

    throw v1
.end method

.method public getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;
    .registers 2

    .prologue
    .line 331
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    return-object v0
.end method

.method public grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V
    .registers 6
    .parameter "accessory"
    .parameter "uid"

    .prologue
    .line 365
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/usb/UsbDeviceSettingsManager;->grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V

    .line 367
    return-void
.end method

.method public hasAccessoryPermission(Landroid/hardware/usb/UsbAccessory;)Z
    .registers 3
    .parameter "accessory"

    .prologue
    .line 356
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->hasPermission(Landroid/hardware/usb/UsbAccessory;)Z

    move-result v0

    return v0
.end method

.method public hasDefaults(Ljava/lang/String;)Z
    .registers 5
    .parameter "packageName"

    .prologue
    .line 370
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->hasDefaults(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public openAccessory(Landroid/hardware/usb/UsbAccessory;)Landroid/os/ParcelFileDescriptor;
    .registers 6
    .parameter "accessory"

    .prologue
    .line 336
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 337
    :try_start_3
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    if-nez v1, :cond_12

    .line 338
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "no accessory attached"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 347
    :catchall_f
    move-exception v1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v1

    .line 340
    :cond_12
    :try_start_12
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v1, p1}, Landroid/hardware/usb/UsbAccessory;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    .line 341
    sget-object v1, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " does not match current accessory "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "accessory not attached"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 345
    :cond_44
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v1, v2}, Lcom/android/server/usb/UsbDeviceSettingsManager;->checkPermission(Landroid/hardware/usb/UsbAccessory;)V

    .line 346
    invoke-direct {p0}, Lcom/android/server/usb/UsbService;->nativeOpenAccessory()Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    monitor-exit v0
    :try_end_50
    .catchall {:try_start_12 .. :try_end_50} :catchall_f

    return-object v1
.end method

.method public requestAccessoryPermission(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 5
    .parameter "accessory"
    .parameter "packageName"
    .parameter "pi"

    .prologue
    .line 361
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/usb/UsbDeviceSettingsManager;->requestPermission(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 362
    return-void
.end method

.method public setAccessoryPackage(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;)V
    .registers 6
    .parameter "accessory"
    .parameter "packageName"

    .prologue
    .line 351
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceSettingsManager;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/usb/UsbDeviceSettingsManager;->setAccessoryPackage(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;)V

    .line 353
    return-void
.end method

.method public systemReady()V
    .registers 6

    .prologue
    .line 306
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 307
    const/4 v1, 0x0

    :try_start_4
    invoke-direct {p0, v1}, Lcom/android/server/usb/UsbService;->update(Z)V

    .line 308
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    if-eqz v1, :cond_20

    .line 309
    sget-object v1, Lcom/android/server/usb/UsbService;->TAG:Ljava/lang/String;

    const-string v2, "accessoryAttached at systemReady"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.BOOT_COMPLETED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 315
    :cond_20
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/server/usb/UsbService;->mSystemReady:Z

    .line 316
    monitor-exit v0

    .line 317
    return-void

    .line 316
    :catchall_25
    move-exception v1

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_4 .. :try_end_27} :catchall_25

    throw v1
.end method
