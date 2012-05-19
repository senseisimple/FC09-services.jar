.class Lcom/android/server/UsbStorageService;
.super Landroid/os/storage/IUsbStorageService$Stub;
.source "UsbStorageService.java"

# interfaces
.implements Lcom/android/server/INativeDaemonConnectorCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/UsbStorageService$VoldResponseCode;,
        Lcom/android/server/UsbStorageService$VolumeState;,
        Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;,
        Lcom/android/server/UsbStorageService$UsbStorageServiceHandler;,
        Lcom/android/server/UsbStorageService$UsbStorageMap;
    }
.end annotation


# static fields
.field private static final LOCAL_LOGD:Z = true

.field private static final TAG:Ljava/lang/String; = "UsbStorageService"

.field private static final USBSTORAGE_TAG:Ljava/lang/String; = "UsbStorageConnector"


# instance fields
.field private mBooted:Z

.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mConnector:Lcom/android/server/NativeDaemonConnector;

.field private mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private final mHandlerThread:Landroid/os/HandlerThread;

.field private final mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;",
            ">;"
        }
    .end annotation
.end field

.field private mReady:Z

.field private mSafeUnmountedUsbHost:Z

.field private final mUsbStorageSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/android/server/UsbStorageService$UsbStorageMap;",
            ">;"
        }
    .end annotation
.end field

.field private final mWorkQueueHandler:Landroid/os/Handler;

