.class Lcom/android/server/PackageManagerService$InstallParams;
.super Lcom/android/server/PackageManagerService$HandlerParams;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InstallParams"
.end annotation


# instance fields
.field flags:I

.field final installerPackageName:Ljava/lang/String;

.field private mArgs:Lcom/android/server/PackageManagerService$InstallArgs;

.field private mRet:I

.field final observer:Landroid/content/pm/IPackageInstallObserver;

.field final packageURI:Landroid/net/Uri;

.field final synthetic this$0:Lcom/android/server/PackageManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/PackageManagerService;Landroid/net/Uri;Landroid/content/pm/IPackageInstallObserver;ILjava/lang/String;)V
    .registers 6
    .parameter
    .parameter "packageURI"
    .parameter "observer"
    .parameter "flags"
    .parameter "installerPackageName"

    .prologue
    .line 4909
    iput-object p1, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    invoke-direct {p0, p1}, Lcom/android/server/PackageManagerService$HandlerParams;-><init>(Lcom/android/server/PackageManagerService;)V

    .line 4910
    iput-object p2, p0, Lcom/android/server/PackageManagerService$InstallParams;->packageURI:Landroid/net/Uri;

    .line 4911
    iput p4, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    .line 4912
    iput-object p3, p0, Lcom/android/server/PackageManagerService$InstallParams;->observer:Landroid/content/pm/IPackageInstallObserver;

    .line 4913
    iput-object p5, p0, Lcom/android/server/PackageManagerService$InstallParams;->installerPackageName:Ljava/lang/String;

    .line 4914
    return-void
.end method

.method private installLocationPolicy(Landroid/content/pm/PackageInfoLite;I)I
    .registers 11
    .parameter "pkgLite"
    .parameter "flags"

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 4917
    iget-object v2, p1, Landroid/content/pm/PackageInfoLite;->packageName:Ljava/lang/String;

    .line 4918
    .local v2, packageName:Ljava/lang/String;
    iget v0, p1, Landroid/content/pm/PackageInfoLite;->installLocation:I

    .line 4919
    .local v0, installLocation:I
    and-int/lit8 v4, p2, 0x8

    if-eqz v4, :cond_35

    move v1, v6

    .line 4920
    .local v1, onSd:Z
    :goto_b
    iget-object v4, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v4, v4, Lcom/android/server/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v4

    .line 4921
    :try_start_10
    iget-object v5, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v5, v5, Lcom/android/server/PackageManagerService;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageParser$Package;

    .line 4922
    .local v3, pkg:Landroid/content/pm/PackageParser$Package;
    if-eqz v3, :cond_47

    .line 4923
    and-int/lit8 v5, p2, 0x2

    if-eqz v5, :cond_58

    .line 4925
    iget-object v5, v3, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v5, v5, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_3b

    .line 4926
    if-eqz v1, :cond_38

    .line 4927
    const-string v5, "PackageManager"

    const-string v6, "Cannot install update to system app on sdcard"

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4928
    const/4 v5, -0x3

    monitor-exit v4

    move v4, v5

    .line 4961
    :goto_34
    return v4

    .line 4919
    .end local v1           #onSd:Z
    .end local v3           #pkg:Landroid/content/pm/PackageParser$Package;
    :cond_35
    const/4 v4, 0x0

    move v1, v4

    goto :goto_b

    .line 4930
    .restart local v1       #onSd:Z
    .restart local v3       #pkg:Landroid/content/pm/PackageParser$Package;
    :cond_38
    monitor-exit v4

    move v4, v6

    goto :goto_34

    .line 4932
    :cond_3b
    if-eqz v1, :cond_40

    .line 4934
    monitor-exit v4

    move v4, v7

    goto :goto_34

    .line 4937
    :cond_40
    if-ne v0, v6, :cond_45

    .line 4939
    monitor-exit v4

    move v4, v6

    goto :goto_34

    .line 4940
    :cond_45
    if-ne v0, v7, :cond_4c

    .line 4955
    :cond_47
    monitor-exit v4

    .line 4958
    if-eqz v1, :cond_5f

    move v4, v7

    .line 4959
    goto :goto_34

    .line 4944
    :cond_4c
    #calls: Lcom/android/server/PackageManagerService;->isExternal(Landroid/content/pm/PackageParser$Package;)Z
    invoke-static {v3}, Lcom/android/server/PackageManagerService;->access$2300(Landroid/content/pm/PackageParser$Package;)Z

    move-result v5

    if-eqz v5, :cond_55

    .line 4945
    monitor-exit v4

    move v4, v7

    goto :goto_34

    .line 4947
    :cond_55
    monitor-exit v4

    move v4, v6

    goto :goto_34

    .line 4952
    :cond_58
    const/4 v5, -0x4

    monitor-exit v4

    move v4, v5

    goto :goto_34

    .line 4955
    .end local v3           #pkg:Landroid/content/pm/PackageParser$Package;
    :catchall_5c
    move-exception v5

    monitor-exit v4
    :try_end_5e
    .catchall {:try_start_10 .. :try_end_5e} :catchall_5c

    throw v5

    .line 4961
    .restart local v3       #pkg:Landroid/content/pm/PackageParser$Package;
    :cond_5f
    iget v4, p1, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    goto :goto_34
