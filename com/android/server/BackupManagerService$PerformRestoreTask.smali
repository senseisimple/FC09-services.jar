.class Lcom/android/server/BackupManagerService$PerformRestoreTask;
.super Ljava/lang/Object;
.source "BackupManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PerformRestoreTask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/BackupManagerService$PerformRestoreTask$RestoreRequest;
    }
.end annotation


# instance fields
.field private mNeedFullBackup:Z

.field private mObserver:Landroid/app/backup/IRestoreObserver;

.field private mPmToken:I

.field private mStateDir:Ljava/io/File;

.field private mTargetPackage:Landroid/content/pm/PackageInfo;

.field private mToken:J

.field private mTransport:Lcom/android/internal/backup/IBackupTransport;

.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Landroid/app/backup/IRestoreObserver;JLandroid/content/pm/PackageInfo;IZ)V
    .registers 12
    .parameter
    .parameter "transport"
    .parameter "observer"
    .parameter "restoreSetToken"
    .parameter "targetPackage"
    .parameter "pmToken"
    .parameter "needFullBackup"

    .prologue
    .line 1581
    iput-object p1, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1582
    iput-object p2, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    .line 1583
    iput-object p3, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    .line 1584
    iput-wide p4, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    .line 1585
    iput-object p6, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    .line 1586
    iput p7, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    .line 1587
    iput-boolean p8, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mNeedFullBackup:Z

    .line 1590
    :try_start_11
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/android/server/BackupManagerService;->mBaseStateDir:Ljava/io/File;

    invoke-interface {p2}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mStateDir:Ljava/io/File;
    :try_end_1e
    .catch Landroid/os/RemoteException; {:try_start_11 .. :try_end_1e} :catch_1f

    .line 1594
    :goto_1e
    return-void

    .line 1591
    :catch_1f
    move-exception v0

    goto :goto_1e
.end method


