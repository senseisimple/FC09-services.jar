.class Lcom/android/server/PackageManagerService$7;
.super Ljava/lang/Object;
.source "PackageManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/PackageManagerService;->deletePackage(Ljava/lang/String;Landroid/content/pm/IPackageDeleteObserver;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PackageManagerService;

.field final synthetic val$flags:I

.field final synthetic val$observer:Landroid/content/pm/IPackageDeleteObserver;

.field final synthetic val$packageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/server/PackageManagerService;Ljava/lang/String;ILandroid/content/pm/IPackageDeleteObserver;)V
    .registers 5
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 6276
    iput-object p1, p0, Lcom/android/server/PackageManagerService$7;->this$0:Lcom/android/server/PackageManagerService;

    iput-object p2, p0, Lcom/android/server/PackageManagerService$7;->val$packageName:Ljava/lang/String;

    iput p3, p0, Lcom/android/server/PackageManagerService$7;->val$flags:I

    iput-object p4, p0, Lcom/android/server/PackageManagerService$7;->val$observer:Landroid/content/pm/IPackageDeleteObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    const/4 v6, 0x1

    const-string v7, "PackageManager"

    .line 6278
    iget-object v3, p0, Lcom/android/server/PackageManagerService$7;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/PackageManagerService;->mHandler:Lcom/android/server/PackageManagerService$PackageHandler;

    invoke-virtual {v3, p0}, Lcom/android/server/PackageManagerService$PackageHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6280
    const/4 v2, 0x0

    .line 6281
    .local v2, succeded:Z
    new-instance v0, Lcom/android/server/enterprise/ApplicationPolicy;

    iget-object v3, p0, Lcom/android/server/PackageManagerService$7;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/PackageManagerService;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/android/server/enterprise/ApplicationPolicy;-><init>(Landroid/content/Context;)V

    .line 6282
    .local v0, dmAppMgr:Lcom/android/server/enterprise/ApplicationPolicy;
    iget-object v3, p0, Lcom/android/server/PackageManagerService$7;->val$packageName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationUninstallationEnabled(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2e

    .line 6283
    const-string v3, "PackageManager"

    const-string v3, "This app uninstallation is not allowed"

    invoke-static {v7, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6284
    const/4 v2, 0x0

    .line 6290
    :goto_24
    iget-object v3, p0, Lcom/android/server/PackageManagerService$7;->val$observer:Landroid/content/pm/IPackageDeleteObserver;

    if-eqz v3, :cond_2d

    .line 6292
    :try_start_28
    iget-object v3, p0, Lcom/android/server/PackageManagerService$7;->val$observer:Landroid/content/pm/IPackageDeleteObserver;

    invoke-interface {v3, v2}, Landroid/content/pm/IPackageDeleteObserver;->packageDeleted(Z)V
    :try_end_2d
    .catch Landroid/os/RemoteException; {:try_start_28 .. :try_end_2d} :catch_39

    .line 6297
    :cond_2d
    :goto_2d
    return-void

    .line 6287
    :cond_2e
    iget-object v3, p0, Lcom/android/server/PackageManagerService$7;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v4, p0, Lcom/android/server/PackageManagerService$7;->val$packageName:Ljava/lang/String;

    iget v5, p0, Lcom/android/server/PackageManagerService$7;->val$flags:I

    #calls: Lcom/android/server/PackageManagerService;->deletePackageX(Ljava/lang/String;ZZI)Z
    invoke-static {v3, v4, v6, v6, v5}, Lcom/android/server/PackageManagerService;->access$3100(Lcom/android/server/PackageManagerService;Ljava/lang/String;ZZI)Z

    move-result v2

    goto :goto_24

    .line 6293
    :catch_39
    move-exception v3

    move-object v1, v3

    .line 6294
    .local v1, e:Landroid/os/RemoteException;
    const-string v3, "PackageManager"

    const-string v3, "Observer no longer exists."

    invoke-static {v7, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2d
.end method
