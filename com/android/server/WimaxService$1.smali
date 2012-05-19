.class Lcom/android/server/WimaxService$1;
.super Ljava/lang/Object;
.source "WimaxService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/WimaxService;-><init>(Landroid/content/Context;Landroid/net/wimax/WimaxStateTracker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WimaxService;


# direct methods
.method constructor <init>(Lcom/android/server/WimaxService;)V
    .registers 2
    .parameter

    .prologue
    .line 213
    iput-object p1, p0, Lcom/android/server/WimaxService$1;->this$0:Lcom/android/server/WimaxService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 215
    iget-object v0, p0, Lcom/android/server/WimaxService$1;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxHandler:Lcom/android/server/WimaxService$WimaxHandler;
    invoke-static {v0}, Lcom/android/server/WimaxService;->access$100(Lcom/android/server/WimaxService;)Lcom/android/server/WimaxService$WimaxHandler;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/server/WimaxService$WimaxHandler;->removeMessages(I)V

    .line 216
    invoke-static {}, Lcom/android/server/WimaxService;->access$200()Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    monitor-enter v0

    .line 217
    :try_start_f
    invoke-static {}, Lcom/android/server/WimaxService;->access$200()Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_27

    .line 218
    const-string v1, "WimaxService"

    const-string v2, "[setReleaseWakeLockCallback] sDriverStopWakeLock.release()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    invoke-static {}, Lcom/android/server/WimaxService;->access$200()Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 221
    :cond_27
    monitor-exit v0

    .line 222
    return-void

    .line 221
    :catchall_29
    move-exception v1

    monitor-exit v0
    :try_end_2b
    .catchall {:try_start_f .. :try_end_2b} :catchall_29

    throw v1
.end method