# virtual methods
.method processOneRestore(Landroid/content/pm/PackageInfo;ILandroid/app/IBackupAgent;Z)V
    .registers 21
    .parameter "app"
    .parameter "appVersionCode"
    .parameter "agent"
    .parameter "needFullBackup"

    .prologue
    .line 1837
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object v10, v0

    .line 1842
    .local v10, packageName:Ljava/lang/String;
    new-instance v7, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mDataDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".restore"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1843
    .local v7, backupDataName:Ljava/io/File;
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mStateDir:Ljava/io/File;

    move-object v1, v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".new"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v9, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1844
    .local v9, newStateName:Ljava/io/File;
    new-instance v11, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mStateDir:Ljava/io/File;

    move-object v1, v0

    invoke-direct {v11, v1, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1846
    .local v11, savedStateName:Ljava/io/File;
    const/4 v2, 0x0

    .line 1847
    .local v2, backupData:Landroid/os/ParcelFileDescriptor;
    const/4 v4, 0x0

    .line 1849
    .local v4, newState:Landroid/os/ParcelFileDescriptor;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mTokenGenerator:Ljava/util/Random;

    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    move-result v5

    .line 1852
    .local v5, token:I
    const/high16 v1, 0x3c00

    :try_start_5a
    invoke-static {v7, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 1857
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object v1, v0

    invoke-interface {v1, v2}, Lcom/android/internal/backup/IBackupTransport;->getRestoreData(Landroid/os/ParcelFileDescriptor;)I

    move-result v1

    if-eqz v1, :cond_a6

    .line 1858
    const-string v1, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error getting restore data for "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1859
    const/16 v1, 0xb0f

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v3}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_89
    .catchall {:try_start_5a .. :try_end_89} :catchall_169
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_89} :catch_e1

    .line 1909
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1910
    if-eqz v2, :cond_91

    :try_start_8e
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_91
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_91} :catch_191

    .line 1911
    :cond_91
    :goto_91
    if-eqz v4, :cond_94

    :try_start_93
    throw v4
    :try_end_94
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_94} :catch_194

    .line 1912
    :cond_94
    :goto_94
    const/4 v4, 0x0

    move-object v2, v4

    .line 1913
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v5}, Landroid/util/SparseIntArray;->delete(I)V

    .line 1919
    if-eqz p4, :cond_a5

    .line 1920
    :goto_a2
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 1923
    :cond_a5
    return-void

    .line 1864
    :cond_a6
    :try_start_a6
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 1865
    const/high16 v1, 0x1000

    invoke-static {v7, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 1868
    const/high16 v1, 0x3c00

    invoke-static {v9, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v4

    .line 1874
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    const-wide/32 v14, 0xea60

    invoke-virtual {v1, v5, v14, v15}, Lcom/android/server/BackupManagerService;->prepareOperationTimeout(IJ)V

    .line 1875
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    iget-object v6, v1, Lcom/android/server/BackupManagerService;->mBackupManagerBinder:Landroid/app/backup/IBackupManager;

    move-object/from16 v1, p3

    move/from16 v3, p2

    invoke-interface/range {v1 .. v6}, Landroid/app/IBackupAgent;->doRestore(Landroid/os/ParcelFileDescriptor;ILandroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;)V

    .line 1876
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    invoke-virtual {v1, v5}, Lcom/android/server/BackupManagerService;->waitUntilOperationComplete(I)Z

    move-result v13

    .line 1878
    .local v13, success:Z
    if-nez v13, :cond_132

    .line 1879
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "restore timeout"

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_e1
    .catchall {:try_start_a6 .. :try_end_e1} :catchall_169
    .catch Ljava/lang/Exception; {:try_start_a6 .. :try_end_e1} :catch_e1

    .line 1900
    .end local v13           #success:Z
    :catch_e1
    move-exception v1

    move-object v8, v1

    .line 1901
    .local v8, e:Ljava/lang/Exception;
    :try_start_e3
    const-string v1, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error restoring data for "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1902
    const/16 v1, 0xb10

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v10, v3, v6

    const/4 v6, 0x1

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    .end local v8           #e:Ljava/lang/Exception;
    aput-object v8, v3, v6

    invoke-static {v1, v3}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 1907
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    invoke-virtual {v1, v10}, Lcom/android/server/BackupManagerService;->clearApplicationDataSynchronous(Ljava/lang/String;)V
    :try_end_115
    .catchall {:try_start_e3 .. :try_end_115} :catchall_169

    .line 1909
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1910
    if-eqz v2, :cond_11d

    :try_start_11a
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_11d
    .catch Ljava/io/IOException; {:try_start_11a .. :try_end_11d} :catch_18d

    .line 1911
    :cond_11d
    :goto_11d
    if-eqz v4, :cond_122

    :try_start_11f
    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_122
    .catch Ljava/io/IOException; {:try_start_11f .. :try_end_122} :catch_18f

    .line 1912
    :cond_122
    :goto_122
    const/4 v4, 0x0

    move-object v2, v4

    .line 1913
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v5}, Landroid/util/SparseIntArray;->delete(I)V

    .line 1919
    if-eqz p4, :cond_a5

    goto/16 :goto_a2

    .line 1895
    .restart local v13       #success:Z
    :cond_132
    :try_start_132
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 1898
    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v14

    long-to-int v12, v14

    .line 1899
    .local v12, size:I
    const/16 v1, 0xb11

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v10, v3, v6

    const/4 v6, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v3, v6

    invoke-static {v1, v3}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_14c
    .catchall {:try_start_132 .. :try_end_14c} :catchall_169
    .catch Ljava/lang/Exception; {:try_start_132 .. :try_end_14c} :catch_e1

    .line 1909
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1910
    if-eqz v2, :cond_154

    :try_start_151
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_154
    .catch Ljava/io/IOException; {:try_start_151 .. :try_end_154} :catch_197

    .line 1911
    :cond_154
    :goto_154
    if-eqz v4, :cond_159

    :try_start_156
    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_159
    .catch Ljava/io/IOException; {:try_start_156 .. :try_end_159} :catch_199

    .line 1912
    :cond_159
    :goto_159
    const/4 v4, 0x0

    move-object v2, v4

    .line 1913
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v1, v0

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v5}, Landroid/util/SparseIntArray;->delete(I)V

    .line 1919
    if-eqz p4, :cond_a5

    goto/16 :goto_a2

    .line 1909
    .end local v12           #size:I
    .end local v13           #success:Z
    :catchall_169
    move-exception v1

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1910
    if-eqz v2, :cond_172

    :try_start_16f
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_172
    .catch Ljava/io/IOException; {:try_start_16f .. :try_end_172} :catch_189

    .line 1911
    .end local v2           #backupData:Landroid/os/ParcelFileDescriptor;
    :cond_172
    :goto_172
    if-eqz v4, :cond_177

    :try_start_174
    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_177
    .catch Ljava/io/IOException; {:try_start_174 .. :try_end_177} :catch_18b

    .line 1912
    :cond_177
    :goto_177
    const/4 v4, 0x0

    move-object v2, v4

    .line 1913
    .restart local v2       #backupData:Landroid/os/ParcelFileDescriptor;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object v2, v0

    .end local v2           #backupData:Landroid/os/ParcelFileDescriptor;
    iget-object v2, v2, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v5}, Landroid/util/SparseIntArray;->delete(I)V

    .line 1919
    if-eqz p4, :cond_188

    .line 1920
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 1909
    :cond_188
    throw v1

    .line 1910
    .restart local v2       #backupData:Landroid/os/ParcelFileDescriptor;
    :catch_189
    move-exception v2

    goto :goto_172

    .line 1911
    .end local v2           #backupData:Landroid/os/ParcelFileDescriptor;
    :catch_18b
    move-exception v2

    goto :goto_177

    .line 1910
    .restart local v2       #backupData:Landroid/os/ParcelFileDescriptor;
    :catch_18d
    move-exception v1

    goto :goto_11d

    .line 1911
    :catch_18f
    move-exception v1

    goto :goto_122

    .line 1910
    :catch_191
    move-exception v1

    goto/16 :goto_91

    .line 1911
    :catch_194
    move-exception v1

    goto/16 :goto_94

    .line 1910
    .restart local v12       #size:I
    .restart local v13       #success:Z
    :catch_197
    move-exception v1

    goto :goto_154

    .line 1911
    :catch_199
    move-exception v1

    goto :goto_159
.end method

