.class Lcom/android/server/WimaxService$4;
.super Landroid/telephony/PhoneStateListener;
.source "WimaxService.java"


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
    .line 259
    iput-object p1, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .registers 12
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x0

    const-string v6, "WimaxService"

    .line 261
    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onCallStateChanged : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    iput p1, v4, Lcom/android/server/WimaxService;->m_nCallState:I

    .line 263
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v1

    .line 265
    .local v1, nWimaxMode:I
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v2

    .line 266
    .local v2, wimaxState:Landroid/net/wimax/WimaxState;
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v3

    .line 268
    .local v3, wimaxStatus:I
    if-ne p1, v8, :cond_5c

    .line 269
    if-eq v1, v8, :cond_39

    const/4 v4, 0x4

    if-ne v1, v4, :cond_5b

    .line 270
    :cond_39
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/net/wimax/WimaxStateTracker;->SetNoBackOff(Z)V

    .line 271
    sget-object v4, Landroid/net/wimax/WimaxState;->CONNECTING:Landroid/net/wimax/WimaxState;

    if-eq v2, v4, :cond_4f

    sget-object v4, Landroid/net/wimax/WimaxState;->OBTAINING_IPADDR:Landroid/net/wimax/WimaxState;

    if-eq v2, v4, :cond_4f

    sget-object v4, Landroid/net/wimax/WimaxState;->CONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v2, v4, :cond_5b

    .line 273
    :cond_4f
    const-string v4, "WimaxService"

    const-string v4, "CALL_STATE_OFFHOOK, disconnect"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->disconnect()Z

    .line 285
    :cond_5b
    :goto_5b
    return-void

    .line 277
    :cond_5c
    if-nez p1, :cond_5b

    .line 278
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->getNoBackoff()Z

    move-result v0

    .line 279
    .local v0, bNoBackOff:Z
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/net/wimax/WimaxStateTracker;->SetNoBackOff(Z)V

    .line 280
    sget-object v4, Landroid/net/wimax/WimaxState;->DISCONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v2, v4, :cond_5b

    const/4 v4, 0x3

    if-ne v3, v4, :cond_5b

    if-eqz v0, :cond_5b

    .line 281
    const-string v4, "WimaxService"

    const-string v4, "CALL_STATE_IDLE, reconnect as normal mode"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    iget-object v4, p0, Lcom/android/server/WimaxService$4;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7}, Lcom/android/server/WimaxService;->startScan(Z)Z

    goto :goto_5b
.end method
