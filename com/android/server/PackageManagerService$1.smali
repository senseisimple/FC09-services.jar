.class Lcom/android/server/PackageManagerService$1;
.super Ljava/lang/Object;
.source "PackageManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/PackageManagerService;->freeStorageAndNotify(JLandroid/content/pm/IPackageDataObserver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PackageManagerService;

.field final synthetic val$freeStorageSize:J

.field final synthetic val$observer:Landroid/content/pm/IPackageDataObserver;


# direct methods
.method constructor <init>(Lcom/android/server/PackageManagerService;JLandroid/content/pm/IPackageDataObserver;)V
    .registers 5
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1598
    iput-object p1, p0, Lcom/android/server/PackageManagerService$1;->this$0:Lcom/android/server/PackageManagerService;

    iput-wide p2, p0, Lcom/android/server/PackageManagerService$1;->val$freeStorageSize:J

    iput-object p4, p0, Lcom/android/server/PackageManagerService$1;->val$observer:Landroid/content/pm/IPackageDataObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    const-string v5, "PackageManager"

    .line 1600
    iget-object v2, p0, Lcom/android/server/PackageManagerService$1;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/PackageManagerService;->mHandler:Lcom/android/server/PackageManagerService$PackageHandler;

    invoke-virtual {v2, p0}, Lcom/android/server/PackageManagerService$PackageHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1601
    const/4 v1, -0x1

    .line 1602
    .local v1, retCode:I
    iget-object v2, p0, Lcom/android/server/PackageManagerService$1;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/PackageManagerService;->mInstaller:Lcom/android/server/Installer;

    if-eqz v2, :cond_23

    .line 1603
    iget-object v2, p0, Lcom/android/server/PackageManagerService$1;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/PackageManagerService;->mInstaller:Lcom/android/server/Installer;

    iget-wide v3, p0, Lcom/android/server/PackageManagerService$1;->val$freeStorageSize:J

    invoke-virtual {v2, v3, v4}, Lcom/android/server/Installer;->freeCache(J)I

    move-result v1

    .line 1604
    if-gez v1, :cond_23

    .line 1605
    const-string v2, "PackageManager"

    const-string v2, "Couldn\'t clear application caches"

    invoke-static {v5, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1608
    :cond_23
    iget-object v2, p0, Lcom/android/server/PackageManagerService$1;->val$observer:Landroid/content/pm/IPackageDataObserver;

    if-eqz v2, :cond_30

    .line 1610
    :try_start_27
    iget-object v2, p0, Lcom/android/server/PackageManagerService$1;->val$observer:Landroid/content/pm/IPackageDataObserver;

    const/4 v3, 0x0

    if-ltz v1, :cond_31

    const/4 v4, 0x1

    :goto_2d
    invoke-interface {v2, v3, v4}, Landroid/content/pm/IPackageDataObserver;->onRemoveCompleted(Ljava/lang/String;Z)V
    :try_end_30
    .catch Landroid/os/RemoteException; {:try_start_27 .. :try_end_30} :catch_33

    .line 1615
    :cond_30
    :goto_30
    return-void

    .line 1610
    :cond_31
    const/4 v4, 0x0

    goto :goto_2d

    .line 1611
    :catch_33
    move-exception v2

    move-object v0, v2

    .line 1612
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "PackageManager"

    const-string v2, "RemoveException when invoking call back"

    invoke-static {v5, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_30
.end method
