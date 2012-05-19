.class Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;
.super Lcom/android/internal/content/PackageMonitor;
.source "DevicePolicyManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/DevicePolicyManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPackageMonitor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/DevicePolicyManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/DevicePolicyManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 540
    iput-object p1, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    invoke-direct {p0}, Lcom/android/internal/content/PackageMonitor;-><init>()V

    return-void
.end method


# virtual methods
.method public onSomePackagesChanged()V
    .registers 10

    .prologue
    const-string v5, "DevicePolicyManagerService"

    .line 542
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    monitor-enter v5

    .line 543
    const/4 v4, 0x0

    .line 544
    .local v4, removed:Z
    :try_start_6
    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v6, v6, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x1

    sub-int v3, v6, v7

    .local v3, i:I
    :goto_11
    if-ltz v3, :cond_a1

    .line 545
    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v6, v6, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 546
    .local v0, aa:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-object v6, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v6}, Landroid/app/admin/DeviceAdminInfo;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->isPackageDisappearing(Ljava/lang/String;)I

    move-result v1

    .line 547
    .local v1, change:I
    const/4 v6, 0x3

    if-eq v1, v6, :cond_2d

    const/4 v6, 0x2

    if-ne v1, v6, :cond_56

    .line 549
    :cond_2d
    const-string v6, "DevicePolicyManagerService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Admin unexpectedly uninstalled: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v8}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 551
    const/4 v4, 0x1

    .line 552
    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v6, v6, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 544
    :cond_53
    :goto_53
    add-int/lit8 v3, v3, -0x1

    goto :goto_11

    .line 553
    :cond_56
    iget-object v6, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v6}, Landroid/app/admin/DeviceAdminInfo;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->isPackageModified(Ljava/lang/String;)Z
    :try_end_5f
    .catchall {:try_start_6 .. :try_end_5f} :catchall_9e

    move-result v6

    if-eqz v6, :cond_53

    .line 555
    :try_start_62
    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v6, v6, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    iget-object v7, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v7}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_74
    .catchall {:try_start_62 .. :try_end_74} :catchall_9e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_62 .. :try_end_74} :catch_75

    goto :goto_53

    .line 557
    :catch_75
    move-exception v6

    move-object v2, v6

    .line 558
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_77
    const-string v6, "DevicePolicyManagerService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Admin package change removed component: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v8}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    const/4 v4, 0x1

    .line 561
    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v6, v6, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_53

    .line 568
    .end local v0           #aa:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .end local v1           #change:I
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v3           #i:I
    :catchall_9e
    move-exception v6

    monitor-exit v5
    :try_end_a0
    .catchall {:try_start_77 .. :try_end_a0} :catchall_9e

    throw v6

    .line 565
    .restart local v3       #i:I
    :cond_a1
    if-eqz v4, :cond_a8

    .line 566
    :try_start_a3
    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    invoke-virtual {v6}, Lcom/android/server/DevicePolicyManagerService;->validatePasswordOwnerLocked()V

    .line 568
    :cond_a8
    monitor-exit v5
    :try_end_a9
    .catchall {:try_start_a3 .. :try_end_a9} :catchall_9e

    .line 569
    return-void
.end method