.field private final mWorkQueueHandlerThread:Landroid/os/HandlerThread;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 10
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x0

    const-string v4, "UsbStorageService"

    const-string v7, "UsbStorageConnector"

    .line 539
    invoke-direct {p0}, Landroid/os/storage/IUsbStorageService$Stub;-><init>()V

    .line 53
    iput-boolean v6, p0, Lcom/android/server/UsbStorageService;->mBooted:Z

    .line 54
    iput-boolean v6, p0, Lcom/android/server/UsbStorageService;->mReady:Z

    .line 56
    iput-boolean v6, p0, Lcom/android/server/UsbStorageService;->mSafeUnmountedUsbHost:Z

    .line 58
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    .line 117
    new-instance v2, Lcom/android/server/UsbStorageService$2;

    invoke-direct {v2, p0}, Lcom/android/server/UsbStorageService$2;-><init>(Lcom/android/server/UsbStorageService;)V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 569
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    .line 540
    const-string v2, "UsbStorageService"

    const-string v2, "UsbStorageService :: "

    invoke-static {v4, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    iput-object p1, p0, Lcom/android/server/UsbStorageService;->mContext:Landroid/content/Context;

    .line 545
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 546
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 547
    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v2, v0, v3, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 549
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "UsbStorageServiceEvent"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mWorkQueueHandlerThread:Landroid/os/HandlerThread;

    .line 550
    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mWorkQueueHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->start()V

    .line 551
    new-instance v2, Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mWorkQueueHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mWorkQueueHandler:Landroid/os/Handler;

    .line 553
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "UsbStorageService"

    invoke-direct {v2, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 554
    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->start()V

    .line 555
    new-instance v2, Lcom/android/server/UsbStorageService$UsbStorageServiceHandler;

    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/android/server/UsbStorageService$UsbStorageServiceHandler;-><init>(Lcom/android/server/UsbStorageService;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mHandler:Landroid/os/Handler;

    .line 557
    new-instance v2, Lcom/android/server/NativeDaemonConnector;

    const-string v3, "usbstorage"

    const/16 v4, 0x64

    const-string v5, "UsbStorageConnector"

    invoke-direct {v2, p0, v3, v4, v7}, Lcom/android/server/NativeDaemonConnector;-><init>(Lcom/android/server/INativeDaemonConnectorCallbacks;Ljava/lang/String;ILjava/lang/String;)V

    iput-object v2, p0, Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;

    .line 559
    iput-boolean v6, p0, Lcom/android/server/UsbStorageService;->mSafeUnmountedUsbHost:Z

    .line 561
    iput-boolean v6, p0, Lcom/android/server/UsbStorageService;->mReady:Z

    .line 562
    new-instance v1, Ljava/lang/Thread;

    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;

    const-string v3, "UsbStorageConnector"

    invoke-direct {v1, v2, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 563
    .local v1, thread:Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 564
    return-void
.end method

.method static synthetic access$002(Lcom/android/server/UsbStorageService;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/android/server/UsbStorageService;->mReady:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/server/UsbStorageService;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/android/server/UsbStorageService;->waitForReady()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/UsbStorageService;)Lcom/android/server/NativeDaemonConnector;
    .registers 2
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/android/server/UsbStorageService;->updatePartitionsList(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/server/UsbStorageService;Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/android/server/UsbStorageService;->doMountVolume(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/android/server/UsbStorageService;ILjava/lang/String;[Ljava/lang/String;)Z
    .registers 5
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/UsbStorageService;->onEventInner(ILjava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/android/server/UsbStorageService;)Ljava/util/ArrayList;
    .registers 2
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method private final debugUsbStorageMap(Ljava/lang/String;)V
    .registers 11
    .parameter "tag"

    .prologue
    const-string v3, "UsbStorageService"

    .line 524
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    monitor-enter v3

    .line 525
    :try_start_5
    iget-object v4, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4a

    .line 526
    const/4 v0, 0x0

    .line 527
    .local v0, i:I
    iget-object v4, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 528
    .local v1, iter:Ljava/util/Iterator;
    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_68

    .line 529
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/UsbStorageService$UsbStorageMap;

    .line 530
    .local v2, map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    const-string v4, "UsbStorageService"

    const-string v5, "%s :: %02d::%s [%s] %s"

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    iget-object v8, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->state:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    iget-object v8, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    add-int/lit8 v0, v0, 0x1

    .line 532
    goto :goto_14

    .line 534
    .end local v0           #i:I
    .end local v1           #iter:Ljava/util/Iterator;
    .end local v2           #map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    :cond_4a
    const-string v4, "UsbStorageService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "debugUsbStorageMap -> \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\' empty"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    :cond_68
    monitor-exit v3

    .line 537
    return-void

    .line 536
    :catchall_6a
    move-exception v4

    monitor-exit v3
    :try_end_6c
    .catchall {:try_start_5 .. :try_end_6c} :catchall_6a

    throw v4
.end method

.method private doMountVolume(Ljava/lang/String;)I
    .registers 11
    .parameter "path"

    .prologue
    const-string v8, "doMountVolume :: path = "

    const-string v7, "UsbStorageService"

    .line 463
    const/4 v2, 0x0

    .line 471
    .local v2, rc:I
    :try_start_5
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;

    const-string v4, "volume mount %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/server/NativeDaemonConnector;->doCommand(Ljava/lang/String;)Ljava/util/ArrayList;
    :try_end_16
    .catch Lcom/android/server/NativeDaemonConnectorException; {:try_start_5 .. :try_end_16} :catch_17

    .line 496
    :goto_16
    return v2

    .line 472
    :catch_17
    move-exception v3

    move-object v1, v3

    .line 473
    .local v1, e:Lcom/android/server/NativeDaemonConnectorException;
    invoke-virtual {v1}, Lcom/android/server/NativeDaemonConnectorException;->getCode()I

    move-result v0

    .line 474
    .local v0, code:I
    const/16 v3, 0x191

    if-ne v0, v3, :cond_41

    .line 475
    const-string v3, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doMountVolume :: path = "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",result = OperationFailedNoMedia"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 476
    const/4 v2, -0x2

    goto :goto_16

    .line 477
    :cond_41
    const/16 v3, 0x192

    if-ne v0, v3, :cond_6a

    .line 478
    const-string v3, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doMountVolume :: path = "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",result = OperationFailedMediaBlank"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    const-string v3, "nofs"

    invoke-direct {p0, p1, v3}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    const/4 v2, -0x3

    goto :goto_16

    .line 481
    :cond_6a
    const/16 v3, 0x193

    if-ne v0, v3, :cond_93

    .line 482
    const-string v3, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doMountVolume :: path = "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",result = OperationFailedMediaCorrupt"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    const-string v3, "unmountable"

    invoke-direct {p0, p1, v3}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    const/4 v2, -0x4

    goto :goto_16

    .line 486
    :cond_93
    const-string v3, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doMountVolume :: path = "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",result = OperationFailedInternalError"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 487
    const/4 v2, -0x1

    goto/16 :goto_16
.end method

.method private doMountVolume(Ljava/lang/String;Ljava/lang/String;)I
    .registers 9
    .parameter "path"
    .parameter "with"

    .prologue
    const-string v5, "UsbStorageService"

    .line 500
    const-string v3, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doMountVolume :: path = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", with = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    const-string v3, "disk"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6a

    .line 503
    const/4 v0, 0x0

    .line 504
    .local v0, bMounted:Z
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    monitor-enter v3

    .line 505
    :try_start_30
    iget-object v4, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_62

    .line 506
    iget-object v4, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 507
    .local v1, iter:Ljava/util/Iterator;
    :cond_3e
    :goto_3e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_69

    .line 508
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/UsbStorageService$UsbStorageMap;

    .line 509
    .local v2, map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    iget-object v4, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3e

    iget-object v4, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->state:Ljava/lang/String;

    const-string v5, "mounted"

    if-eq v4, v5, :cond_3e

    .line 510
    iget-object v4, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/android/server/UsbStorageService;->doMountVolume(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_3e

    .line 511
    const/4 v0, 0x1

    goto :goto_3e

    .line 516
    .end local v1           #iter:Ljava/util/Iterator;
    .end local v2           #map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    :cond_62
    const-string v4, "UsbStorageService"

    const-string v5, "doMountVolume -> empty"

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    :cond_69
    monitor-exit v3

    .line 520
    .end local v0           #bMounted:Z
    :cond_6a
    const/4 v3, 0x0

    return v3

    .line 518
    .restart local v0       #bMounted:Z
    :catchall_6c
    move-exception v4

    monitor-exit v3
    :try_end_6e
    .catchall {:try_start_30 .. :try_end_6e} :catchall_6c

    throw v4
.end method

.method private doUnmountVolume(Ljava/lang/String;Z)I
    .registers 14
    .parameter "path"
    .parameter "force"

    .prologue
    const/16 v10, 0x194

    const/4 v5, 0x1

    const/4 v9, 0x0

    const-string v8, "UsbStorageService"

    .line 653
    const-string v3, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doUnmountVolume :: path = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", force = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 655
    invoke-virtual {p0, p1}, Lcom/android/server/UsbStorageService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "mounted"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_36

    move v3, v10

    .line 678
    :goto_35
    return v3

    .line 659
    :cond_36
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Runtime;->gc()V

    .line 661
    const/4 v2, 0x0

    .line 662
    .local v2, rc:I
    iput-boolean v5, p0, Lcom/android/server/UsbStorageService;->mSafeUnmountedUsbHost:Z

    .line 665
    :try_start_40
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;

    const-string v4, "volume unmount %s%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    if-eqz p2, :cond_61

    const-string v7, " force"

    :goto_4f
    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/server/NativeDaemonConnector;->doCommand(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 666
    const-string v3, "UsbStorageService"

    const-string v4, "doUnmountVolume :: result = OperationSucceeded"

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v9

    .line 667
    goto :goto_35

    .line 665
    :cond_61
    const-string v7, ""
    :try_end_63
    .catch Lcom/android/server/NativeDaemonConnectorException; {:try_start_40 .. :try_end_63} :catch_64

    goto :goto_4f

    .line 668
    :catch_64
    move-exception v3

    move-object v1, v3

    .line 669
    .local v1, e:Lcom/android/server/NativeDaemonConnectorException;
    invoke-virtual {v1}, Lcom/android/server/NativeDaemonConnectorException;->getCode()I

    move-result v0

    .line 670
    .local v0, code:I
    if-ne v0, v10, :cond_75

    .line 671
    const-string v3, "UsbStorageService"

    const-string v3, "doUnmountVolume :: result = OperationFailedStorageNotMounted"

    invoke-static {v8, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    const/4 v3, -0x5

    goto :goto_35

    .line 673
    :cond_75
    const/16 v3, 0x195

    if-ne v0, v3, :cond_82

    .line 674
    const-string v3, "UsbStorageService"

    const-string v3, "doUnmountVolume :: result = OperationFailedStorageBusy"

    invoke-static {v8, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 675
    const/4 v3, -0x7

    goto :goto_35

    .line 677
    :cond_82
    const-string v3, "UsbStorageService"

    const-string v3, "doUnmountVolume :: result = OperationFailedInternalError"

    invoke-static {v8, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 678
    const/4 v3, -0x1

    goto :goto_35
.end method

.method private notifyVolumeStateChange(Ljava/lang/String;Ljava/lang/String;II)V
    .registers 12
    .parameter "label"
    .parameter "path"
    .parameter "oldState"
    .parameter "newState"

    .prologue
    const-string v6, "file://"

    const-string v5, "UsbStorageService"

    .line 414
    const-string v2, "UsbStorageService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyVolumeStateChange :: path = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", oldState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p3}, Lcom/android/server/UsbStorageService;->printDebug(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", newState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p4}, Lcom/android/server/UsbStorageService;->printDebug(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    invoke-virtual {p0, p2}, Lcom/android/server/UsbStorageService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 417
    .local v1, vs:Ljava/lang/String;
    const/4 v0, 0x0

    .line 419
    .local v0, in:Landroid/content/Intent;
    const/4 v2, -0x1

    if-ne p4, v2, :cond_48

    .line 455
    :cond_40
    :goto_40
    if-eqz v0, :cond_47

    .line 456
    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 458
    :cond_47
    :goto_47
    return-void

    .line 420
    :cond_48
    if-nez p4, :cond_50

    .line 421
    const-string v2, "removed"

    invoke-direct {p0, p2, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_40

    .line 422
    :cond_50
    const/4 v2, 0x1

    if-ne p4, v2, :cond_96

    .line 423
    const-string v2, "bad_removal"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_40

    const-string v2, "nofs"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_40

    const-string v2, "unmountable"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_40

    .line 426
    const-string v2, "unmounted"

    invoke-direct {p0, p2, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    const-string v2, "UsbStorageService"

    const-string v2, "Sending intent :: ACTION_MEDIA_UNMOUNTED "

    invoke-static {v5, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    new-instance v0, Landroid/content/Intent;

    .end local v0           #in:Landroid/content/Intent;
    const-string v2, "android.intent.action.MEDIA_UNMOUNTED"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file://"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .restart local v0       #in:Landroid/content/Intent;
    goto :goto_40

    .line 430
    :cond_96
    const/4 v2, 0x2

    if-eq p4, v2, :cond_40

    .line 431
    const/4 v2, 0x3

    if-ne p4, v2, :cond_d9

    .line 432
    const-string v2, "checking"

    invoke-direct {p0, p2, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    const-string v2, "UsbStorageService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending intent :: ACTION_MEDIA_CHECKING : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    new-instance v0, Landroid/content/Intent;

    .end local v0           #in:Landroid/content/Intent;
    const-string v2, "android.intent.action.MEDIA_CHECKING"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file://"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .restart local v0       #in:Landroid/content/Intent;
    goto/16 :goto_40

    .line 435
    :cond_d9
    const/4 v2, 0x4

    if-ne p4, v2, :cond_11f

    .line 436
    const-string v2, "mounted"

    invoke-direct {p0, p2, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    new-instance v0, Landroid/content/Intent;

    .end local v0           #in:Landroid/content/Intent;
    const-string v2, "android.intent.action.MEDIA_MOUNTED"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file://"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 438
    .restart local v0       #in:Landroid/content/Intent;
    const-string v2, "read-only"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 439
    const-string v2, "UsbStorageService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending intent :: ACTION_MEDIA_MOUNTED : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_40

    .line 440
    :cond_11f
    const/4 v2, 0x5

    if-ne p4, v2, :cond_15a

    .line 441
    new-instance v0, Landroid/content/Intent;

    .end local v0           #in:Landroid/content/Intent;
    const-string v2, "android.intent.action.MEDIA_EJECT"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file://"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 442
    .restart local v0       #in:Landroid/content/Intent;
    const-string v2, "UsbStorageService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending intent :: ACTION_MEDIA_EJECT : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_40

    .line 443
    :cond_15a
    const/4 v2, 0x6

    if-eq p4, v2, :cond_40

    .line 444
    const/4 v2, 0x7

    if-ne p4, v2, :cond_18c

    .line 445
    const-string v2, "shared"

    invoke-direct {p0, p2, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    new-instance v0, Landroid/content/Intent;

    .end local v0           #in:Landroid/content/Intent;
    const-string v2, "android.intent.action.MEDIA_SHARED"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file://"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 447
    .restart local v0       #in:Landroid/content/Intent;
    const-string v2, "UsbStorageService"

    const-string v2, "Sending intent :: ACTION_MEDIA_SHARED"

    invoke-static {v5, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_40

    .line 448
    :cond_18c
    const/16 v2, 0x8

    if-ne p4, v2, :cond_199

    .line 449
    const-string v2, "UsbStorageService"

    const-string v2, "Live shared mounts not supported yet!"

    invoke-static {v5, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_47

    .line 452
    :cond_199
    const-string v2, "UsbStorageService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unhandled VolumeState {"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_40
.end method

.method private onEventInner(ILjava/lang/String;[Ljava/lang/String;)Z
    .registers 23
    .parameter "code"
    .parameter "raw"
    .parameter "cooked"

    .prologue
    .line 200
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 201
    .local v6, builder:Ljava/lang/StringBuilder;
    const-string v15, "onEvent::"

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, " raw= "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object v0, v15

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    if-eqz p3, :cond_4b

    .line 204
    const-string v15, " cooked = "

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    move-object/from16 v5, p3

    .local v5, arr$:[Ljava/lang/String;
    array-length v11, v5

    .local v11, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_2e
    if-ge v7, v11, :cond_4b

    aget-object v14, v5, v7

    .line 206
    .local v14, str:Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, " "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    add-int/lit8 v7, v7, 0x1

    goto :goto_2e

    .line 209
    .end local v5           #arr$:[Ljava/lang/String;
    .end local v7           #i$:I
    .end local v11           #len$:I
    .end local v14           #str:Ljava/lang/String;
    :cond_4b
    const-string v15, "UsbStorageService"

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    const/16 v15, 0x25d

    move/from16 v0, p1

    move v1, v15

    if-ne v0, v1, :cond_80

    .line 213
    const/4 v15, 0x2

    aget-object v15, p3, v15

    const/16 v16, 0x3

    aget-object v16, p3, v16

    const/16 v17, 0x7

    aget-object v17, p3, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    const/16 v18, 0xa

    aget-object v18, p3, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move-object v1, v15

    move-object/from16 v2, v16

    move/from16 v3, v17

    move/from16 v4, v18

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/UsbStorageService;->notifyVolumeStateChange(Ljava/lang/String;Ljava/lang/String;II)V

    .line 272
    :cond_7e
    :goto_7e
    const/4 v15, 0x1

    return v15

    .line 215
    :cond_80
    const/16 v15, 0x276

    move/from16 v0, p1

    move v1, v15

    if-ne v0, v1, :cond_9a

    .line 216
    const/4 v15, 0x2

    aget-object v10, p3, v15

    .line 217
    .local v10, label:Ljava/lang/String;
    const/4 v15, 0x3

    aget-object v13, p3, v15

    .line 219
    .local v13, path:Ljava/lang/String;
    new-instance v15, Lcom/android/server/UsbStorageService$4;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object v2, v13

    invoke-direct {v0, v1, v2}, Lcom/android/server/UsbStorageService$4;-><init>(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V

    invoke-virtual {v15}, Lcom/android/server/UsbStorageService$4;->start()V

    goto :goto_7e

    .line 230
    .end local v10           #label:Ljava/lang/String;
    .end local v13           #path:Ljava/lang/String;
    :cond_9a
    const/16 v15, 0x277

    move/from16 v0, p1

    move v1, v15

    if-ne v0, v1, :cond_18f

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    move-object v15, v0

    monitor-enter v15

    .line 232
    const/16 v16, 0x3

    :try_start_a9
    aget-object v10, p3, v16

    .line 233
    .restart local v10       #label:Ljava/lang/String;
    const/4 v8, 0x0

    .line 235
    .local v8, in:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashSet;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_18c

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 237
    .local v9, iter:Ljava/util/Iterator;
    :cond_c2
    :goto_c2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_18c

    .line 238
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/server/UsbStorageService$UsbStorageMap;

    .line 239
    .local v12, map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    move-object v0, v12

    iget-object v0, v0, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object v0, v10

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_c2

    .line 240
    move-object v0, v12

    iget-object v0, v0, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/server/UsbStorageService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v17, "bad_removal"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_c2

    .line 243
    move-object v0, v12

    iget-object v0, v0, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string v17, "unmounted"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    new-instance v8, Landroid/content/Intent;

    .end local v8           #in:Landroid/content/Intent;
    const-string v16, "android.intent.action.MEDIA_UNMOUNTED"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "file://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object v0, v12

    iget-object v0, v0, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v17

    move-object v0, v8

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 245
    .restart local v8       #in:Landroid/content/Intent;
    const-string v16, "UsbStorageService"

    const-string v17, "Sending intent :: ACTION_MEDIA_UNMOUNTED "

    invoke-static/range {v16 .. v17}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move-object v1, v8

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 248
    move-object v0, v12

    iget-object v0, v0, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string v17, "removed"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    const-string v16, "UsbStorageService"

    const-string v17, "Sending intent :: ACTION_MEDIA_REMOVED "

    invoke-static/range {v16 .. v17}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    new-instance v8, Landroid/content/Intent;

    .end local v8           #in:Landroid/content/Intent;
    const-string v16, "android.intent.action.MEDIA_REMOVED"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "file://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object v0, v12

    iget-object v0, v0, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v17

    move-object v0, v8

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 251
    .restart local v8       #in:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move-object v1, v8

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_c2

    .line 255
    .end local v8           #in:Landroid/content/Intent;
    .end local v9           #iter:Ljava/util/Iterator;
    .end local v10           #label:Ljava/lang/String;
    .end local v12           #map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    :catchall_189
    move-exception v16

    monitor-exit v15
    :try_end_18b
    .catchall {:try_start_a9 .. :try_end_18b} :catchall_189

    throw v16

    .restart local v8       #in:Landroid/content/Intent;
    .restart local v10       #label:Ljava/lang/String;
    :cond_18c
    :try_start_18c
    monitor-exit v15
    :try_end_18d
    .catchall {:try_start_18c .. :try_end_18d} :catchall_189

    goto/16 :goto_7e

    .line 257
    .end local v8           #in:Landroid/content/Intent;
    .end local v10           #label:Ljava/lang/String;
    :cond_18f
    const/16 v15, 0x278

    move/from16 v0, p1

    move v1, v15

    if-ne v0, v1, :cond_7e

    .line 258
    const/4 v8, 0x0

    .line 259
    .restart local v8       #in:Landroid/content/Intent;
    const/4 v15, 0x3

    aget-object v13, p3, v15

    .line 260
    .restart local v13       #path:Ljava/lang/String;
    const-string v15, "unmounted"

    move-object/from16 v0, p0

    move-object v1, v13

    move-object v2, v15

    invoke-direct {v0, v1, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    new-instance v8, Landroid/content/Intent;

    .end local v8           #in:Landroid/content/Intent;
    const-string v15, "android.intent.action.MEDIA_UNMOUNTED"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "file://"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    move-object v0, v8

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 262
    .restart local v8       #in:Landroid/content/Intent;
    const-string v15, "UsbStorageService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Sending intent :: ACTION_MEDIA_UNMOUNTED : "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService;->mContext:Landroid/content/Context;

    move-object v15, v0

    invoke-virtual {v15, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 265
    const-string v15, "bad_removal"

    move-object/from16 v0, p0

    move-object v1, v13

    move-object v2, v15

    invoke-direct {v0, v1, v2}, Lcom/android/server/UsbStorageService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    new-instance v8, Landroid/content/Intent;

    .end local v8           #in:Landroid/content/Intent;
    const-string v15, "android.intent.action.MEDIA_BAD_REMOVAL"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "file://"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    move-object v0, v8

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 267
    .restart local v8       #in:Landroid/content/Intent;
    const-string v15, "UsbStorageService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Sending intent :: ACTION_MEDIA_BAD_REMOVAL : "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService;->mContext:Landroid/content/Context;

    move-object v15, v0

    invoke-virtual {v15, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_7e
.end method

.method private final printDebug(I)Ljava/lang/String;
    .registers 4
    .parameter "state"

    .prologue
    .line 343
    const/4 v1, -0x1

    if-ne p1, v1, :cond_6

    .line 344
    const-string v0, "init"

    .line 367
    .local v0, ret:Ljava/lang/String;
    :goto_5
    return-object v0

    .line 345
    .end local v0           #ret:Ljava/lang/String;
    :cond_6
    if-nez p1, :cond_b

    .line 346
    const-string v0, "NoMedia"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 347
    .end local v0           #ret:Ljava/lang/String;
    :cond_b
    const/4 v1, 0x1

    if-ne p1, v1, :cond_11

    .line 348
    const-string v0, "Idle"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 349
    .end local v0           #ret:Ljava/lang/String;
    :cond_11
    const/4 v1, 0x2

    if-ne p1, v1, :cond_17

    .line 350
    const-string v0, "Pending"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 351
    .end local v0           #ret:Ljava/lang/String;
    :cond_17
    const/4 v1, 0x3

    if-ne p1, v1, :cond_1d

    .line 352
    const-string v0, "Checking"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 353
    .end local v0           #ret:Ljava/lang/String;
    :cond_1d
    const/4 v1, 0x4

    if-ne p1, v1, :cond_23

    .line 354
    const-string v0, "Mounted"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 355
    .end local v0           #ret:Ljava/lang/String;
    :cond_23
    const/4 v1, 0x5

    if-ne p1, v1, :cond_29

    .line 356
    const-string v0, "Unmounting"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 357
    .end local v0           #ret:Ljava/lang/String;
    :cond_29
    const/4 v1, 0x6

    if-ne p1, v1, :cond_2f

    .line 358
    const-string v0, "Formatting"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 359
    .end local v0           #ret:Ljava/lang/String;
    :cond_2f
    const/4 v1, 0x7

    if-ne p1, v1, :cond_35

    .line 360
    const-string v0, "Shared"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 361
    .end local v0           #ret:Ljava/lang/String;
    :cond_35
    const/16 v1, 0x8

    if-ne p1, v1, :cond_3c

    .line 362
    const-string v0, "SharedMnt"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5

    .line 364
    .end local v0           #ret:Ljava/lang/String;
    :cond_3c
    const-string v0, "unknown"

    .restart local v0       #ret:Ljava/lang/String;
    goto :goto_5
.end method

.method private final printState(I)Ljava/lang/String;
    .registers 6
    .parameter "state"

    .prologue
    const-string v3, "unmounted"

    const-string v2, "removed"

    const-string v1, "mounted"

    .line 322
    const/4 v0, -0x1

    if-ne p1, v0, :cond_d

    .line 323
    const-string v0, "unmounted"

    move-object v0, v3

    .line 337
    :goto_c
    return-object v0

    .line 324
    :cond_d
    if-nez p1, :cond_13

    .line 325
    const-string v0, "removed"

    move-object v0, v2

    goto :goto_c

    .line 326
    :cond_13
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1a

    .line 327
    const-string v0, "unmounted"

    move-object v0, v3

    goto :goto_c

    .line 328
    :cond_1a
    const/4 v0, 0x2

    if-ne p1, v0, :cond_20

    .line 329
    const-string v0, "pending"

    goto :goto_c

    .line 330
    :cond_20
    const/4 v0, 0x3

    if-ne p1, v0, :cond_26

    .line 331
    const-string v0, "checking"

    goto :goto_c

    .line 332
    :cond_26
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2d

    .line 333
    const-string v0, "mounted"

    move-object v0, v1

    goto :goto_c

    .line 334
    :cond_2d
    const/4 v0, 0x5

    if-ne p1, v0, :cond_34

    .line 335
    const-string v0, "mounted"

    move-object v0, v1

    goto :goto_c

    .line 337
    :cond_34
    const-string v0, "removed"

    move-object v0, v2

    goto :goto_c
.end method

.method private updatePartitionsList(Ljava/lang/String;)V
    .registers 16
    .parameter "label"

    .prologue
    .line 277
    const-string v10, "UsbStorageService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updatePartitionsList :: label = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    :try_start_18
    iget-object v10, p0, Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;

    const-string v11, "volume list parti %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object p1, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0x6e

    invoke-virtual {v10, v11, v12}, Lcom/android/server/NativeDaemonConnector;->doListCommand(Ljava/lang/String;I)[Ljava/lang/String;
    :try_end_2b
    .catch Lcom/android/server/NativeDaemonConnectorException; {:try_start_18 .. :try_end_2b} :catch_a0

    move-result-object v0

    .line 290
    .local v0, Partitions:[Ljava/lang/String;
    iget-object v10, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    monitor-enter v10

    .line 291
    :try_start_2f
    iget-object v11, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v11}, Ljava/util/HashSet;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_4e

    .line 292
    iget-object v11, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    new-instance v12, Lcom/android/server/UsbStorageService$UsbStorageMap;

    invoke-direct {v12, p0, p1}, Lcom/android/server/UsbStorageService$UsbStorageMap;-><init>(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4e

    .line 293
    iget-object v11, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    new-instance v12, Lcom/android/server/UsbStorageService$UsbStorageMap;

    invoke-direct {v12, p0, p1}, Lcom/android/server/UsbStorageService$UsbStorageMap;-><init>(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 296
    :cond_4e
    monitor-exit v10
    :try_end_4f
    .catchall {:try_start_2f .. :try_end_4f} :catchall_bb

    .line 301
    move-object v1, v0

    .local v1, arr$:[Ljava/lang/String;
    :try_start_50
    array-length v4, v1

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_52
    if-ge v3, v4, :cond_db

    aget-object v9, v1, v3

    .line 302
    .local v9, volstr:Ljava/lang/String;
    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 303
    .local v8, tok:[Ljava/lang/String;
    const-string v10, "UsbStorageService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updatePartitionsList :: string = \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    const/4 v10, 0x0

    aget-object v5, v8, v10

    .line 305
    .local v5, mountpoint:Ljava/lang/String;
    const/4 v10, 0x1

    aget-object v10, v8, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 306
    .local v7, st:I
    const/4 v10, 0x2

    aget-object v10, v8, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 308
    .local v6, num:I
    iget-object v10, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    monitor-enter v10
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_8e} :catch_c1

    .line 309
    :try_start_8e
    iget-object v11, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    new-instance v12, Lcom/android/server/UsbStorageService$UsbStorageMap;

    invoke-direct {p0, v7}, Lcom/android/server/UsbStorageService;->printState(I)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, p0, p1, v5, v13}, Lcom/android/server/UsbStorageService$UsbStorageMap;-><init>(Lcom/android/server/UsbStorageService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 310
    monitor-exit v10
    :try_end_9d
    .catchall {:try_start_8e .. :try_end_9d} :catchall_be

    .line 301
    add-int/lit8 v3, v3, 0x1

    goto :goto_52

    .line 283
    .end local v0           #Partitions:[Ljava/lang/String;
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #mountpoint:Ljava/lang/String;
    .end local v6           #num:I
    .end local v7           #st:I
    .end local v8           #tok:[Ljava/lang/String;
    .end local v9           #volstr:Ljava/lang/String;
    :catch_a0
    move-exception v10

    move-object v2, v10

    .line 284
    .local v2, e:Lcom/android/server/NativeDaemonConnectorException;
    const-string v10, "UsbStorageService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updatePartitionsList :: NativeDaemonConnectorException "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    .end local v2           #e:Lcom/android/server/NativeDaemonConnectorException;
    :goto_ba
    return-void

    .line 296
    .restart local v0       #Partitions:[Ljava/lang/String;
    :catchall_bb
    move-exception v11

    :try_start_bc
    monitor-exit v10
    :try_end_bd
    .catchall {:try_start_bc .. :try_end_bd} :catchall_bb

    throw v11

    .line 310
    .restart local v1       #arr$:[Ljava/lang/String;
    .restart local v3       #i$:I
    .restart local v4       #len$:I
    .restart local v5       #mountpoint:Ljava/lang/String;
    .restart local v6       #num:I
    .restart local v7       #st:I
    .restart local v8       #tok:[Ljava/lang/String;
    .restart local v9       #volstr:Ljava/lang/String;
    :catchall_be
    move-exception v11

    :try_start_bf
    monitor-exit v10
    :try_end_c0
    .catchall {:try_start_bf .. :try_end_c0} :catchall_be

    :try_start_c0
    throw v11
    :try_end_c1
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_c1} :catch_c1

    .line 312
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #mountpoint:Ljava/lang/String;
    .end local v6           #num:I
    .end local v7           #st:I
    .end local v8           #tok:[Ljava/lang/String;
    .end local v9           #volstr:Ljava/lang/String;
    :catch_c1
    move-exception v10

    move-object v2, v10

    .line 313
    .local v2, e:Ljava/lang/Exception;
    const-string v10, "UsbStorageService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updatePartitionsList ::  "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .end local v2           #e:Ljava/lang/Exception;
    :cond_db
    const-string v10, "i"

    invoke-direct {p0, v10}, Lcom/android/server/UsbStorageService;->debugUsbStorageMap(Ljava/lang/String;)V

    goto :goto_ba
.end method

.method private updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V
    .registers 16
    .parameter "path"
    .parameter "state"

    .prologue
    const/4 v12, 0x1

    const-string v10, ", state = "

    const-string v11, "UsbStorageService"

    .line 371
    const-string v8, "UsbStorageService"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updatePublicVolumeState :: path = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", state = "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v11, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    const/4 v0, 0x0

    .line 373
    .local v0, bFound:Z
    move-object v6, p2

    .line 375
    .local v6, oldState:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v8}, Ljava/util/HashSet;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_50

    .line 376
    iget-object v8, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v8}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 377
    .local v4, iter:Ljava/util/Iterator;
    :cond_37
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_50

    .line 378
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/UsbStorageService$UsbStorageMap;

    .line 379
    .local v5, map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    iget-object v8, v5, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_37

    .line 380
    const/4 v0, 0x1

    .line 381
    iget-object v6, v5, Lcom/android/server/UsbStorageService$UsbStorageMap;->state:Ljava/lang/String;

    .line 382
    iput-object p2, v5, Lcom/android/server/UsbStorageService$UsbStorageMap;->state:Ljava/lang/String;

    .line 388
    .end local v4           #iter:Ljava/util/Iterator;
    .end local v5           #map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    :cond_50
    if-eqz v0, :cond_af

    .line 389
    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6f

    .line 390
    const-string v8, "UsbStorageService"

    const-string v8, "Duplicate state transition (%s -> %s) and path is %s"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v6, v9, v10

    aput-object p2, v9, v12

    const/4 v10, 0x2

    aput-object p1, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v11, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    :goto_6e
    return-void

    .line 394
    :cond_6f
    iget-object v8, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    monitor-enter v8

    .line 395
    :try_start_72
    iget-object v9, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    sub-int v3, v9, v12

    .local v3, i:I
    :goto_7a
    if-ltz v3, :cond_a8

    .line 396
    iget-object v9, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    :try_end_84
    .catchall {:try_start_72 .. :try_end_84} :catchall_9b

    .line 398
    .local v1, bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    :try_start_84
    iget-object v9, v1, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;->mListener:Landroid/os/storage/IUsbStorageServiceListener;

    invoke-interface {v9, p1, v6, p2}, Landroid/os/storage/IUsbStorageServiceListener;->onUsbStorageStateChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_89
    .catchall {:try_start_84 .. :try_end_89} :catchall_9b
    .catch Landroid/os/RemoteException; {:try_start_84 .. :try_end_89} :catch_8c
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_89} :catch_9e

    .line 395
    :goto_89
    add-int/lit8 v3, v3, -0x1

    goto :goto_7a

    .line 399
    :catch_8c
    move-exception v9

    move-object v7, v9

    .line 400
    .local v7, rex:Landroid/os/RemoteException;
    :try_start_8e
    const-string v9, "UsbStorageService"

    const-string v10, "Listener dead"

    invoke-static {v9, v10}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    iget-object v9, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_89

    .line 406
    .end local v1           #bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    .end local v3           #i:I
    .end local v7           #rex:Landroid/os/RemoteException;
    :catchall_9b
    move-exception v9

    monitor-exit v8
    :try_end_9d
    .catchall {:try_start_8e .. :try_end_9d} :catchall_9b

    throw v9

    .line 402
    .restart local v1       #bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    .restart local v3       #i:I
    :catch_9e
    move-exception v9

    move-object v2, v9

    .line 403
    .local v2, ex:Ljava/lang/Exception;
    :try_start_a0
    const-string v9, "UsbStorageService"

    const-string v10, "Listener failed"

    invoke-static {v9, v10, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_89

    .line 406
    .end local v1           #bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    .end local v2           #ex:Ljava/lang/Exception;
    :cond_a8
    monitor-exit v8
    :try_end_a9
    .catchall {:try_start_a0 .. :try_end_a9} :catchall_9b

    .line 410
    .end local v3           #i:I
    :goto_a9
    const-string v8, "u"

    invoke-direct {p0, v8}, Lcom/android/server/UsbStorageService;->debugUsbStorageMap(Ljava/lang/String;)V

    goto :goto_6e

    .line 408
    :cond_af
    const-string v8, "UsbStorageService"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updatePublicVolumeState :: Can\'t find path = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", state = "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v11, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a9
.end method

.method private validatePermission(Ljava/lang/String;)V
    .registers 6
    .parameter "perm"

    .prologue
    .line 573
    iget-object v0, p0, Lcom/android/server/UsbStorageService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1a

    .line 574
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Requires %s permission"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 576
    :cond_1a
    return-void
.end method

.method private waitForReady()V
    .registers 4

    .prologue
    .line 96
    :goto_0
    iget-boolean v1, p0, Lcom/android/server/UsbStorageService;->mReady:Z

    if-nez v1, :cond_b

    .line 97
    const/4 v0, 0x5

    .local v0, retries:I
    :goto_5
    if-lez v0, :cond_14

    .line 98
    iget-boolean v1, p0, Lcom/android/server/UsbStorageService;->mReady:Z

    if-eqz v1, :cond_c

    .line 105
    .end local v0           #retries:I
    :cond_b
    return-void

    .line 101
    .restart local v0       #retries:I
    :cond_c
    const-wide/16 v1, 0x3e8

    invoke-static {v1, v2}, Landroid/os/SystemClock;->sleep(J)V

    .line 97
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    .line 103
    :cond_14
    const-string v1, "UsbStorageService"

    const-string v2, "waitForReady :: Waiting too long for mReady!"

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public formatVolume(Ljava/lang/String;)I
    .registers 5
    .parameter "path"

    .prologue
    .line 705
    const-string v0, "UsbStorageService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " :::: formatVolume :: path = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    const-string v0, "android.permission.MOUNT_FORMAT_FILESYSTEMS"

    invoke-direct {p0, v0}, Lcom/android/server/UsbStorageService;->validatePermission(Ljava/lang/String;)V

    .line 707
    invoke-direct {p0}, Lcom/android/server/UsbStorageService;->waitForReady()V

    .line 709
    const/4 v0, 0x0

    return v0
.end method

.method public getShowSafeUnmountNotification()Z
    .registers 4

    .prologue
    .line 756
    const-string v0, "UsbStorageService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getShowSafeUnmountNotification :: mSafeUnmountedUsbHost = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/UsbStorageService;->mSafeUnmountedUsbHost:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 758
    iget-boolean v0, p0, Lcom/android/server/UsbStorageService;->mSafeUnmountedUsbHost:Z

    return v0
.end method

.method public getVolumeState(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .parameter "mountPoint"

    .prologue
    .line 621
    const-string v3, "removed"

    .line 622
    .local v3, state:Ljava/lang/String;
    const/4 v0, 0x0

    .line 623
    .local v0, bFound:Z
    iget-object v4, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_29

    .line 624
    iget-object v4, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 625
    .local v1, iter:Ljava/util/Iterator;
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    .line 626
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/UsbStorageService$UsbStorageMap;

    .line 627
    .local v2, map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    iget-object v4, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 628
    const/4 v0, 0x1

    .line 629
    iget-object v4, v2, Lcom/android/server/UsbStorageService$UsbStorageMap;->state:Ljava/lang/String;

    .line 636
    .end local v1           #iter:Ljava/util/Iterator;
    .end local v2           #map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    :goto_28
    return-object v4

    .line 634
    :cond_29
    if-nez v0, :cond_43

    const-string v4, "UsbStorageService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getVolumeState :: Can\'t find path = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 635
    :cond_43
    if-nez v0, :cond_4b

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    :cond_4b
    move-object v4, v3

    .line 636
    goto :goto_28
.end method

.method public isUsbStorageConnected()Z
    .registers 14

    .prologue
    const/4 v12, 0x2

    const/4 v9, 0x1

    const/4 v10, 0x0

    const-string v11, "UsbStorageService"

    .line 717
    :try_start_5
    iget-object v7, p0, Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;

    const-string v8, "volume connected"

    invoke-virtual {v7, v8}, Lcom/android/server/NativeDaemonConnector;->doCommand(Ljava/lang/String;)Ljava/util/ArrayList;
    :try_end_c
    .catch Lcom/android/server/NativeDaemonConnectorException; {:try_start_5 .. :try_end_c} :catch_2f

    move-result-object v5

    .line 723
    .local v5, rsp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 724
    .local v3, line:Ljava/lang/String;
    const-string v7, " "

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 725
    .local v6, tok:[Ljava/lang/String;
    array-length v7, v6

    if-ge v7, v12, :cond_3a

    .line 726
    const-string v7, "UsbStorageService"

    const-string v7, "Malformed response to volume connected"

    invoke-static {v11, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v10

    .line 751
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #line:Ljava/lang/String;
    .end local v5           #rsp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6           #tok:[Ljava/lang/String;
    :goto_2e
    return v7

    .line 718
    :catch_2f
    move-exception v7

    move-object v1, v7

    .line 719
    .local v1, ex:Lcom/android/server/NativeDaemonConnectorException;
    const-string v7, "UsbStorageService"

    const-string v7, "Failed to read response to volume connected"

    invoke-static {v11, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v10

    .line 720
    goto :goto_2e

    .line 732
    .end local v1           #ex:Lcom/android/server/NativeDaemonConnectorException;
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v3       #line:Ljava/lang/String;
    .restart local v5       #rsp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v6       #tok:[Ljava/lang/String;
    :cond_3a
    const/4 v7, 0x0

    :try_start_3b
    aget-object v7, v6, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_40
    .catch Ljava/lang/NumberFormatException; {:try_start_3b .. :try_end_40} :catch_58

    move-result v0

    .line 738
    .local v0, code:I
    const/16 v7, 0xd8

    if-ne v0, v7, :cond_76

    .line 739
    const-string v7, "enabled"

    aget-object v8, v6, v12

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6d

    .line 740
    const-string v7, "UsbStorageService"

    const-string v7, " :::: isUsbStorageConnected :: result = true"

    invoke-static {v11, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v9

    .line 741
    goto :goto_2e

    .line 733
    .end local v0           #code:I
    :catch_58
    move-exception v7

    move-object v4, v7

    .line 734
    .local v4, nfe:Ljava/lang/NumberFormatException;
    const-string v7, "UsbStorageService"

    const-string v7, "isUsbStorageConnected :: Error parsing code %s"

    new-array v8, v9, [Ljava/lang/Object;

    aget-object v9, v6, v10

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v10

    .line 735
    goto :goto_2e

    .line 743
    .end local v4           #nfe:Ljava/lang/NumberFormatException;
    .restart local v0       #code:I
    :cond_6d
    const-string v7, "UsbStorageService"

    const-string v7, " :::: isUsbStorageConnected :: result = false"

    invoke-static {v11, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v10

    .line 744
    goto :goto_2e

    .line 746
    :cond_76
    const-string v7, "UsbStorageService"

    const-string v7, "isUsbStorageConnected :: Unexpected response code %d"

    new-array v8, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v10

    .line 747
    goto :goto_2e

    .line 750
    .end local v0           #code:I
    .end local v3           #line:Ljava/lang/String;
    .end local v6           #tok:[Ljava/lang/String;
    :cond_8b
    const-string v7, "UsbStorageService"

    const-string v7, "isUsbStorageConnected :: Got an empty response"

    invoke-static {v11, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v10

    .line 751
    goto :goto_2e
.end method

.method public mountVolume(Ljava/lang/String;)I
    .registers 5
    .parameter "path"

    .prologue
    const-string v2, "UsbStorageService"

    .line 640
    const-string v0, "UsbStorageService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " :::: mountVolume :: path = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 641
    const-string v0, "android.permission.MOUNT_UNMOUNT_FILESYSTEMS"

    invoke-direct {p0, v0}, Lcom/android/server/UsbStorageService;->validatePermission(Ljava/lang/String;)V

    .line 643
    invoke-direct {p0}, Lcom/android/server/UsbStorageService;->waitForReady()V

    .line 645
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectoryUsbHost()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_35

    .line 646
    const-string v0, "UsbStorageService"

    const-string v0, "mountVolume -> first SD card is not ready. "

    invoke-static {v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 647
    const/4 v0, -0x6

    .line 649
    :goto_34
    return v0

    :cond_35
    invoke-direct {p0, p1}, Lcom/android/server/UsbStorageService;->doMountVolume(Ljava/lang/String;)I

    move-result v0

    goto :goto_34
.end method

.method public onDaemonConnected()V
    .registers 3

    .prologue
    .line 108
    const-string v0, "UsbStorageService"

    const-string v1, "onDaemonConnected ::"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    new-instance v0, Lcom/android/server/UsbStorageService$1;

    invoke-direct {v0, p0}, Lcom/android/server/UsbStorageService$1;-><init>(Lcom/android/server/UsbStorageService;)V

    invoke-virtual {v0}, Lcom/android/server/UsbStorageService$1;->start()V

    .line 115
    return-void
.end method

.method public onEvent(ILjava/lang/String;[Ljava/lang/String;)Z
    .registers 6
    .parameter "code"
    .parameter "raw"
    .parameter "cooked"

    .prologue
    .line 190
    iget-object v0, p0, Lcom/android/server/UsbStorageService;->mWorkQueueHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/UsbStorageService$3;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/server/UsbStorageService$3;-><init>(Lcom/android/server/UsbStorageService;ILjava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 195
    const/4 v0, 0x1

    return v0
.end method

.method public registerListener(Landroid/os/storage/IUsbStorageServiceListener;)V
    .registers 7
    .parameter "listener"

    .prologue
    .line 579
    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    monitor-enter v2

    .line 580
    :try_start_3
    new-instance v0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;

    invoke-direct {v0, p0, p1}, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;-><init>(Lcom/android/server/UsbStorageService;Landroid/os/storage/IUsbStorageServiceListener;)V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_21

    .line 582
    .local v0, bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    :try_start_8
    invoke-interface {p1}, Landroid/os/storage/IUsbStorageServiceListener;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 583
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_21
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_15} :catch_17

    .line 587
    :goto_15
    :try_start_15
    monitor-exit v2

    .line 588
    return-void

    .line 584
    :catch_17
    move-exception v3

    move-object v1, v3

    .line 585
    .local v1, rex:Landroid/os/RemoteException;
    const-string v3, "UsbStorageService"

    const-string v4, "Failed to link to listener death"

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 587
    .end local v0           #bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    .end local v1           #rex:Landroid/os/RemoteException;
    :catchall_21
    move-exception v3

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_21

    throw v3
.end method

.method public setShowSafeUnmountNotification(Z)V
    .registers 5
    .parameter "set"

    .prologue
    .line 762
    const-string v0, "UsbStorageService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setShowSafeUnmountNotification :: set = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    iput-boolean p1, p0, Lcom/android/server/UsbStorageService;->mSafeUnmountedUsbHost:Z

    .line 764
    return-void
.end method

.method public unmountVolume(Ljava/lang/String;Z)V
    .registers 6
    .parameter "path"
    .parameter "force"

    .prologue
    .line 684
    const-string v0, "UsbStorageService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " :::: unmountVolume :: path = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", force = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    const-string v0, "android.permission.MOUNT_UNMOUNT_FILESYSTEMS"

    invoke-direct {p0, v0}, Lcom/android/server/UsbStorageService;->validatePermission(Ljava/lang/String;)V

    .line 686
    invoke-direct {p0}, Lcom/android/server/UsbStorageService;->waitForReady()V

    .line 688
    invoke-direct {p0, p1, p2}, Lcom/android/server/UsbStorageService;->doUnmountVolume(Ljava/lang/String;Z)I

    .line 689
    return-void
.end method

.method public unmountVolume(Z)V
    .registers 7
    .parameter "force"

    .prologue
    .line 692
    const-string v2, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " :::: unmountVolume :: force = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 693
    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    monitor-enter v2

    .line 694
    :try_start_1b
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3e

    .line 695
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mUsbStorageSet:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 696
    .local v0, iter:Ljava/util/Iterator;
    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 697
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/UsbStorageService$UsbStorageMap;

    .line 698
    .local v1, map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    iget-object v3, v1, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    invoke-virtual {p0, v3, p1}, Lcom/android/server/UsbStorageService;->unmountVolume(Ljava/lang/String;Z)V

    goto :goto_29

    .line 701
    .end local v0           #iter:Ljava/util/Iterator;
    .end local v1           #map:Lcom/android/server/UsbStorageService$UsbStorageMap;
    :catchall_3b
    move-exception v3

    monitor-exit v2
    :try_end_3d
    .catchall {:try_start_1b .. :try_end_3d} :catchall_3b

    throw v3

    :cond_3e
    :try_start_3e
    monitor-exit v2
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_3b

    .line 702
    return-void
.end method

.method public unregisterListener(Landroid/os/storage/IUsbStorageServiceListener;)V
    .registers 7
    .parameter "listener"

    .prologue
    .line 591
    iget-object v2, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    monitor-enter v2

    .line 592
    :try_start_3
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;

    .line 593
    .local v0, bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    iget-object v3, v0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;->mListener:Landroid/os/storage/IUsbStorageServiceListener;

    if-ne v3, p1, :cond_9

    .line 594
    iget-object v3, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 595
    monitor-exit v2

    .line 599
    .end local v0           #bl:Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
    :goto_25
    return-void

    .line 598
    :cond_26
    monitor-exit v2

    goto :goto_25

    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_28
    move-exception v3

    monitor-exit v2
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw v3
.end method