.end method


# virtual methods
.method handleReturnCode()V
    .registers 4

    .prologue
    .line 5048
    iget-object v0, p0, Lcom/android/server/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/PackageManagerService$InstallArgs;

    if-eqz v0, :cond_d

    .line 5049
    iget-object v0, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v1, p0, Lcom/android/server/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/PackageManagerService$InstallArgs;

    iget v2, p0, Lcom/android/server/PackageManagerService$InstallParams;->mRet:I

    #calls: Lcom/android/server/PackageManagerService;->processPendingInstall(Lcom/android/server/PackageManagerService$InstallArgs;I)V
    invoke-static {v0, v1, v2}, Lcom/android/server/PackageManagerService;->access$2500(Lcom/android/server/PackageManagerService;Lcom/android/server/PackageManagerService$InstallArgs;I)V

    .line 5051
    :cond_d
    return-void
.end method

.method handleServiceError()V
    .registers 2

    .prologue
    .line 5055
    iget-object v0, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    #calls: Lcom/android/server/PackageManagerService;->createInstallArgs(Lcom/android/server/PackageManagerService$InstallParams;)Lcom/android/server/PackageManagerService$InstallArgs;
    invoke-static {v0, p0}, Lcom/android/server/PackageManagerService;->access$2400(Lcom/android/server/PackageManagerService;Lcom/android/server/PackageManagerService$InstallParams;)Lcom/android/server/PackageManagerService$InstallArgs;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/PackageManagerService$InstallArgs;

    .line 5056
    const/16 v0, -0x6e

    iput v0, p0, Lcom/android/server/PackageManagerService$InstallParams;->mRet:I

    .line 5057
    return-void
.end method

