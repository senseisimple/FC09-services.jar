.class Lcom/android/server/HeadsetObserver;
.super Landroid/os/UEventObserver;
.source "HeadsetObserver.java"


# static fields
.field private static final BIT_HEADSET:I = 0x1

.field private static final BIT_HEADSET_NO_MIC:I = 0x2

.field private static final BIT_HEADSET_TV_OUT:I = 0x2

.field private static final HEADSETS_WITH_MIC:I = 0x1

.field private static final HEADSET_NAME_PATH:Ljava/lang/String; = "/sys/class/switch/h2w/name"

.field private static final HEADSET_STATE_PATH:Ljava/lang/String; = "/sys/class/switch/h2w/state"

.field private static final HEADSET_UEVENT_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/switch/h2w"

.field private static final LOG:Z = true

.field private static final SUPPORTED_HEADSETS:I = 0x3

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mHeadsetName:Ljava/lang/String;

.field private mHeadsetState:I

.field private mLastPlugType:Z

.field private mPrevHeadsetState:I

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const-class v0, Lcom/android/server/HeadsetObserver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    .line 65
    invoke-direct {p0}, Landroid/os/UEventObserver;-><init>()V

    .line 63
    iput-boolean v3, p0, Lcom/android/server/HeadsetObserver;->mLastPlugType:Z

    .line 270
    new-instance v1, Lcom/android/server/HeadsetObserver$1;

    invoke-direct {v1, p0}, Lcom/android/server/HeadsetObserver$1;-><init>(Lcom/android/server/HeadsetObserver;)V

    iput-object v1, p0, Lcom/android/server/HeadsetObserver;->mHandler:Landroid/os/Handler;

    .line 66
    iput-object p1, p0, Lcom/android/server/HeadsetObserver;->mContext:Landroid/content/Context;

    .line 67
    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 68
    .local v0, pm:Landroid/os/PowerManager;
    const/4 v1, 0x1

    const-string v2, "HeadsetObserver"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/HeadsetObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 69
    iget-object v1, p0, Lcom/android/server/HeadsetObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1, v3}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 71
    const-string v1, "DEVPATH=/devices/virtual/switch/h2w"

    invoke-virtual {p0, v1}, Lcom/android/server/HeadsetObserver;->startObserving(Ljava/lang/String;)V

    .line 73
    invoke-direct {p0}, Lcom/android/server/HeadsetObserver;->init()V

    .line 74
    return-void
.end method

