.class Lcom/android/server/WimaxService$3;
.super Landroid/content/BroadcastReceiver;
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
    .line 242
    iput-object p1, p0, Lcom/android/server/WimaxService$3;->this$0:Lcom/android/server/WimaxService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    .line 245
    const-string v1, "WimaxService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "com.sprint.android.SPRINTEXTENSION_STARTED. m_isBootCompleted : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/WimaxService$3;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_isBootCompleted:Z
    invoke-static {v3}, Lcom/android/server/WimaxService;->access$500(Lcom/android/server/WimaxService;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    iget-object v1, p0, Lcom/android/server/WimaxService$3;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->m_isBootCompleted:Z
    invoke-static {v1}, Lcom/android/server/WimaxService;->access$500(Lcom/android/server/WimaxService;)Z

    move-result v1

    if-nez v1, :cond_45

    .line 247
    iget-object v1, p0, Lcom/android/server/WimaxService$3;->this$0:Lcom/android/server/WimaxService;

    #setter for: Lcom/android/server/WimaxService;->m_isBootCompleted:Z
    invoke-static {v1, v4}, Lcom/android/server/WimaxService;->access$502(Lcom/android/server/WimaxService;Z)Z

    .line 248
    iget-object v1, p0, Lcom/android/server/WimaxService$3;->this$0:Lcom/android/server/WimaxService;

    invoke-virtual {v1}, Lcom/android/server/WimaxService;->getPersistedWimaxEnabled()Z

    move-result v0

    .line 249
    .local v0, WimaxEnabled:Z
    iget-object v1, p0, Lcom/android/server/WimaxService$3;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mWimaxStateTracker:Landroid/net/wimax/WimaxStateTracker;
    invoke-static {v1}, Lcom/android/server/WimaxService;->access$600(Lcom/android/server/WimaxService;)Landroid/net/wimax/WimaxStateTracker;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/net/wimax/WimaxStateTracker;->isBootCompleted(Z)V

    .line 250
    iget-object v1, p0, Lcom/android/server/WimaxService$3;->this$0:Lcom/android/server/WimaxService;

    const/4 v2, 0x0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    #calls: Lcom/android/server/WimaxService;->setWimaxEnabledBlocking(ZZI)Z
    invoke-static {v1, v0, v2, v3}, Lcom/android/server/WimaxService;->access$700(Lcom/android/server/WimaxService;ZZI)Z

    .line 252
    .end local v0           #WimaxEnabled:Z
    :cond_45
    return-void
.end method