.method public handleStartCopy()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v12, 0x1

    const-string v11, "PackageManager"

    .line 4971
    const/4 v7, 0x1

    .line 4972
    .local v7, ret:I
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v8, v8, 0x1

    if-eqz v8, :cond_5b

    move v1, v12

    .line 4973
    .local v1, fwdLocked:Z
    :goto_c
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v8, v8, 0x8

    if-eqz v8, :cond_5d

    move v4, v12

    .line 4974
    .local v4, onSd:Z
    :goto_13
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v8, v8, 0x10

    if-eqz v8, :cond_5f

    move v3, v12

    .line 4976
    .local v3, onInt:Z
    :goto_1a
    new-instance v0, Lcom/android/server/enterprise/ApplicationPolicy;

    iget-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mContext:Landroid/content/Context;

    invoke-direct {v0, v8}, Lcom/android/server/enterprise/ApplicationPolicy;-><init>(Landroid/content/Context;)V

    .line 4977
    .local v0, dmAppMgr:Lcom/android/server/enterprise/ApplicationPolicy;
    iget-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    #getter for: Lcom/android/server/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v8}, Lcom/android/server/PackageManagerService;->access$300(Lcom/android/server/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/PackageManagerService$InstallParams;->packageURI:Landroid/net/Uri;

    iget v10, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    invoke-interface {v8, v9, v10}, Lcom/android/internal/app/IMediaContainerService;->getMinimalPackageInfo(Landroid/net/Uri;I)Landroid/content/pm/PackageInfoLite;

    move-result-object v6

    .line 4978
    .local v6, pkgLiteTemp:Landroid/content/pm/PackageInfoLite;
    iget-object v8, v6, Landroid/content/pm/PackageInfoLite;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v8}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationInstallationEnabled(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_61

    .line 4979
    const-string v8, "PackageManager"

    const-string v8, "This app installation is not allowed"

    invoke-static {v11, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4980
    const/16 v7, -0x6e

    .line 5034
    :cond_42
    :goto_42
    iget-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    #calls: Lcom/android/server/PackageManagerService;->createInstallArgs(Lcom/android/server/PackageManagerService$InstallParams;)Lcom/android/server/PackageManagerService$InstallArgs;
    invoke-static {v8, p0}, Lcom/android/server/PackageManagerService;->access$2400(Lcom/android/server/PackageManagerService;Lcom/android/server/PackageManagerService$InstallParams;)Lcom/android/server/PackageManagerService$InstallArgs;

    move-result-object v8

    iput-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/PackageManagerService$InstallArgs;

    .line 5035
    if-ne v7, v12, :cond_58

    .line 5038
    iget-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/PackageManagerService$InstallArgs;

    iget-object v9, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    #getter for: Lcom/android/server/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v9}, Lcom/android/server/PackageManagerService;->access$300(Lcom/android/server/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v9

    invoke-virtual {v8, v9, v12}, Lcom/android/server/PackageManagerService$InstallArgs;->copyApk(Lcom/android/internal/app/IMediaContainerService;Z)I

    move-result v7

    .line 5040
    :cond_58
    iput v7, p0, Lcom/android/server/PackageManagerService$InstallParams;->mRet:I

    .line 5041
    return-void

    .end local v0           #dmAppMgr:Lcom/android/server/enterprise/ApplicationPolicy;
    .end local v1           #fwdLocked:Z
    .end local v3           #onInt:Z
    .end local v4           #onSd:Z
    .end local v6           #pkgLiteTemp:Landroid/content/pm/PackageInfoLite;
    :cond_5b
    move v1, v9

    .line 4972
    goto :goto_c

    .restart local v1       #fwdLocked:Z
    :cond_5d
    move v4, v9

    .line 4973
    goto :goto_13

    .restart local v4       #onSd:Z
    :cond_5f
    move v3, v9

    .line 4974
    goto :goto_1a

    .line 4984
    .restart local v0       #dmAppMgr:Lcom/android/server/enterprise/ApplicationPolicy;
    .restart local v3       #onInt:Z
    .restart local v6       #pkgLiteTemp:Landroid/content/pm/PackageInfoLite;
    :cond_61
    if-eqz v3, :cond_6f

    if-eqz v4, :cond_6f

    .line 4986
    const-string v8, "PackageManager"

    const-string v8, "Conflicting flags specified for installing on both internal and external"

    invoke-static {v11, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4987
    const/16 v7, -0x13

    goto :goto_42

    .line 4988
    :cond_6f
    if-eqz v1, :cond_7d

    if-eqz v4, :cond_7d

    .line 4990
    const-string v8, "PackageManager"

    const-string v8, "Cannot install fwd locked apps on sdcard"

    invoke-static {v11, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4991
    const/16 v7, -0x13

    goto :goto_42

    .line 4996
    :cond_7d
    :try_start_7d
    iget-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mContext:Landroid/content/Context;

    const-string v9, "com.android.defcontainer"

    iget-object v10, p0, Lcom/android/server/PackageManagerService$InstallParams;->packageURI:Landroid/net/Uri;

    const/4 v11, 0x1

    invoke-virtual {v8, v9, v10, v11}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    .line 4998
    iget-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    #getter for: Lcom/android/server/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v8}, Lcom/android/server/PackageManagerService;->access$300(Lcom/android/server/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/PackageManagerService$InstallParams;->packageURI:Landroid/net/Uri;

    iget v10, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    invoke-interface {v8, v9, v10}, Lcom/android/internal/app/IMediaContainerService;->getMinimalPackageInfo(Landroid/net/Uri;I)Landroid/content/pm/PackageInfoLite;
    :try_end_96
    .catchall {:try_start_7d .. :try_end_96} :catchall_a8

    move-result-object v5

    .line 5000
    .local v5, pkgLite:Landroid/content/pm/PackageInfoLite;
    iget-object v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v8, v8, Lcom/android/server/PackageManagerService;->mContext:Landroid/content/Context;

    iget-object v9, p0, Lcom/android/server/PackageManagerService$InstallParams;->packageURI:Landroid/net/Uri;

    invoke-virtual {v8, v9, v12}, Landroid/content/Context;->revokeUriPermission(Landroid/net/Uri;I)V

    .line 5003
    iget v2, v5, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    .line 5004
    .local v2, loc:I
    const/4 v8, -0x3

    if-ne v2, v8, :cond_b3

    .line 5005
    const/16 v7, -0x13

    goto :goto_42

    .line 5000
    .end local v2           #loc:I
    .end local v5           #pkgLite:Landroid/content/pm/PackageInfoLite;
    :catchall_a8
    move-exception v8

    iget-object v9, p0, Lcom/android/server/PackageManagerService$InstallParams;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v9, v9, Lcom/android/server/PackageManagerService;->mContext:Landroid/content/Context;

    iget-object v10, p0, Lcom/android/server/PackageManagerService$InstallParams;->packageURI:Landroid/net/Uri;

    invoke-virtual {v9, v10, v12}, Landroid/content/Context;->revokeUriPermission(Landroid/net/Uri;I)V

    throw v8

    .line 5006
    .restart local v2       #loc:I
    .restart local v5       #pkgLite:Landroid/content/pm/PackageInfoLite;
    :cond_b3
    const/4 v8, -0x4

    if-ne v2, v8, :cond_b8

    .line 5007
    const/4 v7, -0x1

    goto :goto_42

    .line 5008
    :cond_b8
    const/4 v8, -0x1

    if-ne v2, v8, :cond_bd

    .line 5009
    const/4 v7, -0x4

    goto :goto_42

    .line 5010
    :cond_bd
    const/4 v8, -0x2

    if-ne v2, v8, :cond_c2

    .line 5011
    const/4 v7, -0x2

    goto :goto_42

    .line 5012
    :cond_c2
    const/4 v8, -0x5

    if-ne v2, v8, :cond_c9

    .line 5013
    const/16 v7, -0x14

    goto/16 :goto_42

    .line 5016
    :cond_c9
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    invoke-direct {p0, v5, v8}, Lcom/android/server/PackageManagerService$InstallParams;->installLocationPolicy(Landroid/content/pm/PackageInfoLite;I)I

    move-result v2

    .line 5017
    if-nez v4, :cond_42

    if-nez v3, :cond_42

    .line 5019
    const/4 v8, 0x2

    if-ne v2, v8, :cond_e4

    .line 5021
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    or-int/lit8 v8, v8, 0x8

    iput v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    .line 5022
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v8, v8, -0x11

    iput v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    goto/16 :goto_42

    .line 5026
    :cond_e4
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    or-int/lit8 v8, v8, 0x10

    iput v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    .line 5027
    iget v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v8, v8, -0x9

    iput v8, p0, Lcom/android/server/PackageManagerService$InstallParams;->flags:I

    goto/16 :goto_42
.end method