.method private TvoutSetCableStatus(Z)V
    .registers 2
    .parameter "status"

    .prologue
    .line 311
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/HeadsetObserver;IILjava/lang/String;)V
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/HeadsetObserver;->sendIntents(IILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/server/HeadsetObserver;)Landroid/os/PowerManager$WakeLock;
    .registers 2
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/server/HeadsetObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method private final declared-synchronized init()V
    .registers 9

    .prologue
    .line 88
    monitor-enter p0

    const/16 v6, 0x400

    :try_start_3
    new-array v0, v6, [C

    .line 90
    .local v0, buffer:[C
    iget-object v4, p0, Lcom/android/server/HeadsetObserver;->mHeadsetName:Ljava/lang/String;

    .line 91
    .local v4, newName:Ljava/lang/String;
    iget v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    .line 92
    .local v5, newState:I
    iget v6, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    iput v6, p0, Lcom/android/server/HeadsetObserver;->mPrevHeadsetState:I
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_54

    .line 94
    :try_start_d
    new-instance v2, Ljava/io/FileReader;

    const-string v6, "/sys/class/switch/h2w/state"

    invoke-direct {v2, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 95
    .local v2, file:Ljava/io/FileReader;
    const/4 v6, 0x0

    const/16 v7, 0x400

    invoke-virtual {v2, v0, v6, v7}, Ljava/io/FileReader;->read([CII)I

    move-result v3

    .line 96
    .local v3, len:I
    new-instance v6, Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct {v6, v0, v7, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 98
    new-instance v2, Ljava/io/FileReader;

    .end local v2           #file:Ljava/io/FileReader;
    const-string v6, "/sys/class/switch/h2w/name"

    invoke-direct {v2, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 99
    .restart local v2       #file:Ljava/io/FileReader;
    const/4 v6, 0x0

    const/16 v7, 0x400

    invoke-virtual {v2, v0, v6, v7}, Ljava/io/FileReader;->read([CII)I

    move-result v3

    .line 100
    new-instance v6, Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct {v6, v0, v7, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_44
    .catchall {:try_start_d .. :try_end_44} :catchall_54
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_44} :catch_4a
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_44} :catch_57

    move-result-object v4

    .line 108
    .end local v2           #file:Ljava/io/FileReader;
    .end local v3           #len:I
    :goto_45
    :try_start_45
    invoke-direct {p0, v4, v5}, Lcom/android/server/HeadsetObserver;->update(Ljava/lang/String;I)V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_54

    .line 109
    monitor-exit p0

    return-void

    .line 102
    :catch_4a
    move-exception v6

    move-object v1, v6

    .line 103
    .local v1, e:Ljava/io/FileNotFoundException;
    :try_start_4c
    sget-object v6, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    const-string v7, "This kernel does not have wired headset support"

    invoke-static {v6, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_53
    .catchall {:try_start_4c .. :try_end_53} :catchall_54

    goto :goto_45

    .line 88
    .end local v0           #buffer:[C
    .end local v1           #e:Ljava/io/FileNotFoundException;
    .end local v4           #newName:Ljava/lang/String;
    .end local v5           #newState:I
    :catchall_54
    move-exception v6

    monitor-exit p0

    throw v6

    .line 104
    .restart local v0       #buffer:[C
    .restart local v4       #newName:Ljava/lang/String;
    .restart local v5       #newState:I
    :catch_57
    move-exception v6

    move-object v1, v6

    .line 105
    .local v1, e:Ljava/lang/Exception;
    :try_start_59
    sget-object v6, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    const-string v7, ""

    invoke-static {v6, v7, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_60
    .catchall {:try_start_59 .. :try_end_60} :catchall_54

    goto :goto_45
.end method

.method private isTvOutStatus()Z
    .registers 2

    .prologue
    .line 326
    const/4 v0, 0x0

    return v0
.end method

.method private final sendIntent(IIILjava/lang/String;)V
    .registers 11
    .parameter "headset"
    .parameter "headsetState"
    .parameter "prevHeadsetState"
    .parameter "headsetName"

    .prologue
    .line 211
    and-int v3, p2, p1

    and-int v4, p3, p1

    if-eq v3, v4, :cond_5d

    .line 213
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 214
    .local v0, intent:Landroid/content/Intent;
    const/high16 v3, 0x4000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 215
    const/4 v2, 0x0

    .line 216
    .local v2, state:I
    const/4 v1, 0x0

    .line 218
    .local v1, microphone:I
    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_19

    .line 219
    const/4 v1, 0x1

    .line 221
    :cond_19
    and-int v3, p2, p1

    if-eqz v3, :cond_1e

    .line 222
    const/4 v2, 0x1

    .line 224
    :cond_1e
    const-string v3, "state"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 225
    const-string v3, "name"

    invoke-virtual {v0, v3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 226
    const-string v3, "microphone"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 228
    sget-object v3, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Intent.ACTION_HEADSET_PLUG: state: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mic: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/app/ActivityManagerNative;->broadcastStickyIntent(Landroid/content/Intent;Ljava/lang/String;)V

    .line 231
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #microphone:I
    .end local v2           #state:I
    :cond_5d
    return-void
.end method

.method private final sendIntentTvout(IIILjava/lang/String;)V
    .registers 11
    .parameter "headset"
    .parameter "headsetState"
    .parameter "prevHeadsetState"
    .parameter "headsetName"

    .prologue
    .line 234
    and-int v3, p2, p1

    and-int v4, p3, p1

    if-eq v3, v4, :cond_6a

    .line 236
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.TVOUT_PLUG"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 237
    .local v0, intent:Landroid/content/Intent;
    const/high16 v3, 0x4000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 238
    const/4 v2, 0x0

    .line 239
    .local v2, state:I
    const/4 v1, 0x0

    .line 241
    .local v1, microphone:I
    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_19

    .line 242
    const/4 v1, 0x1

    .line 244
    :cond_19
    and-int v3, p2, p1

    if-eqz v3, :cond_1e

    .line 245
    const/4 v2, 0x1

    .line 247
    :cond_1e
    const-string v3, "state"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 248
    const-string v3, "name"

    invoke-virtual {v0, v3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 249
    const-string v3, "microphone"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 252
    if-nez v2, :cond_6b

    .line 255
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/HeadsetObserver;->updateTvOutConnectNotification(Z)V

    .line 256
    sget-object v3, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    const-string v4, "tvout close"

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    :goto_3a
    sget-object v3, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Intent.ACTION_TVOUT_PLUG: state: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mic: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/app/ActivityManagerNative;->broadcastStickyIntent(Landroid/content/Intent;Ljava/lang/String;)V

    .line 268
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #microphone:I
    .end local v2           #state:I
    :cond_6a
    return-void

    .line 260
    .restart local v0       #intent:Landroid/content/Intent;
    .restart local v1       #microphone:I
    .restart local v2       #state:I
    :cond_6b
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/android/server/HeadsetObserver;->updateTvOutConnectNotification(Z)V

    .line 261
    sget-object v3, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    const-string v4, "tvout start"

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3a
.end method

.method private final declared-synchronized sendIntents(IILjava/lang/String;)V
    .registers 9
    .parameter "headsetState"
    .parameter "prevHeadsetState"
    .parameter "headsetName"

    .prologue
    const/4 v4, 0x2

    .line 197
    monitor-enter p0

    const/4 v0, 0x3

    .line 198
    .local v0, allHeadsets:I
    const/4 v1, 0x1

    .local v1, curHeadset:I
    :goto_4
    if-eqz v0, :cond_25

    .line 199
    and-int v2, v1, v0

    if-eqz v2, :cond_1b

    .line 200
    :try_start_a
    invoke-direct {p0}, Lcom/android/server/HeadsetObserver;->isTvOutStatus()Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1e

    if-eq p1, v4, :cond_15

    if-ne p2, v4, :cond_1e

    .line 201
    :cond_15
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/android/server/HeadsetObserver;->sendIntentTvout(IIILjava/lang/String;)V

    .line 205
    :goto_18
    xor-int/lit8 v2, v1, -0x1

    and-int/2addr v0, v2

    .line 198
    :cond_1b
    shl-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 203
    :cond_1e
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/android/server/HeadsetObserver;->sendIntent(IIILjava/lang/String;)V
    :try_end_21
    .catchall {:try_start_a .. :try_end_21} :catchall_22

    goto :goto_18

    .line 197
    :catchall_22
    move-exception v2

    monitor-exit p0

    throw v2

    .line 208
    :cond_25
    monitor-exit p0

    return-void
.end method

.method private final declared-synchronized update(Ljava/lang/String;I)V
    .registers 16
    .parameter "newName"
    .parameter "newState"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 112
    monitor-enter p0

    :try_start_3
    sget-object v5, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "HEadSetObserver : newState ="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", newName = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    and-int/lit8 v1, p2, 0x3

    .line 127
    .local v1, headsetState:I
    iget v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    or-int v4, v1, v5

    .line 128
    .local v4, newOrOld:I
    const/4 v0, 0x0

    .line 132
    .local v0, delay:I
    iget v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I
    :try_end_2e
    .catchall {:try_start_3 .. :try_end_2e} :catchall_93

    if-eq v5, v1, :cond_35

    sub-int v5, v4, v12

    and-int/2addr v5, v4

    if-eqz v5, :cond_37

    .line 194
    :cond_35
    :goto_35
    monitor-exit p0

    return-void

    .line 136
    :cond_37
    const/4 v3, 0x0

    .line 137
    .local v3, isUnplug:Z
    :try_start_38
    iget v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    if-ne v1, v5, :cond_40

    iget-object v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetName:Ljava/lang/String;

    if-eq p1, v5, :cond_55

    .line 138
    :cond_40
    iget v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_4a

    and-int/lit8 v5, v1, 0x1

    if-eqz v5, :cond_54

    :cond_4a
    iget v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_55

    and-int/lit8 v5, v1, 0x2

    if-nez v5, :cond_55

    .line 140
    :cond_54
    const/4 v3, 0x1

    .line 144
    :cond_55
    iput-object p1, p0, Lcom/android/server/HeadsetObserver;->mHeadsetName:Ljava/lang/String;

    .line 145
    iget v5, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    iput v5, p0, Lcom/android/server/HeadsetObserver;->mPrevHeadsetState:I

    .line 146
    iput v1, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    .line 148
    if-nez v1, :cond_96

    .line 149
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 150
    .local v2, intent:Landroid/content/Intent;
    iget-object v5, p0, Lcom/android/server/HeadsetObserver;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 156
    const/16 v0, 0x3e8

    .line 164
    .end local v2           #intent:Landroid/content/Intent;
    :cond_6d
    :goto_6d
    iget-object v5, p0, Lcom/android/server/HeadsetObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 165
    iget-object v5, p0, Lcom/android/server/HeadsetObserver;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/android/server/HeadsetObserver;->mHandler:Landroid/os/Handler;

    const/4 v7, 0x0

    iget v8, p0, Lcom/android/server/HeadsetObserver;->mHeadsetState:I

    iget v9, p0, Lcom/android/server/HeadsetObserver;->mPrevHeadsetState:I

    iget-object v10, p0, Lcom/android/server/HeadsetObserver;->mHeadsetName:Ljava/lang/String;

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    int-to-long v7, v0

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 170
    iput-boolean v3, p0, Lcom/android/server/HeadsetObserver;->mLastPlugType:Z

    .line 172
    const/4 v5, 0x2

    if-eq p2, v5, :cond_8c

    if-eqz v3, :cond_35

    .line 173
    :cond_8c
    if-nez v3, :cond_a2

    move v5, v12

    :goto_8f
    invoke-direct {p0, v5}, Lcom/android/server/HeadsetObserver;->TvoutSetCableStatus(Z)V
    :try_end_92
    .catchall {:try_start_38 .. :try_end_92} :catchall_93

    goto :goto_35

    .line 112
    .end local v0           #delay:I
    .end local v1           #headsetState:I
    .end local v3           #isUnplug:Z
    .end local v4           #newOrOld:I
    :catchall_93
    move-exception v5

    monitor-exit p0

    throw v5

    .line 160
    .restart local v0       #delay:I
    .restart local v1       #headsetState:I
    .restart local v3       #isUnplug:Z
    .restart local v4       #newOrOld:I
    :cond_96
    :try_start_96
    iget-object v5, p0, Lcom/android/server/HeadsetObserver;->mHandler:Landroid/os/Handler;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/os/Handler;->hasMessages(I)Z
    :try_end_9c
    .catchall {:try_start_96 .. :try_end_9c} :catchall_93

    move-result v5

    if-eqz v5, :cond_6d

    .line 161
    const/16 v0, 0x3e8

    goto :goto_6d

    :cond_a2
    move v5, v11

    .line 173
    goto :goto_8f
.end method


# virtual methods
.method public onUEvent(Landroid/os/UEventObserver$UEvent;)V
    .registers 6
    .parameter "event"

    .prologue
    .line 78
    sget-object v1, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Headset UEVENT: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/os/UEventObserver$UEvent;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    :try_start_1c
    const-string v1, "SWITCH_NAME"

    invoke-virtual {p1, v1}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SWITCH_STATE"

    invoke-virtual {p1, v2}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/android/server/HeadsetObserver;->update(Ljava/lang/String;I)V
    :try_end_2f
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_2f} :catch_30

    .line 85
    :goto_2f
    return-void

    .line 82
    :catch_30
    move-exception v1

    move-object v0, v1

    .line 83
    .local v0, e:Ljava/lang/NumberFormatException;
    sget-object v1, Lcom/android/server/HeadsetObserver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not parse switch state from event "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2f
.end method

.method updateTvOutConnectNotification(Z)V
    .registers 2
    .parameter "Connected"

    .prologue
    .line 294
    return-void
.end method
