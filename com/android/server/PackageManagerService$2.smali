.class Lcom/android/server/PackageManagerService$2;
.super Ljava/lang/Object;
.source "PackageManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/PackageManagerService;->freeStorage(JLandroid/content/IntentSender;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PackageManagerService;

.field final synthetic val$freeStorageSize:J

.field final synthetic val$pi:Landroid/content/IntentSender;


# direct methods
.method constructor <init>(Lcom/android/server/PackageManagerService;JLandroid/content/IntentSender;)V
    .registers 5
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1623
    iput-object p1, p0, Lcom/android/server/PackageManagerService$2;->this$0:Lcom/android/server/PackageManagerService;

    iput-wide p2, p0, Lcom/android/server/PackageManagerService$2;->val$freeStorageSize:J

    iput-object p4, p0, Lcom/android/server/PackageManagerService$2;->val$pi:Landroid/content/IntentSender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const-string v8, "PackageManager"

    .line 1625
    iget-object v0, p0, Lcom/android/server/PackageManagerService$2;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v0, v0, Lcom/android/server/PackageManagerService;->mHandler:Lcom/android/server/PackageManagerService$PackageHandler;

    invoke-virtual {v0, p0}, Lcom/android/server/PackageManagerService$PackageHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1626
    const/4 v7, -0x1

    .line 1627
    .local v7, retCode:I
    iget-object v0, p0, Lcom/android/server/PackageManagerService$2;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v0, v0, Lcom/android/server/PackageManagerService;->mInstaller:Lcom/android/server/Installer;

    if-eqz v0, :cond_23

    .line 1628
    iget-object v0, p0, Lcom/android/server/PackageManagerService$2;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v0, v0, Lcom/android/server/PackageManagerService;->mInstaller:Lcom/android/server/Installer;

    iget-wide v3, p0, Lcom/android/server/PackageManagerService$2;->val$freeStorageSize:J

    invoke-virtual {v0, v3, v4}, Lcom/android/server/Installer;->freeCache(J)I

    move-result v7

    .line 1629
    if-gez v7, :cond_23

    .line 1630
    const-string v0, "PackageManager"

    const-string v0, "Couldn\'t clear application caches"

    invoke-static {v8, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1633
    :cond_23
    iget-object v0, p0, Lcom/android/server/PackageManagerService$2;->val$pi:Landroid/content/IntentSender;

    if-eqz v0, :cond_34

    .line 1636
    if-ltz v7, :cond_35

    const/4 v0, 0x1

    move v2, v0

    .line 1637
    .local v2, code:I
    :goto_2b
    :try_start_2b
    iget-object v0, p0, Lcom/android/server/PackageManagerService$2;->val$pi:Landroid/content/IntentSender;

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/IntentSender;->sendIntent(Landroid/content/Context;ILandroid/content/Intent;Landroid/content/IntentSender$OnFinished;Landroid/os/Handler;)V
    :try_end_34
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_2b .. :try_end_34} :catch_38

    .line 1643
    .end local v2           #code:I
    :cond_34
    :goto_34
    return-void

    .line 1636
    :cond_35
    const/4 v0, 0x0

    move v2, v0

    goto :goto_2b

    .line 1639
    .restart local v2       #code:I
    :catch_38
    move-exception v0

    move-object v6, v0

    .line 1640
    .local v6, e1:Landroid/content/IntentSender$SendIntentException;
    const-string v0, "PackageManager"

    const-string v0, "Failed to send pending intent"

    invoke-static {v8, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34
.end method
