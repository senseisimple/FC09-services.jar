.class Lcom/android/server/WimaxService$2;
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
    .line 231
    iput-object p1, p0, Lcom/android/server/WimaxService$2;->this$0:Lcom/android/server/WimaxService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 235
    iget-object v0, p0, Lcom/android/server/WimaxService$2;->this$0:Lcom/android/server/WimaxService;

    const/4 v1, 0x0

    #setter for: Lcom/android/server/WimaxService;->mAirplaneModeOverwridden:Z
    invoke-static {v0, v1}, Lcom/android/server/WimaxService;->access$302(Lcom/android/server/WimaxService;Z)Z

    .line 236
    iget-object v0, p0, Lcom/android/server/WimaxService$2;->this$0:Lcom/android/server/WimaxService;

    #calls: Lcom/android/server/WimaxService;->updateWimaxStatus()V
    invoke-static {v0}, Lcom/android/server/WimaxService;->access$400(Lcom/android/server/WimaxService;)V

    .line 237
    return-void
.end method
