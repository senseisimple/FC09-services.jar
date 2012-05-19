.class Lcom/android/server/PackageManagerService$5;
.super Ljava/lang/Object;
.source "PackageManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/PackageManagerService;->processPendingInstall(Lcom/android/server/PackageManagerService$InstallArgs;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PackageManagerService;

.field final synthetic val$args:Lcom/android/server/PackageManagerService$InstallArgs;

.field final synthetic val$currentStatus:I


# direct methods
.method constructor <init>(Lcom/android/server/PackageManagerService;ILcom/android/server/PackageManagerService$InstallArgs;)V
    .registers 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 4795
    iput-object p1, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iput p2, p0, Lcom/android/server/PackageManagerService$5;->val$currentStatus:I

    iput-object p3, p0, Lcom/android/server/PackageManagerService$5;->val$args:Lcom/android/server/PackageManagerService$InstallArgs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    const-string v14, "PackageManager"

    .line 4797
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mHandler:Lcom/android/server/PackageManagerService$PackageHandler;

    invoke-virtual {v8, p0}, Lcom/android/server/PackageManagerService$PackageHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 4799
    new-instance v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;

    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    invoke-direct {v5, v8}, Lcom/android/server/PackageManagerService$PackageInstalledInfo;-><init>(Lcom/android/server/PackageManagerService;)V

    .line 4800
    .local v5, res:Lcom/android/server/PackageManagerService$PackageInstalledInfo;
    iget v8, p0, Lcom/android/server/PackageManagerService$5;->val$currentStatus:I

    iput v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->returnCode:I

    .line 4801
    const/4 v8, -0x1

    iput v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->uid:I

    .line 4802
    const/4 v8, 0x0

    iput-object v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->pkg:Landroid/content/pm/PackageParser$Package;

    .line 4803
    new-instance v8, Lcom/android/server/PackageManagerService$PackageRemovedInfo;

    invoke-direct {v8}, Lcom/android/server/PackageManagerService$PackageRemovedInfo;-><init>()V

    iput-object v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->removedInfo:Lcom/android/server/PackageManagerService$PackageRemovedInfo;

    .line 4804
    iget v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->returnCode:I

    if-ne v8, v12, :cond_43

    .line 4805
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->val$args:Lcom/android/server/PackageManagerService$InstallArgs;

    iget v9, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->returnCode:I

    invoke-virtual {v8, v9}, Lcom/android/server/PackageManagerService$InstallArgs;->doPreInstall(I)I

    .line 4806
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mInstallLock:Ljava/lang/Object;

    monitor-enter v8

    .line 4807
    :try_start_33
    iget-object v9, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v10, p0, Lcom/android/server/PackageManagerService$5;->val$args:Lcom/android/server/PackageManagerService$InstallArgs;

    const/4 v11, 0x1

    #calls: Lcom/android/server/PackageManagerService;->installPackageLI(Lcom/android/server/PackageManagerService$InstallArgs;ZLcom/android/server/PackageManagerService$PackageInstalledInfo;)V
    invoke-static {v9, v10, v11, v5}, Lcom/android/server/PackageManagerService;->access$2200(Lcom/android/server/PackageManagerService;Lcom/android/server/PackageManagerService$InstallArgs;ZLcom/android/server/PackageManagerService$PackageInstalledInfo;)V

    .line 4808
    monitor-exit v8
    :try_end_3c
    .catchall {:try_start_33 .. :try_end_3c} :catchall_aa

    .line 4809
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->val$args:Lcom/android/server/PackageManagerService$InstallArgs;

    iget v9, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->returnCode:I

    invoke-virtual {v8, v9}, Lcom/android/server/PackageManagerService$InstallArgs;->doPostInstall(I)I

    .line 4815
    :cond_43
    iget-object v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->removedInfo:Lcom/android/server/PackageManagerService$PackageRemovedInfo;

    iget-object v8, v8, Lcom/android/server/PackageManagerService$PackageRemovedInfo;->removedPackage:Ljava/lang/String;

    if-eqz v8, :cond_ad

    move v7, v12

    .line 4816
    .local v7, update:Z
    :goto_4a
    if-nez v7, :cond_af

    iget-object v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->pkg:Landroid/content/pm/PackageParser$Package;

    if-eqz v8, :cond_af

    iget-object v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v8, v8, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->backupAgentName:Ljava/lang/String;

    if-eqz v8, :cond_af

    move v2, v12

    .line 4824
    .local v2, doRestore:Z
    :goto_59
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget v8, v8, Lcom/android/server/PackageManagerService;->mNextInstallToken:I

    if-gez v8, :cond_63

    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iput v12, v8, Lcom/android/server/PackageManagerService;->mNextInstallToken:I

    .line 4825
    :cond_63
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget v6, v8, Lcom/android/server/PackageManagerService;->mNextInstallToken:I

    add-int/lit8 v9, v6, 0x1

    iput v9, v8, Lcom/android/server/PackageManagerService;->mNextInstallToken:I

    .line 4827
    .local v6, token:I
    new-instance v1, Lcom/android/server/PackageManagerService$PostInstallData;

    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v9, p0, Lcom/android/server/PackageManagerService$5;->val$args:Lcom/android/server/PackageManagerService$InstallArgs;

    invoke-direct {v1, v8, v9, v5}, Lcom/android/server/PackageManagerService$PostInstallData;-><init>(Lcom/android/server/PackageManagerService;Lcom/android/server/PackageManagerService$InstallArgs;Lcom/android/server/PackageManagerService$PackageInstalledInfo;)V

    .line 4828
    .local v1, data:Lcom/android/server/PackageManagerService$PostInstallData;
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mRunningInstalls:Landroid/util/SparseArray;

    invoke-virtual {v8, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 4831
    iget v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->returnCode:I

    if-ne v8, v12, :cond_96

    if-eqz v2, :cond_96

    .line 4836
    const-string v8, "backup"

    invoke-static {v8}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v8

    invoke-static {v8}, Landroid/app/backup/IBackupManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/backup/IBackupManager;

    move-result-object v0

    .line 4838
    .local v0, bm:Landroid/app/backup/IBackupManager;
    if-eqz v0, :cond_bc

    .line 4842
    :try_start_8d
    iget-object v8, v5, Lcom/android/server/PackageManagerService$PackageInstalledInfo;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v8, v8, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-interface {v0, v8, v6}, Landroid/app/backup/IBackupManager;->restoreAtInstall(Ljava/lang/String;I)V
    :try_end_96
    .catch Landroid/os/RemoteException; {:try_start_8d .. :try_end_96} :catch_c5
    .catch Ljava/lang/Exception; {:try_start_8d .. :try_end_96} :catch_b1

    .line 4855
    .end local v0           #bm:Landroid/app/backup/IBackupManager;
    :cond_96
    :goto_96
    if-nez v2, :cond_a9

    .line 4859
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mHandler:Lcom/android/server/PackageManagerService$PackageHandler;

    const/16 v9, 0x9

    invoke-virtual {v8, v9, v6, v13}, Lcom/android/server/PackageManagerService$PackageHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 4860
    .local v4, msg:Landroid/os/Message;
    iget-object v8, p0, Lcom/android/server/PackageManagerService$5;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mHandler:Lcom/android/server/PackageManagerService$PackageHandler;

    invoke-virtual {v8, v4}, Lcom/android/server/PackageManagerService$PackageHandler;->sendMessage(Landroid/os/Message;)Z

    .line 4862
    .end local v4           #msg:Landroid/os/Message;
    :cond_a9
    return-void

    .line 4808
    .end local v1           #data:Lcom/android/server/PackageManagerService$PostInstallData;
    .end local v2           #doRestore:Z
    .end local v6           #token:I
    .end local v7           #update:Z
    :catchall_aa
    move-exception v9

    :try_start_ab
    monitor-exit v8
    :try_end_ac
    .catchall {:try_start_ab .. :try_end_ac} :catchall_aa

    throw v9

    :cond_ad
    move v7, v13

    .line 4815
    goto :goto_4a

    .restart local v7       #update:Z
    :cond_af
    move v2, v13

    .line 4816
    goto :goto_59

    .line 4845
    .restart local v0       #bm:Landroid/app/backup/IBackupManager;
    .restart local v1       #data:Lcom/android/server/PackageManagerService$PostInstallData;
    .restart local v2       #doRestore:Z
    .restart local v6       #token:I
    :catch_b1
    move-exception v8

    move-object v3, v8

    .line 4846
    .local v3, e:Ljava/lang/Exception;
    const-string v8, "PackageManager"

    const-string v8, "Exception trying to enqueue restore"

    invoke-static {v14, v8, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 4847
    const/4 v2, 0x0

    .line 4848
    goto :goto_96

    .line 4850
    .end local v3           #e:Ljava/lang/Exception;
    :cond_bc
    const-string v8, "PackageManager"

    const-string v8, "Backup Manager not found!"

    invoke-static {v14, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4851
    const/4 v2, 0x0

    goto :goto_96

    .line 4843
    :catch_c5
    move-exception v8

    goto :goto_96
.end method
