.class Lcom/android/server/WimaxService$WimaxHandler;
.super Landroid/os/Handler;
.source "WimaxService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WimaxService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WimaxHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WimaxService;


# direct methods
.method public constructor <init>(Lcom/android/server/WimaxService;Landroid/os/Looper;)V
    .registers 3
    .parameter
    .parameter "looper"

    .prologue
    .line 1304
    iput-object p1, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    .line 1305
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1306
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 7
    .parameter "msg"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const-string v2, "WimaxService"

    .line 1310
    const-string v0, "WimaxService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "+ Received "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1311
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_a2

    .line 1337
    :goto_21
    :pswitch_21
    return-void

    .line 1313
    :pswitch_22
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    iget-object v1, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    #calls: Lcom/android/server/WimaxService;->getEnableLog()Z
    invoke-static {v1}, Lcom/android/server/WimaxService;->access$1300(Lcom/android/server/WimaxService;)Z

    move-result v1

    #setter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v0, v1}, Lcom/android/server/WimaxService;->access$802(Lcom/android/server/WimaxService;Z)Z

    .line 1314
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v0}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v1}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/net/wimax/WimaxStateTracker;->setEnableLog(Z)V

    .line 1315
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v0}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v0

    if-eqz v0, :cond_4b

    const-string v0, "WimaxService"

    const-string v0, "MESSAGE_ENABLE_WIMAX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1316
    :cond_4b
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    iget v1, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v3, :cond_58

    move v1, v3

    :goto_52
    iget v2, p1, Landroid/os/Message;->arg2:I

    #calls: Lcom/android/server/WimaxService;->setWimaxEnabledBlocking(ZZI)Z
    invoke-static {v0, v3, v1, v2}, Lcom/android/server/WimaxService;->access$700(Lcom/android/server/WimaxService;ZZI)Z

    goto :goto_21

    :cond_58
    move v1, v4

    goto :goto_52

    .line 1321
    :pswitch_5a
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    iget v1, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v3, :cond_6c

    move v1, v3

    :goto_61
    iget v2, p1, Landroid/os/Message;->arg2:I

    #calls: Lcom/android/server/WimaxService;->setWimaxEnabledBlocking(ZZI)Z
    invoke-static {v0, v4, v1, v2}, Lcom/android/server/WimaxService;->access$700(Lcom/android/server/WimaxService;ZZI)Z

    .line 1322
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v0}, Lcom/android/server/WimaxService;->release_sWakeLock()V

    goto :goto_21

    :cond_6c
    move v1, v4

    .line 1321
    goto :goto_61

    .line 1325
    :pswitch_6e
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v0}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wimax/WimaxStateTracker;->disconnectAndStop()Z

    goto :goto_21

    .line 1329
    :pswitch_78
    invoke-static {}, Lcom/android/server/WimaxService;->access$200()Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    monitor-enter v0

    .line 1330
    :try_start_7d
    invoke-static {}, Lcom/android/server/WimaxService;->access$200()Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_9d

    .line 1331
    iget-object v1, p0, Lcom/android/server/WimaxService$WimaxHandler;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v1}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v1

    if-eqz v1, :cond_96

    const-string v1, "WimaxService"

    const-string v2, "release sDriverStopWakeLock----------------------"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1332
    :cond_96
    invoke-static {}, Lcom/android/server/WimaxService;->access$200()Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1334
    :cond_9d
    monitor-exit v0

    goto :goto_21

    :catchall_9f
    move-exception v1

    monitor-exit v0
    :try_end_a1
    .catchall {:try_start_7d .. :try_end_a1} :catchall_9f

    throw v1

    .line 1311
    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_22
        :pswitch_5a
        :pswitch_6e
        :pswitch_21
        :pswitch_78
    .end packed-switch
.end method
