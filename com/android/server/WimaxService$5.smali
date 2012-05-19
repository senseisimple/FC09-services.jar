.class Lcom/android/server/WimaxService$5;
.super Landroid/content/BroadcastReceiver;
.source "WimaxService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WimaxService;
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
    .line 977
    iput-object p1, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 14
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    const-string v6, "WimaxService"

    .line 980
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 987
    .local v0, action:Ljava/lang/String;
    const-string v4, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 988
    const-string v4, "WimaxService"

    const-string v4, "ACTION_SCREEN_ON"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 990
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/net/wimax/WimaxStateTracker;->SetScreenOff(Z)V

    .line 993
    invoke-static {}, Landroid/net/wimax/WimaxNative;->getLinkState()Z

    .line 1186
    :cond_25
    :goto_25
    return-void

    .line 995
    :cond_26
    const-string v4, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 996
    const-string v4, "WimaxService"

    const-string v4, "ACTION_SCREEN_OFF"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 997
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/net/wimax/WimaxStateTracker;->SetScreenOff(Z)V

    goto :goto_25

    .line 1010
    :cond_3f
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    const-string v4, "com.android.server.WimaxManager.action.WIMAX_DHCP_RENEW"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6e

    .line 1011
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v4

    if-eqz v4, :cond_5b

    const-string v4, "WimaxService"

    const-string v4, "-----------ACTION_WIMAX_DHCP_RENEW------------"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1012
    :cond_5b
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-static {}, Lcom/android/server/WimaxService;->access$900()Landroid/os/PowerManager$WakeLock;

    move-result-object v5

    #calls: Lcom/android/server/WimaxService;->acquire_WakeLock(Landroid/os/PowerManager$WakeLock;)V
    invoke-static {v4, v5}, Lcom/android/server/WimaxService;->access$1000(Lcom/android/server/WimaxService;Landroid/os/PowerManager$WakeLock;)V

    .line 1013
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->notifyIpRenew()V

    goto :goto_25

    .line 1015
    :cond_6e
    const-string v4, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_214

    .line 1016
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v4

    if-eqz v4, :cond_85

    const-string v4, "WimaxService"

    const-string v4, "ACTION_BATTERY_CHANGED"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1018
    :cond_85
    const-string v4, "plugged"

    invoke-virtual {p2, v4, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 1019
    .local v2, nPluggedType:I
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v4

    if-eqz v4, :cond_d9

    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[nPluggedType] : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " getWimaxMode() :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v5}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " m_nPluggedType : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_nPluggedType:I
    invoke-static {v5}, Lcom/android/server/WimaxService;->access$1100(Lcom/android/server/WimaxService;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mbUSBTethered : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/android/server/WimaxService;->access$1200()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1021
    :cond_d9
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_nPluggedType:I
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$1100(Lcom/android/server/WimaxService;)I

    move-result v4

    if-eq v4, v9, :cond_17c

    if-ne v2, v9, :cond_17c

    .line 1022
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #setter for: Lcom/android/server/WimaxService;->m_nPluggedType:I
    invoke-static {v4, v2}, Lcom/android/server/WimaxService;->access$1102(Lcom/android/server/WimaxService;I)I

    .line 1023
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v4

    if-eqz v4, :cond_f7

    const-string v4, "WimaxService"

    const-string v4, "ACTION_BATTERY_CHANGED : USB CABLE IS PLUGGED"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1024
    :cond_f7
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    if-ne v4, v7, :cond_108

    .line 1025
    const-string v4, "WimaxService"

    const-string v4, "discard - already tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 1027
    :cond_108
    invoke-static {}, Lcom/android/server/WimaxService;->access$1200()Z

    move-result v4

    if-eqz v4, :cond_25

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v4

    if-ne v4, v10, :cond_25

    .line 1028
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7, v7}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 1029
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->clearRetryFlag()V

    .line 1030
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->DISCONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_13c

    .line 1031
    const-string v4, "WimaxService"

    const-string v4, "it will connect as tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1032
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7}, Lcom/android/server/WimaxService;->startScan(Z)Z

    goto/16 :goto_25

    .line 1033
    :cond_13c
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->SCANNING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_16e

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->READY:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_16e

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_16e

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->OBTAINING_IPADDR:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_16e

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_25

    .line 1038
    :cond_16e
    const-string v4, "WimaxService"

    const-string v4, "it will disconnect for re-connecting as tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1039
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->disconnect()Z

    goto/16 :goto_25

    .line 1043
    :cond_17c
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_nPluggedType:I
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$1100(Lcom/android/server/WimaxService;)I

    move-result v4

    if-ne v4, v9, :cond_25

    if-eq v2, v9, :cond_25

    .line 1044
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #setter for: Lcom/android/server/WimaxService;->m_nPluggedType:I
    invoke-static {v4, v2}, Lcom/android/server/WimaxService;->access$1102(Lcom/android/server/WimaxService;I)I

    .line 1045
    const-string v4, "WimaxService"

    const-string v4, "ACTION_BATTERY_CHANGED : USB CABLE IS UNPLUGGED"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1046
    invoke-static {v8}, Lcom/android/server/WimaxService;->access$1202(Z)Z

    .line 1047
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    if-ne v4, v7, :cond_20b

    .line 1048
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v4

    if-ne v4, v10, :cond_25

    .line 1049
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7, v8}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 1050
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->clearRetryFlag()V

    .line 1051
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->DISCONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_1cb

    .line 1052
    const-string v4, "WimaxService"

    const-string v4, "it will connect as normal mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1053
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7}, Lcom/android/server/WimaxService;->startScan(Z)Z

    goto/16 :goto_25

    .line 1054
    :cond_1cb
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->SCANNING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_1fd

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->READY:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_1fd

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_1fd

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->OBTAINING_IPADDR:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_1fd

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_25

    .line 1059
    :cond_1fd
    const-string v4, "WimaxService"

    const-string v4, "it will disconnect for re-connecting as normal mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1060
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->disconnect()Z

    goto/16 :goto_25

    .line 1064
    :cond_20b
    const-string v4, "WimaxService"

    const-string v4, "discard - already NOT tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 1069
    .end local v2           #nPluggedType:I
    :cond_214
    const-string v4, "android.net.wifi.WIFI_AP_STATE_CHANGED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2f4

    .line 1070
    const-string v4, "wifi_state"

    const/4 v5, 0x4

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1071
    .local v1, nApState:I
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v4

    if-eqz v4, :cond_243

    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "WIFI_AP_STATE_CHANGED_ACTION = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1073
    :cond_243
    packed-switch v1, :pswitch_data_486

    .line 1088
    :pswitch_246
    const-string v4, "WimaxService"

    const-string v4, "discard - WIFI_AP_STATE_CHANGED_ACTION intent."

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 1076
    :pswitch_24f
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    if-eq v4, v9, :cond_27a

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    const/4 v5, 0x4

    if-eq v4, v5, :cond_27a

    .line 1077
    const-string v4, "WimaxService"

    const-string v4, "discard - WIFI_AP_STATE_CHANGED_ACTION intent."

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 1082
    :pswitch_269
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    if-ne v4, v7, :cond_27a

    .line 1083
    const-string v4, "WimaxService"

    const-string v4, "discard - WIFI_AP_STATE_CHANGED_ACTION intent. current mode is wimax tethered."

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 1093
    :cond_27a
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    if-ne v1, v10, :cond_2b2

    move v5, v7

    :goto_27f
    invoke-virtual {v4, v9, v5}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 1094
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v4

    if-ne v4, v10, :cond_2ab

    .line 1095
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->clearRetryFlag()V

    .line 1096
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->DISCONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_2c5

    .line 1097
    if-ne v1, v10, :cond_2b4

    .line 1098
    const-string v4, "WimaxService"

    const-string v4, "it will be start scan to re-connect as backhaul mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1103
    :goto_2a6
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7}, Lcom/android/server/WimaxService;->startScan(Z)Z

    .line 1185
    .end local v1           #nApState:I
    :cond_2ab
    :goto_2ab
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #calls: Lcom/android/server/WimaxService;->updateWimaxStatus()V
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$400(Lcom/android/server/WimaxService;)V

    goto/16 :goto_25

    .restart local v1       #nApState:I
    :cond_2b2
    move v5, v8

    .line 1093
    goto :goto_27f

    .line 1100
    :cond_2b4
    const-string v4, "WimaxService"

    const-string v4, "it will be start scan to re-connect as normal mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1101
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/net/wimax/WimaxStateTracker;->SetNoBackOff(Z)V

    goto :goto_2a6

    .line 1105
    :cond_2c5
    if-ne v1, v10, :cond_2e3

    .line 1106
    const-string v4, "WimaxService"

    const-string v4, "it will be disconnect to re-connect as backhaul mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1107
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    iget v4, v4, Lcom/android/server/WimaxService;->m_nCallState:I

    if-ne v4, v9, :cond_2dd

    .line 1108
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/net/wimax/WimaxStateTracker;->SetNoBackOff(Z)V

    .line 1113
    :cond_2dd
    :goto_2dd
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->disconnect()Z

    goto :goto_2ab

    .line 1110
    :cond_2e3
    const-string v4, "WimaxService"

    const-string v4, "it will be disconnect to re-connect as normal mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1111
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/net/wimax/WimaxStateTracker;->SetNoBackOff(Z)V

    goto :goto_2dd

    .line 1116
    .end local v1           #nApState:I
    :cond_2f4
    const-string v4, "com.android.settings.TETHERING_WIMAX_REALM_CHANGE_ACTION"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44f

    .line 1117
    const-string v4, "tethering"

    invoke-virtual {p2, v4, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    .line 1118
    .local v3, usbTethered:Z
    invoke-static {}, Lcom/android/server/WimaxService;->access$1200()Z

    move-result v4

    if-eq v4, v3, :cond_25

    .line 1121
    const-string v4, "WimaxService"

    const-string v4, "TETHERING_WIMAX_REALM_CHANGE_ACTION"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1122
    invoke-static {v3}, Lcom/android/server/WimaxService;->access$1202(Z)Z

    .line 1123
    invoke-virtual {p1, p2}, Landroid/content/Context;->removeStickyBroadcast(Landroid/content/Intent;)V

    .line 1125
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_bLog:Z
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$800(Lcom/android/server/WimaxService;)Z

    move-result v4

    if-eqz v4, :cond_335

    const-string v4, "WimaxService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "usbTethered = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1127
    :cond_335
    invoke-static {}, Lcom/android/server/WimaxService;->access$1200()Z

    move-result v4

    if-eqz v4, :cond_3c9

    .line 1128
    const-string v4, "WimaxService"

    const-string v4, "Tethering option is checked"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1129
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    if-ne v4, v7, :cond_353

    .line 1130
    const-string v4, "WimaxService"

    const-string v4, "discard - already tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 1132
    :cond_353
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_nPluggedType:I
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$1100(Lcom/android/server/WimaxService;)I

    move-result v4

    if-ne v4, v9, :cond_25

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v4

    if-ne v4, v10, :cond_25

    .line 1133
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7, v7}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 1134
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->clearRetryFlag()V

    .line 1135
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->DISCONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_389

    .line 1136
    const-string v4, "WimaxService"

    const-string v4, "it will connect as tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1137
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7}, Lcom/android/server/WimaxService;->startScan(Z)Z

    goto/16 :goto_25

    .line 1138
    :cond_389
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->SCANNING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_3bb

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->READY:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_3bb

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_3bb

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->OBTAINING_IPADDR:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_3bb

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_25

    .line 1143
    :cond_3bb
    const-string v4, "WimaxService"

    const-string v4, "it will disconnect for re-connecting as tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1144
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->disconnect()Z

    goto/16 :goto_25

    .line 1149
    :cond_3c9
    const-string v4, "WimaxService"

    const-string v4, "Tethering option is unchecked"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1150
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    if-ne v4, v7, :cond_446

    .line 1151
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v4

    if-ne v4, v10, :cond_25

    .line 1152
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7, v8}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 1153
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->clearRetryFlag()V

    .line 1154
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->DISCONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_406

    .line 1155
    const-string v4, "WimaxService"

    const-string v4, "it will connect as normal mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1156
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7}, Lcom/android/server/WimaxService;->startScan(Z)Z

    goto/16 :goto_25

    .line 1157
    :cond_406
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->SCANNING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_438

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->READY:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_438

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTING:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_438

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->OBTAINING_IPADDR:Landroid/net/wimax/WimaxState;

    if-eq v4, v5, :cond_438

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxState()Landroid/net/wimax/WimaxState;

    move-result-object v4

    sget-object v5, Landroid/net/wimax/WimaxState;->CONNECTED:Landroid/net/wimax/WimaxState;

    if-ne v4, v5, :cond_25

    .line 1162
    :cond_438
    const-string v4, "WimaxService"

    const-string v4, "it will disconnect for re-connecting as normal mode"

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1163
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->disconnect()Z

    goto/16 :goto_25

    .line 1167
    :cond_446
    const-string v4, "WimaxService"

    const-string v4, "discard - already NOT tethered mode"

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_25

    .line 1171
    .end local v3           #usbTethered:Z
    :cond_44f
    const-string v4, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_25

    .line 1172
    const-string v4, "WimaxService"

    const-string v4, "@@@@@ ACTION_SHUTDOWN @@@@@"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1173
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v4

    if-eq v4, v10, :cond_46e

    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxEnabledStatus()I

    move-result v4

    if-ne v4, v9, :cond_2ab

    .line 1174
    :cond_46e
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4}, Lcom/android/server/WimaxService;->getWimaxMode()I

    move-result v4

    if-ne v4, v7, :cond_47b

    .line 1176
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v4, v7, v8}, Lcom/android/server/WimaxService;->setWimaxMode(IZ)I

    .line 1178
    :cond_47b
    iget-object v4, p0, Lcom/android/server/WimaxService$5;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v4}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wimax/WimaxStateTracker;->disconnectAndStop()Z

    goto/16 :goto_25

    .line 1073
    :pswitch_data_486
    .packed-switch 0x1
        :pswitch_24f
        :pswitch_246
        :pswitch_269
        :pswitch_24f
    .end packed-switch
.end method
