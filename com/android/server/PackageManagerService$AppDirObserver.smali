.class final Lcom/android/server/PackageManagerService$AppDirObserver;
.super Landroid/os/FileObserver;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AppDirObserver"
.end annotation


# instance fields
.field private final mIsRom:Z

.field private final mRootDir:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/PackageManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/PackageManagerService;Ljava/lang/String;IZ)V
    .registers 5
    .parameter
    .parameter "path"
    .parameter "mask"
    .parameter "isrom"

    .prologue
    .line 4677
    iput-object p1, p0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    .line 4678
    invoke-direct {p0, p2, p3}, Landroid/os/FileObserver;-><init>(Ljava/lang/String;I)V

    .line 4679
    iput-object p2, p0, Lcom/android/server/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    .line 4680
    iput-boolean p4, p0, Lcom/android/server/PackageManagerService$AppDirObserver;->mIsRom:Z

    .line 4681
    return-void
.end method


# virtual methods
.method public onEvent(ILjava/lang/String;)V
    .registers 22
    .parameter "event"
    .parameter "path"

    .prologue
    .line 4684
    const/16 v17, 0x0

    .line 4685
    .local v17, removedPackage:Ljava/lang/String;
    const/16 v18, -0x1

    .line 4686
    .local v18, removedUid:I
    const/4 v12, 0x0

    .line 4687
    .local v12, addedPackage:Ljava/lang/String;
    const/4 v13, -0x1

    .line 4689
    .local v13, addedUid:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v4, v0

    iget-object v14, v4, Lcom/android/server/PackageManagerService;->mInstallLock:Ljava/lang/Object;

    monitor-enter v14

    .line 4690
    const/16 v16, 0x0

    .line 4691
    .local v16, fullPathStr:Ljava/lang/String;
    const/4 v5, 0x0

    .line 4692
    .local v5, fullPath:Ljava/io/File;
    if-eqz p2, :cond_26

    .line 4693
    :try_start_13
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    move-object v4, v0

    move-object v0, v15

    move-object v1, v4

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_21
    .catchall {:try_start_13 .. :try_end_21} :catchall_36

    .line 4694
    .end local v5           #fullPath:Ljava/io/File;
    .local v15, fullPath:Ljava/io/File;
    :try_start_21
    invoke-virtual {v15}, Ljava/io/File;->getPath()Ljava/lang/String;
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_11b

    move-result-object v16

    move-object v5, v15

    .line 4701
    .end local v15           #fullPath:Ljava/io/File;
    .restart local v5       #fullPath:Ljava/io/File;
    :cond_26
    :try_start_26
    #calls: Lcom/android/server/PackageManagerService;->isPackageFilename(Ljava/lang/String;)Z
    invoke-static/range {p2 .. p2}, Lcom/android/server/PackageManagerService;->access$1800(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2e

    .line 4704
    monitor-exit v14

    .line 4762
    .end local v5           #fullPath:Ljava/io/File;
    :cond_2d
    :goto_2d
    return-void

    .line 4709
    .restart local v5       #fullPath:Ljava/io/File;
    :cond_2e
    #calls: Lcom/android/server/PackageManagerService;->ignoreCodePath(Ljava/lang/String;)Z
    invoke-static/range {v16 .. v16}, Lcom/android/server/PackageManagerService;->access$1900(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 4710
    monitor-exit v14

    goto :goto_2d

    .line 4747
    :catchall_36
    move-exception v4

    :goto_37
    monitor-exit v14
    :try_end_38
    .catchall {:try_start_26 .. :try_end_38} :catchall_36

    throw v4

    .line 4712
    :cond_39
    const/4 v8, 0x0

    .line 4713
    .local v8, p:Landroid/content/pm/PackageParser$Package;
    :try_start_3a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v4
    :try_end_42
    .catchall {:try_start_3a .. :try_end_42} :catchall_36

    .line 4714
    :try_start_42
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v6, v0

    iget-object v6, v6, Lcom/android/server/PackageManagerService;->mAppDirs:Ljava/util/HashMap;

    move-object v0, v6

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, Landroid/content/pm/PackageParser$Package;

    move-object v8, v0

    .line 4715
    monitor-exit v4
    :try_end_55
    .catchall {:try_start_42 .. :try_end_55} :catchall_10d

    .line 4716
    move/from16 v0, p1

    and-int/lit16 v0, v0, 0x248

    move v4, v0

    if-eqz v4, :cond_75

    .line 4717
    if-eqz v8, :cond_75

    .line 4718
    :try_start_5e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v4, v0

    const/4 v6, 0x1

    invoke-virtual {v4, v8, v6}, Lcom/android/server/PackageManagerService;->removePackageLI(Landroid/content/pm/PackageParser$Package;Z)V

    .line 4719
    iget-object v4, v8, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object v0, v4

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    move-object/from16 v17, v0

    .line 4720
    iget-object v4, v8, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object v0, v4

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v18, v0

    .line 4724
    :cond_75
    move/from16 v0, p1

    and-int/lit16 v0, v0, 0x88

    move v4, v0

    if-eqz v4, :cond_c2

    .line 4725
    if-nez v8, :cond_c2

    .line 4726
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v4, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->mIsRom:Z

    move v6, v0

    if-eqz v6, :cond_110

    const/16 v6, 0x41

    :goto_8c
    or-int/lit8 v6, v6, 0x2

    or-int/lit8 v6, v6, 0x4

    const/16 v7, 0x61

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .end local v8           #p:Landroid/content/pm/PackageParser$Package;
    #calls: Lcom/android/server/PackageManagerService;->scanPackageLI(Ljava/io/File;IIJ)Landroid/content/pm/PackageParser$Package;
    invoke-static/range {v4 .. v9}, Lcom/android/server/PackageManagerService;->access$2000(Lcom/android/server/PackageManagerService;Ljava/io/File;IIJ)Landroid/content/pm/PackageParser$Package;

    move-result-object v8

    .line 4733
    .restart local v8       #p:Landroid/content/pm/PackageParser$Package;
    if-eqz v8, :cond_c2

    .line 4734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v4
    :try_end_a4
    .catchall {:try_start_5e .. :try_end_a4} :catchall_36

    .line 4735
    :try_start_a4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v6, v0

    iget-object v7, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    iget-object v9, v8, Landroid/content/pm/PackageParser$Package;->permissions:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_113

    const/4 v9, 0x1

    :goto_b4
    const/4 v10, 0x0

    const/4 v11, 0x0

    #calls: Lcom/android/server/PackageManagerService;->updatePermissionsLP(Ljava/lang/String;Landroid/content/pm/PackageParser$Package;ZZZ)V
    invoke-static/range {v6 .. v11}, Lcom/android/server/PackageManagerService;->access$2100(Lcom/android/server/PackageManagerService;Ljava/lang/String;Landroid/content/pm/PackageParser$Package;ZZZ)V

    .line 4737
    monitor-exit v4
    :try_end_ba
    .catchall {:try_start_a4 .. :try_end_ba} :catchall_115

    .line 4738
    :try_start_ba
    iget-object v4, v8, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v12, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 4739
    iget-object v4, v8, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v13, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 4744
    :cond_c2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v4
    :try_end_ca
    .catchall {:try_start_ba .. :try_end_ca} :catchall_36

    .line 4745
    :try_start_ca
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/PackageManagerService;

    move-object v6, v0

    iget-object v6, v6, Lcom/android/server/PackageManagerService;->mSettings:Lcom/android/server/PackageManagerService$Settings;

    invoke-virtual {v6}, Lcom/android/server/PackageManagerService$Settings;->writeLP()V

    .line 4746
    monitor-exit v4
    :try_end_d5
    .catchall {:try_start_ca .. :try_end_d5} :catchall_118

    .line 4747
    :try_start_d5
    monitor-exit v14
    :try_end_d6
    .catchall {:try_start_d5 .. :try_end_d6} :catchall_36

    .line 4749
    if-eqz v17, :cond_f8

    .line 4750
    new-instance v14, Landroid/os/Bundle;

    const/4 v4, 0x1

    invoke-direct {v14, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 4751
    .local v14, extras:Landroid/os/Bundle;
    const-string v4, "android.intent.extra.UID"

    move-object v0, v14

    move-object v1, v4

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4752
    const-string v4, "android.intent.extra.DATA_REMOVED"

    const/4 v5, 0x0

    invoke-virtual {v14, v4, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 4753
    .end local v5           #fullPath:Ljava/io/File;
    const-string v4, "android.intent.action.PACKAGE_REMOVED"

    const/4 v5, 0x0

    move-object v0, v4

    move-object/from16 v1, v17

    move-object v2, v14

    move-object v3, v5

    #calls: Lcom/android/server/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/content/IIntentReceiver;)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/server/PackageManagerService;->access$600(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/content/IIntentReceiver;)V

    .line 4756
    .end local v14           #extras:Landroid/os/Bundle;
    :cond_f8
    if-eqz v12, :cond_2d

    .line 4757
    new-instance v14, Landroid/os/Bundle;

    const/4 v4, 0x1

    invoke-direct {v14, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 4758
    .restart local v14       #extras:Landroid/os/Bundle;
    const-string v4, "android.intent.extra.UID"

    invoke-virtual {v14, v4, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4759
    const-string v4, "android.intent.action.PACKAGE_ADDED"

    const/4 v5, 0x0

    #calls: Lcom/android/server/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/content/IIntentReceiver;)V
    invoke-static {v4, v12, v14, v5}, Lcom/android/server/PackageManagerService;->access$600(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/content/IIntentReceiver;)V

    goto/16 :goto_2d

    .line 4715
    .end local v14           #extras:Landroid/os/Bundle;
    .restart local v5       #fullPath:Ljava/io/File;
    :catchall_10d
    move-exception v6

    :try_start_10e
    monitor-exit v4
    :try_end_10f
    .catchall {:try_start_10e .. :try_end_10f} :catchall_10d

    :try_start_10f
    throw v6
    :try_end_110
    .catchall {:try_start_10f .. :try_end_110} :catchall_36

    .line 4726
    :cond_110
    const/4 v6, 0x0

    goto/16 :goto_8c

    .line 4735
    :cond_113
    const/4 v9, 0x0

    goto :goto_b4

    .line 4737
    :catchall_115
    move-exception v6

    :try_start_116
    monitor-exit v4
    :try_end_117
    .catchall {:try_start_116 .. :try_end_117} :catchall_115

    :try_start_117
    throw v6
    :try_end_118
    .catchall {:try_start_117 .. :try_end_118} :catchall_36

    .line 4746
    :catchall_118
    move-exception v6

    :try_start_119
    monitor-exit v4
    :try_end_11a
    .catchall {:try_start_119 .. :try_end_11a} :catchall_118

    :try_start_11a
    throw v6
    :try_end_11b
    .catchall {:try_start_11a .. :try_end_11b} :catchall_36

    .line 4747
    .end local v5           #fullPath:Ljava/io/File;
    .end local v8           #p:Landroid/content/pm/PackageParser$Package;
    .restart local v15       #fullPath:Ljava/io/File;
    :catchall_11b
    move-exception v4

    move-object v5, v15

    .end local v15           #fullPath:Ljava/io/File;
    .restart local v5       #fullPath:Ljava/io/File;
    goto/16 :goto_37
.end method