.method public run()V
    .registers 28

    .prologue
    .line 1597
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v20

    .line 1602
    .local v20, startRealtime:J
    const/16 v17, 0x0

    .line 1603
    .local v17, pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    const/4 v9, -0x1

    .line 1608
    .local v9, error:I
    const/16 v22, 0xb0e

    const/16 v23, 0x2

    :try_start_b
    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    move-wide/from16 v25, v0

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 1612
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 1613
    .local v19, restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    new-instance v14, Landroid/content/pm/PackageInfo;

    invoke-direct {v14}, Landroid/content/pm/PackageInfo;-><init>()V

    .line 1614
    .local v14, omPackage:Landroid/content/pm/PackageInfo;
    const-string v22, "@pm@"

    move-object/from16 v0, v22

    move-object v1, v14

    iput-object v0, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 1615
    move-object/from16 v0, v19

    move-object v1, v14

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1617
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->allAgentPackages()Ljava/util/List;

    move-result-object v6

    .line 1618
    .local v6, agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_127

    .line 1619
    move-object/from16 v0, v19

    move-object v1, v6

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1626
    :goto_5f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0
    :try_end_65
    .catchall {:try_start_b .. :try_end_65} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_65} :catch_136

    if-eqz v22, :cond_74

    .line 1630
    :try_start_67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v23

    invoke-interface/range {v22 .. v23}, Landroid/app/backup/IRestoreObserver;->restoreStarting(I)V
    :try_end_74
    .catchall {:try_start_67 .. :try_end_74} :catchall_1d6
    .catch Landroid/os/RemoteException; {:try_start_67 .. :try_end_74} :catch_1c2
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_74} :catch_136

    .line 1637
    :cond_74
    :goto_74
    :try_start_74
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    move-wide/from16 v23, v0

    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Landroid/content/pm/PackageInfo;

    move-object/from16 v25, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Landroid/content/pm/PackageInfo;

    move-object/from16 v0, v22

    move-wide/from16 v1, v23

    move-object v3, v5

    invoke-interface {v0, v1, v2, v3}, Lcom/android/internal/backup/IBackupTransport;->startRestore(J[Landroid/content/pm/PackageInfo;)I

    move-result v22

    if-eqz v22, :cond_256

    .line 1639
    const-string v22, "BackupManagerService"

    const-string v23, "Error starting restore operation"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1640
    const/16 v22, 0xb0f

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_b1
    .catchall {:try_start_74 .. :try_end_b1} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_74 .. :try_end_b1} :catch_136

    .line 1797
    :try_start_b1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_ba
    .catch Landroid/os/RemoteException; {:try_start_b1 .. :try_end_ba} :catch_944

    .line 1802
    :goto_ba
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_ce

    .line 1804
    :try_start_c2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_ce
    .catch Landroid/os/RemoteException; {:try_start_c2 .. :try_end_ce} :catch_955

    .line 1813
    :cond_ce
    :goto_ce
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_fa

    if-eqz v17, :cond_fa

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    throw v17

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    throw v1

    .line 1815
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    throw v0

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    throw v2

    .line 1816
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    throw v22

    .line 1821
    :cond_fa
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_117

    .line 1824
    :try_start_102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_117
    .catch Landroid/os/RemoteException; {:try_start_102 .. :try_end_117} :catch_a21

    .line 1829
    :cond_117
    :goto_117
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    .end local v6           #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v14           #omPackage:Landroid/content/pm/PackageInfo;
    .end local v19           #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :goto_123
    invoke-virtual/range {v22 .. v22}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1831
    :goto_126
    return-void

    .line 1622
    .restart local v6       #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .restart local v14       #omPackage:Landroid/content/pm/PackageInfo;
    .restart local v19       #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :cond_127
    :try_start_127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_134
    .catchall {:try_start_127 .. :try_end_134} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_127 .. :try_end_134} :catch_136

    goto/16 :goto_5f

    .line 1791
    .end local v6           #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v14           #omPackage:Landroid/content/pm/PackageInfo;
    .end local v19           #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :catch_136
    move-exception v22

    move-object/from16 v8, v22

    .line 1792
    .local v8, e:Ljava/lang/Exception;
    :goto_139
    :try_start_139
    const-string v22, "BackupManagerService"

    const-string v23, "Error in restore thread"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_145
    .catchall {:try_start_139 .. :try_end_145} :catchall_1d6

    .line 1797
    :try_start_145
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_14e
    .catch Landroid/os/RemoteException; {:try_start_145 .. :try_end_14e} :catch_927

    .line 1802
    .end local v8           #e:Ljava/lang/Exception;
    :goto_14e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_162

    .line 1804
    :try_start_156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_162
    .catch Landroid/os/RemoteException; {:try_start_156 .. :try_end_162} :catch_938

    .line 1813
    :cond_162
    :goto_162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_197

    if-eqz v17, :cond_197

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/server/PackageManagerBackupAgent;->getRestoredPackages()Ljava/util/Set;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    iput-object v0, v1, Lcom/android/server/BackupManagerService;->mAncestralPackages:Ljava/util/Set;

    .line 1815
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    iput-wide v0, v2, Lcom/android/server/BackupManagerService;->mAncestralToken:J

    .line 1816
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->writeRestoreTokens()V

    .line 1821
    :cond_197
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_1b4

    .line 1824
    :try_start_19f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_1b4
    .catch Landroid/os/RemoteException; {:try_start_19f .. :try_end_1b4} :catch_a24

    .line 1829
    :cond_1b4
    :goto_1b4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    goto/16 :goto_123

    .line 1631
    .restart local v6       #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .restart local v14       #omPackage:Landroid/content/pm/PackageInfo;
    .restart local v19       #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :catch_1c2
    move-exception v22

    move-object/from16 v8, v22

    .line 1632
    .local v8, e:Landroid/os/RemoteException;
    :try_start_1c5
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreStarting"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1633
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;
    :try_end_1d4
    .catchall {:try_start_1c5 .. :try_end_1d4} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_1c5 .. :try_end_1d4} :catch_136

    goto/16 :goto_74

    .line 1794
    .end local v6           #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v8           #e:Landroid/os/RemoteException;
    .end local v14           #omPackage:Landroid/content/pm/PackageInfo;
    .end local v19           #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :catchall_1d6
    move-exception v22

    .line 1797
    :goto_1d7
    :try_start_1d7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_1e0
    .catch Landroid/os/RemoteException; {:try_start_1d7 .. :try_end_1e0} :catch_90a

    .line 1802
    :goto_1e0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v23, v0

    if-eqz v23, :cond_1f4

    .line 1804
    :try_start_1e8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_1f4
    .catch Landroid/os/RemoteException; {:try_start_1e8 .. :try_end_1f4} :catch_91b

    .line 1813
    :cond_1f4
    :goto_1f4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v23, v0

    if-nez v23, :cond_229

    if-eqz v17, :cond_229

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v23, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/server/PackageManagerBackupAgent;->getRestoredPackages()Ljava/util/Set;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/android/server/BackupManagerService;->mAncestralPackages:Ljava/util/Set;

    .line 1815
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    iput-wide v0, v2, Lcom/android/server/BackupManagerService;->mAncestralToken:J

    .line 1816
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/server/BackupManagerService;->writeRestoreTokens()V

    .line 1821
    :cond_229
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    if-lez v23, :cond_246

    .line 1824
    :try_start_231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v24, v0

    invoke-interface/range {v23 .. v24}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_246
    .catch Landroid/os/RemoteException; {:try_start_231 .. :try_end_246} :catch_a27

    .line 1829
    :cond_246
    :goto_246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1794
    throw v22

    .line 1644
    .restart local v6       #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .restart local v14       #omPackage:Landroid/content/pm/PackageInfo;
    .restart local v19       #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :cond_256
    :try_start_256
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->nextRestorePackage()Ljava/lang/String;

    move-result-object v16

    .line 1645
    .local v16, packageName:Ljava/lang/String;
    if-nez v16, :cond_2ea

    .line 1646
    const-string v22, "BackupManagerService"

    const-string v23, "Error getting first restore package"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1647
    const/16 v22, 0xb0f

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_276
    .catchall {:try_start_256 .. :try_end_276} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_256 .. :try_end_276} :catch_136

    .line 1797
    :try_start_276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_27f
    .catch Landroid/os/RemoteException; {:try_start_276 .. :try_end_27f} :catch_961

    .line 1802
    :goto_27f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_293

    .line 1804
    :try_start_287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_293
    .catch Landroid/os/RemoteException; {:try_start_287 .. :try_end_293} :catch_972

    .line 1813
    :cond_293
    :goto_293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_2bf

    if-eqz v17, :cond_2bf

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    throw v17

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    throw v1

    .line 1815
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    throw v0

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    throw v2

    .line 1816
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    throw v22

    .line 1821
    :cond_2bf
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_2dc

    .line 1824
    :try_start_2c7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_2dc
    .catch Landroid/os/RemoteException; {:try_start_2c7 .. :try_end_2dc} :catch_a1e

    .line 1829
    :cond_2dc
    :goto_2dc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    goto/16 :goto_123

    .line 1649
    :cond_2ea
    :try_start_2ea
    const-string v22, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_39a

    .line 1650
    const-string v22, "BackupManagerService"

    const-string v23, "No restore data available"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1651
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v22

    sub-long v22, v22, v20

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move v13, v0

    .line 1652
    .local v13, millis:I
    const/16 v22, 0xb12

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_326
    .catchall {:try_start_2ea .. :try_end_326} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_2ea .. :try_end_326} :catch_136

    .line 1797
    :try_start_326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_32f
    .catch Landroid/os/RemoteException; {:try_start_326 .. :try_end_32f} :catch_97e

    .line 1802
    :goto_32f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_343

    .line 1804
    :try_start_337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_343
    .catch Landroid/os/RemoteException; {:try_start_337 .. :try_end_343} :catch_98f

    .line 1813
    :cond_343
    :goto_343
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_36f

    if-eqz v17, :cond_36f

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    throw v17

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    throw v1

    .line 1815
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    throw v0

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    throw v2

    .line 1816
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    throw v22

    .line 1821
    :cond_36f
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_38c

    .line 1824
    :try_start_377
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_38c
    .catch Landroid/os/RemoteException; {:try_start_377 .. :try_end_38c} :catch_a1b

    .line 1829
    :cond_38c
    :goto_38c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    goto/16 :goto_123

    .line 1654
    .end local v13           #millis:I
    :cond_39a
    :try_start_39a
    const-string v22, "@pm@"

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_455

    .line 1655
    const-string v22, "BackupManagerService"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Expected restore data for \"@pm@\", found only \""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1657
    const/16 v22, 0xb10

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "@pm@"

    aput-object v25, v23, v24

    const/16 v24, 0x1

    const-string v25, "Package manager data missing"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_3e1
    .catchall {:try_start_39a .. :try_end_3e1} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_39a .. :try_end_3e1} :catch_136

    .line 1797
    :try_start_3e1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_3ea
    .catch Landroid/os/RemoteException; {:try_start_3e1 .. :try_end_3ea} :catch_99b

    .line 1802
    :goto_3ea
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_3fe

    .line 1804
    :try_start_3f2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_3fe
    .catch Landroid/os/RemoteException; {:try_start_3f2 .. :try_end_3fe} :catch_9ac

    .line 1813
    :cond_3fe
    :goto_3fe
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_42a

    if-eqz v17, :cond_42a

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    throw v17

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    throw v1

    .line 1815
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    throw v0

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    throw v2

    .line 1816
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v22, v0

    throw v22

    .line 1821
    :cond_42a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_447

    .line 1824
    :try_start_432
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_447
    .catch Landroid/os/RemoteException; {:try_start_432 .. :try_end_447} :catch_a18

    .line 1829
    :cond_447
    :goto_447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    goto/16 :goto_123

    .line 1663
    :cond_455
    :try_start_455
    new-instance v18, Lcom/android/server/PackageManagerBackupAgent;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->access$500(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v22

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move-object v2, v6

    invoke-direct {v0, v1, v2}, Lcom/android/server/PackageManagerBackupAgent;-><init>(Landroid/content/pm/PackageManager;Ljava/util/List;)V
    :try_end_469
    .catchall {:try_start_455 .. :try_end_469} :catchall_1d6
    .catch Ljava/lang/Exception; {:try_start_455 .. :try_end_469} :catch_136

    .line 1665
    .end local v17           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .local v18, pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    const/16 v22, 0x0

    :try_start_46b
    invoke-virtual/range {v18 .. v18}, Lcom/android/server/PackageManagerBackupAgent;->onBind()Landroid/os/IBinder;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Landroid/app/IBackupAgent$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/IBackupAgent;

    move-result-object v23

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mNeedFullBackup:Z

    move/from16 v24, v0

    move-object/from16 v0, p0

    move-object v1, v14

    move/from16 v2, v22

    move-object/from16 v3, v23

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/server/BackupManagerService$PerformRestoreTask;->processOneRestore(Landroid/content/pm/PackageInfo;ILandroid/app/IBackupAgent;Z)V

    .line 1671
    invoke-virtual/range {v18 .. v18}, Lcom/android/server/PackageManagerBackupAgent;->hasMetadata()Z

    move-result v22

    if-nez v22, :cond_52d

    .line 1672
    const-string v22, "BackupManagerService"

    const-string v23, "No restore metadata available, so not restoring settings"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1673
    const/16 v22, 0xb10

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "@pm@"

    aput-object v25, v23, v24

    const/16 v24, 0x1

    const-string v25, "Package manager restore metadata missing"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_4ab
    .catchall {:try_start_46b .. :try_end_4ab} :catchall_6f5
    .catch Ljava/lang/Exception; {:try_start_46b .. :try_end_4ab} :catch_6db

    .line 1797
    :try_start_4ab
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_4b4
    .catch Landroid/os/RemoteException; {:try_start_4ab .. :try_end_4b4} :catch_9b8

    .line 1802
    :goto_4b4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_4c8

    .line 1804
    :try_start_4bc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_4c8
    .catch Landroid/os/RemoteException; {:try_start_4bc .. :try_end_4c8} :catch_9c9

    .line 1813
    :cond_4c8
    :goto_4c8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_4fd

    if-eqz v18, :cond_4fd

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/server/PackageManagerBackupAgent;->getRestoredPackages()Ljava/util/Set;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    iput-object v0, v1, Lcom/android/server/BackupManagerService;->mAncestralPackages:Ljava/util/Set;

    .line 1815
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    iput-wide v0, v2, Lcom/android/server/BackupManagerService;->mAncestralToken:J

    .line 1816
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->writeRestoreTokens()V

    .line 1821
    :cond_4fd
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_51a

    .line 1824
    :try_start_505
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_51a
    .catch Landroid/os/RemoteException; {:try_start_505 .. :try_end_51a} :catch_a15

    .line 1829
    :cond_51a
    :goto_51a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/os/PowerManager$WakeLock;->release()V

    move-object/from16 v17, v18

    .line 1675
    .end local v18           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v17       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    goto/16 :goto_126

    .line 1678
    .end local v17           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v18       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :cond_52d
    const/4 v7, 0x0

    .line 1680
    .local v7, count:I
    :cond_52e
    :goto_52e
    :try_start_52e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->nextRestorePackage()Ljava/lang/String;

    move-result-object v16

    .line 1682
    if-nez v16, :cond_5d0

    .line 1683
    const-string v22, "BackupManagerService"

    const-string v23, "Error getting next restore package"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1684
    const/16 v22, 0xb0f

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_54e
    .catchall {:try_start_52e .. :try_end_54e} :catchall_6f5
    .catch Ljava/lang/Exception; {:try_start_52e .. :try_end_54e} :catch_6db

    .line 1797
    :try_start_54e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_557
    .catch Landroid/os/RemoteException; {:try_start_54e .. :try_end_557} :catch_9d5

    .line 1802
    :goto_557
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_56b

    .line 1804
    :try_start_55f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_56b
    .catch Landroid/os/RemoteException; {:try_start_55f .. :try_end_56b} :catch_9e6

    .line 1813
    :cond_56b
    :goto_56b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_5a0

    if-eqz v18, :cond_5a0

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/server/PackageManagerBackupAgent;->getRestoredPackages()Ljava/util/Set;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    iput-object v0, v1, Lcom/android/server/BackupManagerService;->mAncestralPackages:Ljava/util/Set;

    .line 1815
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    iput-wide v0, v2, Lcom/android/server/BackupManagerService;->mAncestralToken:J

    .line 1816
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->writeRestoreTokens()V

    .line 1821
    :cond_5a0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_5bd

    .line 1824
    :try_start_5a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_5bd
    .catch Landroid/os/RemoteException; {:try_start_5a8 .. :try_end_5bd} :catch_a12

    .line 1829
    :cond_5bd
    :goto_5bd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/os/PowerManager$WakeLock;->release()V

    move-object/from16 v17, v18

    .line 1685
    .end local v18           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v17       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    goto/16 :goto_126

    .line 1686
    .end local v17           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v18       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :cond_5d0
    :try_start_5d0
    const-string v22, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_686

    .line 1788
    const/4 v9, 0x0

    .line 1789
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v22

    sub-long v22, v22, v20

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move v13, v0

    .line 1790
    .restart local v13       #millis:I
    const/16 v22, 0xb12

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_604
    .catchall {:try_start_5d0 .. :try_end_604} :catchall_6f5
    .catch Ljava/lang/Exception; {:try_start_5d0 .. :try_end_604} :catch_6db

    .line 1797
    :try_start_604
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_60d
    .catch Landroid/os/RemoteException; {:try_start_604 .. :try_end_60d} :catch_9f2

    .line 1802
    :goto_60d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    if-eqz v22, :cond_621

    .line 1804
    :try_start_615
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    invoke-interface {v0, v1}, Landroid/app/backup/IRestoreObserver;->restoreFinished(I)V
    :try_end_621
    .catch Landroid/os/RemoteException; {:try_start_615 .. :try_end_621} :catch_a03

    .line 1813
    :cond_621
    :goto_621
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_656

    if-eqz v18, :cond_656

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/server/PackageManagerBackupAgent;->getRestoredPackages()Ljava/util/Set;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    iput-object v0, v1, Lcom/android/server/BackupManagerService;->mAncestralPackages:Ljava/util/Set;

    .line 1815
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mToken:J

    move-wide/from16 v23, v0

    move-wide/from16 v0, v23

    move-object/from16 v2, v22

    iput-wide v0, v2, Lcom/android/server/BackupManagerService;->mAncestralToken:J

    .line 1816
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->writeRestoreTokens()V

    .line 1821
    :cond_656
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v22, v0

    if-lez v22, :cond_673

    .line 1824
    :try_start_65e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mPackageManagerBinder:Landroid/content/pm/IPackageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mPmToken:I

    move/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/content/pm/IPackageManager;->finishPackageInstall(I)V
    :try_end_673
    .catch Landroid/os/RemoteException; {:try_start_65e .. :try_end_673} :catch_a0f

    .line 1829
    :cond_673
    :goto_673
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/os/PowerManager$WakeLock;->release()V

    move-object/from16 v17, v18

    .line 1830
    .end local v18           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v17       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    goto/16 :goto_126

    .line 1691
    .end local v13           #millis:I
    .end local v17           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v18       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :cond_686
    :try_start_686
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0
    :try_end_68c
    .catchall {:try_start_686 .. :try_end_68c} :catchall_6f5
    .catch Ljava/lang/Exception; {:try_start_686 .. :try_end_68c} :catch_6db

    if-eqz v22, :cond_69c

    .line 1693
    :try_start_68e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v7

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2}, Landroid/app/backup/IRestoreObserver;->onUpdate(ILjava/lang/String;)V
    :try_end_69c
    .catchall {:try_start_68e .. :try_end_69c} :catchall_6f5
    .catch Landroid/os/RemoteException; {:try_start_68e .. :try_end_69c} :catch_6e2
    .catch Ljava/lang/Exception; {:try_start_68e .. :try_end_69c} :catch_6db

    .line 1700
    :cond_69c
    :goto_69c
    :try_start_69c
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/server/PackageManagerBackupAgent;->getRestoredMetadata(Ljava/lang/String;)Lcom/android/server/PackageManagerBackupAgent$Metadata;

    move-result-object v12

    .line 1701
    .local v12, metaInfo:Lcom/android/server/PackageManagerBackupAgent$Metadata;
    if-nez v12, :cond_6fa

    .line 1702
    const-string v22, "BackupManagerService"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Missing metadata for "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1703
    const/16 v22, 0xb10

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v16, v23, v24

    const/16 v24, 0x1

    const-string v25, "Package metadata missing"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    goto/16 :goto_52e

    .line 1791
    .end local v7           #count:I
    .end local v12           #metaInfo:Lcom/android/server/PackageManagerBackupAgent$Metadata;
    :catch_6db
    move-exception v22

    move-object/from16 v8, v22

    move-object/from16 v17, v18

    .end local v18           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v17       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    goto/16 :goto_139

    .line 1694
    .end local v17           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v7       #count:I
    .restart local v18       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :catch_6e2
    move-exception v22

    move-object/from16 v8, v22

    .line 1695
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died in onUpdate"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1696
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mObserver:Landroid/app/backup/IRestoreObserver;
    :try_end_6f4
    .catchall {:try_start_69c .. :try_end_6f4} :catchall_6f5
    .catch Ljava/lang/Exception; {:try_start_69c .. :try_end_6f4} :catch_6db

    goto :goto_69c

    .line 1794
    .end local v7           #count:I
    .end local v8           #e:Landroid/os/RemoteException;
    :catchall_6f5
    move-exception v22

    move-object/from16 v17, v18

    .end local v18           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v17       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    goto/16 :goto_1d7

    .line 1710
    .end local v17           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v7       #count:I
    .restart local v12       #metaInfo:Lcom/android/server/PackageManagerBackupAgent$Metadata;
    .restart local v18       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :cond_6fa
    const/16 v10, 0x40

    .line 1711
    .local v10, flags:I
    :try_start_6fc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->access$500(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    move v2, v10

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_70e
    .catchall {:try_start_6fc .. :try_end_70e} :catchall_6f5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6fc .. :try_end_70e} :catch_797
    .catch Ljava/lang/Exception; {:try_start_6fc .. :try_end_70e} :catch_6db

    move-result-object v15

    .line 1719
    .local v15, packageInfo:Landroid/content/pm/PackageInfo;
    :try_start_70f
    move-object v0, v12

    iget v0, v0, Lcom/android/server/PackageManagerBackupAgent$Metadata;->versionCode:I

    move/from16 v22, v0

    move-object v0, v15

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_7bf

    .line 1723
    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v22, v0

    const/high16 v23, 0x2

    and-int v22, v22, v23

    if-nez v22, :cond_7bf

    .line 1725
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Version "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object v0, v12

    iget v0, v0, Lcom/android/server/PackageManagerBackupAgent$Metadata;->versionCode:I

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " > installed version "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object v0, v15

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1727
    .local v11, message:Ljava/lang/String;
    const-string v22, "BackupManagerService"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Package "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ": "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object v1, v11

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1728
    const/16 v22, 0xb10

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v16, v23, v24

    const/16 v24, 0x1

    aput-object v11, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    goto/16 :goto_52e

    .line 1712
    .end local v11           #message:Ljava/lang/String;
    .end local v15           #packageInfo:Landroid/content/pm/PackageInfo;
    :catch_797
    move-exception v22

    move-object/from16 v8, v22

    .line 1713
    .local v8, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v22, "BackupManagerService"

    const-string v23, "Invalid package restoring data"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1714
    const/16 v22, 0xb10

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v16, v23, v24

    const/16 v24, 0x1

    const-string v25, "Package missing on device"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    goto/16 :goto_52e

    .line 1738
    .end local v8           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v15       #packageInfo:Landroid/content/pm/PackageInfo;
    :cond_7bf
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object v0, v12

    iget-object v0, v0, Lcom/android/server/PackageManagerBackupAgent$Metadata;->signatures:[Landroid/content/pm/Signature;

    move-object/from16 v23, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v15

    #calls: Lcom/android/server/BackupManagerService;->signaturesMatch([Landroid/content/pm/Signature;Landroid/content/pm/PackageInfo;)Z
    invoke-static {v0, v1, v2}, Lcom/android/server/BackupManagerService;->access$900(Lcom/android/server/BackupManagerService;[Landroid/content/pm/Signature;Landroid/content/pm/PackageInfo;)Z

    move-result v22

    if-nez v22, :cond_80a

    .line 1739
    const-string v22, "BackupManagerService"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Signature mismatch restoring "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1740
    const/16 v22, 0xb10

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v16, v23, v24

    const/16 v24, 0x1

    const-string v25, "Signature mismatch"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    goto/16 :goto_52e

    .line 1751
    :cond_80a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v22 .. v24}, Lcom/android/server/BackupManagerService;->bindToAgentSynchronous(Landroid/content/pm/ApplicationInfo;I)Landroid/app/IBackupAgent;

    move-result-object v5

    .line 1754
    .local v5, agent:Landroid/app/IBackupAgent;
    if-nez v5, :cond_852

    .line 1755
    const-string v22, "BackupManagerService"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Can\'t find backup agent for "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1756
    const/16 v22, 0xb10

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v16, v23, v24

    const/16 v24, 0x1

    const-string v25, "Restore agent missing"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_850
    .catchall {:try_start_70f .. :try_end_850} :catchall_6f5
    .catch Ljava/lang/Exception; {:try_start_70f .. :try_end_850} :catch_6db

    goto/16 :goto_52e

    .line 1763
    :cond_852
    :try_start_852
    move-object v0, v12

    iget v0, v0, Lcom/android/server/PackageManagerBackupAgent$Metadata;->versionCode:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mNeedFullBackup:Z

    move/from16 v23, v0

    move-object/from16 v0, p0

    move-object v1, v15

    move/from16 v2, v22

    move-object v3, v5

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/server/BackupManagerService$PerformRestoreTask;->processOneRestore(Landroid/content/pm/PackageInfo;ILandroid/app/IBackupAgent;Z)V
    :try_end_868
    .catchall {:try_start_852 .. :try_end_868} :catchall_8ba

    .line 1765
    add-int/lit8 v7, v7, 0x1

    .line 1768
    :try_start_86a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v22

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Landroid/app/IActivityManager;->unbindBackupAgent(Landroid/content/pm/ApplicationInfo;)V

    .line 1776
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    if-nez v22, :cond_52e

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v22, v0

    const/high16 v23, 0x1

    and-int v22, v22, v23

    if-eqz v22, :cond_52e

    .line 1780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static/range {v22 .. v22}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v22

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v24, v0

    invoke-interface/range {v22 .. v24}, Landroid/app/IActivityManager;->killApplicationProcess(Ljava/lang/String;I)V

    goto/16 :goto_52e

    .line 1768
    :catchall_8ba
    move-exception v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v23, v0

    #getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static/range {v23 .. v23}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v23

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v24, v0

    invoke-interface/range {v23 .. v24}, Landroid/app/IActivityManager;->unbindBackupAgent(Landroid/content/pm/ApplicationInfo;)V

    .line 1776
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->mTargetPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v23, v0

    if-nez v23, :cond_909

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v23, v0

    const/high16 v24, 0x1

    and-int v23, v23, v24

    if-eqz v23, :cond_909

    .line 1780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/BackupManagerService$PerformRestoreTask;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v23, v0

    #getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static/range {v23 .. v23}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v23

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object v0, v15

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v25, v0

    invoke-interface/range {v23 .. v25}, Landroid/app/IActivityManager;->killApplicationProcess(Ljava/lang/String;I)V

    .line 1768
    :cond_909
    throw v22
    :try_end_90a
    .catchall {:try_start_86a .. :try_end_90a} :catchall_6f5
    .catch Ljava/lang/Exception; {:try_start_86a .. :try_end_90a} :catch_6db

    .line 1798
    .end local v5           #agent:Landroid/app/IBackupAgent;
    .end local v6           #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v7           #count:I
    .end local v10           #flags:I
    .end local v12           #metaInfo:Lcom/android/server/PackageManagerBackupAgent$Metadata;
    .end local v14           #omPackage:Landroid/content/pm/PackageInfo;
    .end local v15           #packageInfo:Landroid/content/pm/PackageInfo;
    .end local v16           #packageName:Ljava/lang/String;
    .end local v18           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .end local v19           #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    .restart local v17       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :catch_90a
    move-exception v23

    move-object/from16 v8, v23

    .line 1799
    .local v8, e:Landroid/os/RemoteException;
    const-string v23, "BackupManagerService"

    const-string v24, "Error finishing restore"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1e0

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_91b
    move-exception v23

    move-object/from16 v8, v23

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v23, "BackupManagerService"

    const-string v24, "Restore observer died at restoreFinished"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1f4

    .line 1798
    .local v8, e:Ljava/lang/Exception;
    :catch_927
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .local v8, e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_14e

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_938
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_162

    .line 1798
    .end local v8           #e:Landroid/os/RemoteException;
    .restart local v6       #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .restart local v14       #omPackage:Landroid/content/pm/PackageInfo;
    .restart local v19       #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :catch_944
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_ba

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_955
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_ce

    .line 1798
    .end local v8           #e:Landroid/os/RemoteException;
    .restart local v16       #packageName:Ljava/lang/String;
    :catch_961
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_27f

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_972
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_293

    .line 1798
    .end local v8           #e:Landroid/os/RemoteException;
    .restart local v13       #millis:I
    :catch_97e
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_32f

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_98f
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_343

    .line 1798
    .end local v8           #e:Landroid/os/RemoteException;
    .end local v13           #millis:I
    :catch_99b
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3ea

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_9ac
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3fe

    .line 1798
    .end local v8           #e:Landroid/os/RemoteException;
    .end local v17           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v18       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :catch_9b8
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4b4

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_9c9
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4c8

    .line 1798
    .end local v8           #e:Landroid/os/RemoteException;
    .restart local v7       #count:I
    :catch_9d5
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_557

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_9e6
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_56b

    .line 1798
    .end local v8           #e:Landroid/os/RemoteException;
    .restart local v13       #millis:I
    :catch_9f2
    move-exception v22

    move-object/from16 v8, v22

    .line 1799
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Error finishing restore"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object v2, v8

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_60d

    .line 1805
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_a03
    move-exception v22

    move-object/from16 v8, v22

    .line 1806
    .restart local v8       #e:Landroid/os/RemoteException;
    const-string v22, "BackupManagerService"

    const-string v23, "Restore observer died at restoreFinished"

    invoke-static/range {v22 .. v23}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_621

    .line 1825
    .end local v8           #e:Landroid/os/RemoteException;
    :catch_a0f
    move-exception v22

    goto/16 :goto_673

    .end local v13           #millis:I
    :catch_a12
    move-exception v22

    goto/16 :goto_5bd

    .end local v7           #count:I
    :catch_a15
    move-exception v22

    goto/16 :goto_51a

    .end local v18           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    .restart local v17       #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :catch_a18
    move-exception v22

    goto/16 :goto_447

    .restart local v13       #millis:I
    :catch_a1b
    move-exception v22

    goto/16 :goto_38c

    .end local v13           #millis:I
    :catch_a1e
    move-exception v22

    goto/16 :goto_2dc

    .end local v16           #packageName:Ljava/lang/String;
    :catch_a21
    move-exception v22

    goto/16 :goto_117

    .end local v6           #agentPackages:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v14           #omPackage:Landroid/content/pm/PackageInfo;
    .end local v19           #restorePackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    :catch_a24
    move-exception v22

    goto/16 :goto_1b4

    :catch_a27
    move-exception v23

    goto/16 :goto_246
.end method
