.class Lcom/android/server/ConnectivityService$ConnectivityThread;
.super Ljava/lang/Thread;
.source "ConnectivityService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ConnectivityService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConnectivityThread"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "context"

    .prologue
    .line 234
    const-string v0, "ConnectivityThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 235
    iput-object p1, p0, Lcom/android/server/ConnectivityService$ConnectivityThread;->mContext:Landroid/content/Context;

    .line 236
    return-void
.end method

.method public static getServiceInstance(Landroid/content/Context;)Lcom/android/server/ConnectivityService;
    .registers 5
    .parameter "context"

    .prologue
    .line 249
    new-instance v1, Lcom/android/server/ConnectivityService$ConnectivityThread;

    invoke-direct {v1, p0}, Lcom/android/server/ConnectivityService$ConnectivityThread;-><init>(Landroid/content/Context;)V

    .line 250
    .local v1, thread:Lcom/android/server/ConnectivityService$ConnectivityThread;
    invoke-virtual {v1}, Lcom/android/server/ConnectivityService$ConnectivityThread;->start()V

    .line 252
    monitor-enter v1

    .line 253
    :goto_9
    :try_start_9
    invoke-static {}, Lcom/android/server/ConnectivityService;->access$000()Lcom/android/server/ConnectivityService;
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_1c

    move-result-object v2

    if-nez v2, :cond_1f

    .line 256
    :try_start_f
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_12
    .catchall {:try_start_f .. :try_end_12} :catchall_1c
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_12} :catch_13

    goto :goto_9

    .line 257
    :catch_13
    move-exception v0

    .line 258
    .local v0, ignore:Ljava/lang/InterruptedException;
    :try_start_14
    const-string v2, "ConnectivityService"

    const-string v3, "Unexpected InterruptedException while waiting for ConnectivityService thread"

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 263
    .end local v0           #ignore:Ljava/lang/InterruptedException;
    :catchall_1c
    move-exception v2

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_14 .. :try_end_1e} :catchall_1c

    throw v2

    :cond_1f
    :try_start_1f
    monitor-exit v1
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1c

    .line 265
    invoke-static {}, Lcom/android/server/ConnectivityService;->access$000()Lcom/android/server/ConnectivityService;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 240
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 241
    monitor-enter p0

    .line 242
    :try_start_4
    new-instance v0, Lcom/android/server/ConnectivityService;

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Lcom/android/server/ConnectivityService$1;)V

    invoke-static {v0}, Lcom/android/server/ConnectivityService;->access$002(Lcom/android/server/ConnectivityService;)Lcom/android/server/ConnectivityService;

    .line 243
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 244
    monitor-exit p0
    :try_end_13
    .catchall {:try_start_4 .. :try_end_13} :catchall_17

    .line 245
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 246
    return-void

    .line 244
    :catchall_17
    move-exception v0

    :try_start_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v0
.end method
