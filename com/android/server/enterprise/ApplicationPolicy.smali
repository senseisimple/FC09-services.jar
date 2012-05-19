.class public Lcom/android/server/enterprise/ApplicationPolicy;
.super Landroid/app/enterprise/IApplicationPolicy$Stub;
.source "ApplicationPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;,
        Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;,
        Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;,
        Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;,
        Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;,
        Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;
    }
.end annotation


# static fields
.field private static final CPU_ELAPSED_TIME:I = 0x3e8

.field private static final CPU_IDLE_TIME:I = 0x4

.field private static final CPU_IO_WAIT_TIME:I = 0x5

.field private static final CPU_IRQ_TIME:I = 0x6

.field private static final CPU_NICE_TIME:I = 0x2

.field private static final CPU_SOFT_IRQ_TIME:I = 0x7

.field private static final CPU_SYSTEM_TIME:I = 0x3

.field private static final CPU_USER_TIME:I = 0x1

.field private static final PROCESS_SYSTEM_TIME:I = 0xe

.field private static final PROCESS_USER_TIME:I = 0xd

.field private static final SIZE_INVALID:I = -0x1

.field private static final TAG:Ljava/lang/String; = "ApplicationPolicy"

.field private static volatile packageChangeIntentReceiver:Landroid/content/BroadcastReceiver;


# instance fields
.field mContext:Landroid/content/Context;

.field private mPackageManager:Landroid/content/pm/PackageManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 54
    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/enterprise/ApplicationPolicy;->packageChangeIntentReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "ctx"

    .prologue
    .line 100
    invoke-direct {p0}, Landroid/app/enterprise/IApplicationPolicy$Stub;-><init>()V

    .line 101
    iput-object p1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    .line 102
    iget-object v0, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 103
    invoke-direct {p0}, Lcom/android/server/enterprise/ApplicationPolicy;->registerPackageChangeReceiver()V

    .line 104
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/enterprise/ApplicationPolicy;Landroid/content/Intent;)Ljava/lang/String;
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getPackageName(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private canRead(Ljava/lang/String;)Z
    .registers 7
    .parameter "filepath"

    .prologue
    .line 456
    const/4 v0, 0x0

    .line 458
    .local v0, canread:Z
    :try_start_1
    const-string v3, "\\\\"

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 459
    const-string v3, "/"

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 460
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 461
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 462
    :cond_1e
    const/4 v3, 0x3

    new-array v2, v3, [I

    .line 463
    .local v2, mOutPermissions:[I
    invoke-static {p1, v2}, Landroid/os/FileUtils;->getPermissions(Ljava/lang/String;[I)I

    .line 464
    const/4 v3, 0x4

    const/4 v4, 0x0

    aget v4, v2, v4
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_28} :catch_2e

    and-int/lit8 v4, v4, 0x4

    if-ne v3, v4, :cond_2d

    .line 465
    const/4 v0, 0x1

    .line 470
    .end local v2           #mOutPermissions:[I
    :cond_2d
    :goto_2d
    return v0

    .line 467
    :catch_2e
    move-exception v3

    move-object v1, v3

    .line 468
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2d
.end method

.method private cleanCmdline(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .parameter "aRawData"

    .prologue
    .line 1412
    if-nez p1, :cond_5

    .line 1413
    const-string v1, "<invalid>"

    .line 1420
    :goto_4
    return-object v1

    .line 1415
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1f

    .line 1416
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isIdentifierIgnorable(C)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 1417
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    .line 1415
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_1f
    move-object v1, p1

    .line 1420
    goto :goto_4
.end method

.method private clearApplicationCacheFiles(Ljava/lang/String;)Z
    .registers 7
    .parameter "packageName"

    .prologue
    .line 215
    const/4 v2, 0x0

    .line 216
    .local v2, success:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 217
    if-eqz p1, :cond_2c

    .line 218
    new-instance v0, Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;Lcom/android/server/enterprise/ApplicationPolicy$1;)V

    .line 220
    .local v0, clearCacheObserver:Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;
    :try_start_d
    iget-object v3, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v3, p1, v0}, Landroid/content/pm/PackageManager;->deleteApplicationCacheFiles(Ljava/lang/String;Landroid/content/pm/IPackageDataObserver;)V

    .line 222
    monitor-enter v0
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_13} :catch_32

    .line 223
    :goto_13
    :try_start_13
    iget-boolean v3, v0, Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;->finished:Z
    :try_end_15
    .catchall {:try_start_13 .. :try_end_15} :catchall_2f

    if-nez v3, :cond_1d

    .line 225
    :try_start_17
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1a
    .catchall {:try_start_17 .. :try_end_1a} :catchall_2f
    .catch Ljava/lang/InterruptedException; {:try_start_17 .. :try_end_1a} :catch_1b

    goto :goto_13

    .line 226
    :catch_1b
    move-exception v3

    goto :goto_13

    .line 229
    :cond_1d
    const/4 v3, 0x1

    :try_start_1e
    iget-boolean v4, v0, Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;->success:Z

    if-ne v3, v4, :cond_2d

    iget-object v3, v0, Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;->packageName:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 230
    const/4 v2, 0x1

    .line 234
    :goto_2b
    monitor-exit v0

    .line 240
    .end local v0           #clearCacheObserver:Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;
    :cond_2c
    :goto_2c
    return v2

    .line 232
    .restart local v0       #clearCacheObserver:Lcom/android/server/enterprise/ApplicationPolicy$ClearCacheObserver;
    :cond_2d
    const/4 v2, 0x0

    goto :goto_2b

    .line 234
    :catchall_2f
    move-exception v3

    monitor-exit v0
    :try_end_31
    .catchall {:try_start_1e .. :try_end_31} :catchall_2f

    :try_start_31
    throw v3
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_32} :catch_32

    .line 235
    :catch_32
    move-exception v3

    move-object v1, v3

    .line 236
    .local v1, e:Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 237
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2c
.end method

.method private clearUserData(Ljava/lang/String;)Z
    .registers 9
    .parameter "packageName"

    .prologue
    .line 259
    const/4 v4, 0x0

    .line 260
    .local v4, success:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 261
    if-eqz p1, :cond_33

    .line 262
    new-instance v1, Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;

    const/4 v5, 0x0

    invoke-direct {v1, p0, v5}, Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;Lcom/android/server/enterprise/ApplicationPolicy$1;)V

    .line 264
    .local v1, clearDataObserver:Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;
    :try_start_d
    iget-object v5, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v6, "activity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 265
    .local v0, am:Landroid/app/ActivityManager;
    invoke-virtual {v0, p1, v1}, Landroid/app/ActivityManager;->clearApplicationUserData(Ljava/lang/String;Landroid/content/pm/IPackageDataObserver;)Z

    move-result v3

    .line 266
    .local v3, res:Z
    if-nez v3, :cond_34

    .line 268
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Couldn\'t clear application user data for package: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 289
    .end local v0           #am:Landroid/app/ActivityManager;
    .end local v1           #clearDataObserver:Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;
    .end local v3           #res:Z
    :cond_33
    :goto_33
    return v4

    .line 270
    .restart local v0       #am:Landroid/app/ActivityManager;
    .restart local v1       #clearDataObserver:Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;
    .restart local v3       #res:Z
    :cond_34
    monitor-enter v1
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_35} :catch_52

    .line 271
    :goto_35
    :try_start_35
    iget-boolean v5, v1, Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;->finished:Z
    :try_end_37
    .catchall {:try_start_35 .. :try_end_37} :catchall_4f

    if-nez v5, :cond_3f

    .line 273
    :try_start_39
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_4f
    .catch Ljava/lang/InterruptedException; {:try_start_39 .. :try_end_3c} :catch_3d

    goto :goto_35

    .line 274
    :catch_3d
    move-exception v5

    goto :goto_35

    .line 277
    :cond_3f
    const/4 v5, 0x1

    :try_start_40
    iget-boolean v6, v1, Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;->success:Z

    if-ne v5, v6, :cond_59

    iget-object v5, v1, Lcom/android/server/enterprise/ApplicationPolicy$ClearUserDataObserver;->packageName:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_59

    .line 278
    const/4 v4, 0x1

    .line 282
    :goto_4d
    monitor-exit v1

    goto :goto_33

    :catchall_4f
    move-exception v5

    monitor-exit v1
    :try_end_51
    .catchall {:try_start_40 .. :try_end_51} :catchall_4f

    :try_start_51
    throw v5
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_52} :catch_52

    .line 284
    .end local v0           #am:Landroid/app/ActivityManager;
    .end local v3           #res:Z
    :catch_52
    move-exception v5

    move-object v2, v5

    .line 285
    .local v2, e:Ljava/lang/Exception;
    const/4 v4, 0x0

    .line 286
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_33

    .line 280
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v0       #am:Landroid/app/ActivityManager;
    .restart local v3       #res:Z
    :cond_59
    const/4 v4, 0x0

    goto :goto_4d
.end method

.method private getAppInfo(Ljava/lang/String;)Landroid/content/pm/ApplicationInfo;
    .registers 6
    .parameter "packageName"

    .prologue
    .line 1005
    const/4 v1, 0x0

    .line 1006
    .local v1, mAppInfo:Landroid/content/pm/ApplicationInfo;
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1007
    if-eqz p1, :cond_f

    .line 1009
    :try_start_7
    iget-object v2, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    const/16 v3, 0x2000

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_e} :catch_10

    move-result-object v1

    .line 1014
    :cond_f
    :goto_f
    return-object v1

    .line 1010
    :catch_10
    move-exception v2

    move-object v0, v2

    .line 1011
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAppInfo() : Exception when retrieving package: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    goto :goto_f
.end method

.method private getApplicationPackageStats(Ljava/lang/String;)Landroid/content/pm/PackageStats;
    .registers 8
    .parameter "packageName"

    .prologue
    .line 976
    const/4 v1, 0x0

    .line 977
    .local v1, pkgst:Landroid/content/pm/PackageStats;
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 978
    if-eqz p1, :cond_2a

    .line 979
    new-instance v0, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;

    invoke-direct {v0, p0}, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;)V

    .line 980
    .local v0, obs:Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 982
    .local v2, token:J
    :try_start_10
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v4, p1, v0}, Landroid/content/pm/PackageManager;->getPackageSizeInfo(Ljava/lang/String;Landroid/content/pm/IPackageStatsObserver;)V

    .line 983
    monitor-enter v0
    :try_end_16
    .catchall {:try_start_10 .. :try_end_16} :catchall_2e

    .line 984
    :goto_16
    :try_start_16
    iget-boolean v4, v0, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->finished:Z
    :try_end_18
    .catchall {:try_start_16 .. :try_end_18} :catchall_2b

    if-nez v4, :cond_20

    .line 986
    :try_start_1a
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_2b
    .catch Ljava/lang/InterruptedException; {:try_start_1a .. :try_end_1d} :catch_1e

    goto :goto_16

    .line 987
    :catch_1e
    move-exception v4

    goto :goto_16

    .line 990
    :cond_20
    :try_start_20
    monitor-exit v0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_2b

    .line 992
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 993
    iget-boolean v4, v0, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->result:Z

    if-eqz v4, :cond_2a

    .line 994
    iget-object v1, v0, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->mPkgStats:Landroid/content/pm/PackageStats;

    .line 998
    .end local v0           #obs:Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;
    .end local v2           #token:J
    :cond_2a
    return-object v1

    .line 990
    .restart local v0       #obs:Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;
    .restart local v2       #token:J
    :catchall_2b
    move-exception v4

    :try_start_2c
    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2b

    :try_start_2d
    throw v4
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2e

    .line 992
    :catchall_2e
    move-exception v4

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 993
    iget-boolean v5, v0, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->result:Z

    if-eqz v5, :cond_38

    .line 994
    iget-object v1, v0, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->mPkgStats:Landroid/content/pm/PackageStats;

    .line 992
    :cond_38
    throw v4
.end method

.method private getPackageName(Landroid/content/Intent;)Ljava/lang/String;
    .registers 5
    .parameter "intent"

    .prologue
    .line 152
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 153
    .local v1, uri:Landroid/net/Uri;
    if-eqz v1, :cond_c

    invoke-virtual {v1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    .line 154
    .local v0, pkg:Ljava/lang/String;
    :goto_b
    return-object v0

    .line 153
    .end local v0           #pkg:Ljava/lang/String;
    :cond_c
    const/4 v2, 0x0

    move-object v0, v2

    goto :goto_b
.end method

.method private getPidList()Ljava/util/ArrayList;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1429
    new-instance v3, Ljava/io/File;

    const-string v4, "/proc/"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1430
    .local v3, lProcDir:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 1431
    .local v1, lFiles:[Ljava/lang/String;
    sget-boolean v4, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v4, :cond_28

    .line 1432
    const-string v4, "ApplicationPolicy"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getPidList: process count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1434
    :cond_28
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1435
    .local v2, lPidList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2e
    array-length v4, v1

    if-ge v0, v4, :cond_4c

    .line 1437
    const/4 v4, 0x1

    aget-object v5, v1, v0

    const-string v6, "[0-9]+"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-ne v4, v5, :cond_49

    .line 1438
    aget-object v4, v1, v0

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1435
    :cond_49
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    .line 1442
    :cond_4c
    return-object v2
.end method

.method private getPkgInfo(Ljava/lang/String;)Landroid/content/pm/PackageInfo;
    .registers 6
    .parameter "packageName"

    .prologue
    .line 1021
    const/4 v1, 0x0

    .line 1022
    .local v1, mpkgInfo:Landroid/content/pm/PackageInfo;
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1023
    if-eqz p1, :cond_f

    .line 1025
    :try_start_7
    iget-object v2, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    const/16 v3, 0x2000

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_e} :catch_10

    move-result-object v1

    .line 1030
    :cond_f
    :goto_f
    return-object v1

    .line 1026
    :catch_10
    move-exception v2

    move-object v0, v2

    .line 1027
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAppInfo() : Exception when retrieving package: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    goto :goto_f
.end method

.method private getSizeStr(J)Ljava/lang/String;
    .registers 7
    .parameter "size"

    .prologue
    .line 959
    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-nez v2, :cond_8

    .line 960
    const/4 v2, 0x0

    .line 969
    :goto_7
    return-object v2

    .line 962
    :cond_8
    const/4 v1, 0x0

    .line 964
    .local v1, sizeStr:Ljava/lang/String;
    :try_start_9
    iget-object v2, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    invoke-static {v2, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_e} :catch_11

    move-result-object v1

    :goto_f
    move-object v2, v1

    .line 969
    goto :goto_7

    .line 965
    :catch_11
    move-exception v2

    move-object v0, v2

    .line 966
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 967
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_f
.end method

.method public static declared-synchronized getValidStr(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .parameter "str"

    .prologue
    const/4 v3, 0x0

    .line 1050
    const-class v1, Lcom/android/server/enterprise/ApplicationPolicy;

    monitor-enter v1

    if-nez p0, :cond_9

    move-object v2, v3

    .line 1054
    :goto_7
    monitor-exit v1

    return-object v2

    .line 1050
    :cond_9
    :try_start_9
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I
    :try_end_10
    .catchall {:try_start_9 .. :try_end_10} :catchall_1e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_10} :catch_17

    move-result v2

    if-lez v2, :cond_15

    move-object v2, p0

    goto :goto_7

    :cond_15
    move-object v2, v3

    goto :goto_7

    .line 1051
    :catch_17
    move-exception v2

    move-object v0, v2

    .line 1052
    .local v0, e:Ljava/lang/Exception;
    :try_start_19
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1e

    move-object v2, v3

    .line 1054
    goto :goto_7

    .line 1050
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_1e
    move-exception v2

    monitor-exit v1

    throw v2
.end method

.method private readAppMemoryInfo()Ljava/util/List;
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1100
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_b

    .line 1101
    const-string v21, "ApplicationPolicy"

    const-string v22, "readAppMemoryInfo start"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1103
    :cond_b
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApplicationPolicy;->getPidList()Ljava/util/ArrayList;

    move-result-object v16

    .line 1104
    .local v16, lPidList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 1106
    .local v20, lStats:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    :try_start_14
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v21

    new-array v0, v0, [I

    move-object v15, v0

    .line 1107
    .local v15, lPidArray:[I
    const/4 v9, 0x0

    .line 1108
    .local v9, k:I
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    move v10, v9

    .end local v9           #k:I
    .local v10, k:I
    :goto_23
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_39

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    .line 1109
    .local v14, lPid:Ljava/lang/Integer;
    add-int/lit8 v9, v10, 0x1

    .end local v10           #k:I
    .restart local v9       #k:I
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v21

    aput v21, v15, v10

    move v10, v9

    .end local v9           #k:I
    .restart local v10       #k:I
    goto :goto_23

    .line 1112
    .end local v14           #lPid:Ljava/lang/Integer;
    :cond_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    const-string v22, "activity"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ActivityManager;

    .line 1114
    .local v5, activityManager:Landroid/app/ActivityManager;
    invoke-virtual {v5, v15}, Landroid/app/ActivityManager;->getProcessMemoryInfo([I)[Landroid/os/Debug$MemoryInfo;

    move-result-object v13

    .line 1115
    .local v13, lMemInfoArray:[Landroid/os/Debug$MemoryInfo;
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_79

    .line 1116
    const-string v21, "ApplicationPolicy"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "memory length : "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object v0, v13

    array-length v0, v0

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "pids length"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1119
    :cond_79
    const/4 v7, 0x0

    .local v7, i:I
    :goto_7a
    move-object v0, v13

    array-length v0, v0

    move/from16 v21, v0

    move v0, v7

    move/from16 v1, v21

    if-ge v0, v1, :cond_ff

    .line 1120
    aget-object v12, v13, v7

    .line 1121
    .local v12, lMemInfo:Landroid/os/Debug$MemoryInfo;
    invoke-virtual {v12}, Landroid/os/Debug$MemoryInfo;->getTotalPss()I

    move-result v21

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v18, v0

    .line 1122
    .local v18, lRamSize:J
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_ba

    .line 1123
    const-string v21, "ApplicationPolicy"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "pid :"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget v23, v15, v7

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "pss value:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1125
    :cond_ba
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "/proc/"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    aget v22, v15, v7

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "/cmdline"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApplicationPolicy;->readData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1126
    .local v17, lPkgName:Ljava/lang/String;
    if-eqz v17, :cond_f6

    .line 1127
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApplicationPolicy;->cleanCmdline(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1128
    .local v11, lCmdLine:Ljava/lang/String;
    new-instance v21, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object v2, v11

    move-wide/from16 v3, v18

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;Ljava/lang/String;J)V

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f6
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_f6} :catch_f9

    .line 1119
    .end local v11           #lCmdLine:Ljava/lang/String;
    :cond_f6
    add-int/lit8 v7, v7, 0x1

    goto :goto_7a

    .line 1131
    .end local v5           #activityManager:Landroid/app/ActivityManager;
    .end local v7           #i:I
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v10           #k:I
    .end local v12           #lMemInfo:Landroid/os/Debug$MemoryInfo;
    .end local v13           #lMemInfoArray:[Landroid/os/Debug$MemoryInfo;
    .end local v15           #lPidArray:[I
    .end local v17           #lPkgName:Ljava/lang/String;
    .end local v18           #lRamSize:J
    :catch_f9
    move-exception v21

    move-object/from16 v6, v21

    .line 1132
    .local v6, e:Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 1135
    .end local v6           #e:Ljava/lang/Exception;
    :cond_ff
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_10a

    .line 1136
    const-string v21, "ApplicationPolicy"

    const-string v22, "readAppMemoryInfo end"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1138
    :cond_10a
    return-object v20
.end method

.method private readAppSizeInfo()Ljava/util/List;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;",
            ">;"
        }
    .end annotation

    .prologue
    const-string v13, "ApplicationPolicy"

    .line 1184
    const-string v9, "ApplicationPolicy"

    const-string v9, "readAppSizeInfo start"

    invoke-static {v13, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1186
    iget-object v9, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v3

    .line 1187
    .local v3, lPkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1190
    .local v6, lStats:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    :try_start_15
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_19
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_64

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageInfo;

    .line 1191
    .local v2, lPkgInfo:Landroid/content/pm/PackageInfo;
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 1192
    .local v4, lPkgName:Ljava/lang/String;
    if-eqz v4, :cond_19

    .line 1193
    new-instance v5, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;

    invoke-direct {v5, p0}, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;)V

    .line 1194
    .local v5, lPkgSizeObserver:Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;
    iget-object v9, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v9, v4, v5}, Landroid/content/pm/PackageManager;->getPackageSizeInfo(Ljava/lang/String;Landroid/content/pm/IPackageStatsObserver;)V

    .line 1195
    monitor-enter v5
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_34} :catch_5f

    .line 1196
    :goto_34
    :try_start_34
    iget-boolean v9, v5, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->finished:Z
    :try_end_36
    .catchall {:try_start_34 .. :try_end_36} :catchall_70

    if-nez v9, :cond_3e

    .line 1198
    :try_start_38
    invoke-virtual {v5}, Ljava/lang/Object;->wait()V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_70
    .catch Ljava/lang/InterruptedException; {:try_start_38 .. :try_end_3b} :catch_3c

    goto :goto_34

    .line 1199
    :catch_3c
    move-exception v9

    goto :goto_34

    .line 1202
    :cond_3e
    :try_start_3e
    monitor-exit v5
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_70

    .line 1203
    :try_start_3f
    iget-boolean v9, v5, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->result:Z

    if-eqz v9, :cond_19

    .line 1204
    iget-object v9, v5, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->mPkgStats:Landroid/content/pm/PackageStats;

    if-eqz v9, :cond_19

    .line 1205
    iget-object v9, v5, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->mPkgStats:Landroid/content/pm/PackageStats;

    iget-wide v9, v9, Landroid/content/pm/PackageStats;->cacheSize:J

    iget-object v11, v5, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->mPkgStats:Landroid/content/pm/PackageStats;

    iget-wide v11, v11, Landroid/content/pm/PackageStats;->codeSize:J

    add-long/2addr v9, v11

    iget-object v11, v5, Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;->mPkgStats:Landroid/content/pm/PackageStats;

    iget-wide v11, v11, Landroid/content/pm/PackageStats;->dataSize:J

    add-long v7, v9, v11

    .line 1207
    .local v7, lTotalSize:J
    new-instance v9, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    invoke-direct {v9, p0, v4, v7, v8}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;Ljava/lang/String;J)V

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_5e} :catch_5f

    goto :goto_19

    .line 1212
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #lPkgInfo:Landroid/content/pm/PackageInfo;
    .end local v4           #lPkgName:Ljava/lang/String;
    .end local v5           #lPkgSizeObserver:Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;
    .end local v7           #lTotalSize:J
    :catch_5f
    move-exception v9

    move-object v0, v9

    .line 1213
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1216
    .end local v0           #e:Ljava/lang/Exception;
    :cond_64
    sget-boolean v9, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v9, :cond_6f

    .line 1217
    const-string v9, "ApplicationPolicy"

    const-string v9, "readAppSizeInfo end"

    invoke-static {v13, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1219
    :cond_6f
    return-object v6

    .line 1202
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v2       #lPkgInfo:Landroid/content/pm/PackageInfo;
    .restart local v4       #lPkgName:Ljava/lang/String;
    .restart local v5       #lPkgSizeObserver:Lcom/android/server/enterprise/ApplicationPolicy$PkgSizeObserver;
    :catchall_70
    move-exception v9

    :try_start_71
    monitor-exit v5
    :try_end_72
    .catchall {:try_start_71 .. :try_end_72} :catchall_70

    :try_start_72
    throw v9
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_73} :catch_5f
.end method

.method private readCpuTime()J
    .registers 7

    .prologue
    const-string v3, "ApplicationPolicy"

    .line 1344
    sget-boolean v2, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v2, :cond_d

    .line 1345
    const-string v2, "ApplicationPolicy"

    const-string v2, "readCpuTime start"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1347
    :cond_d
    const-string v2, "proc/stat"

    invoke-direct {p0, v2}, Lcom/android/server/enterprise/ApplicationPolicy;->readData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1348
    .local v0, lCpuStat:Ljava/lang/String;
    if-nez v0, :cond_18

    .line 1349
    const-wide/16 v2, 0x0

    .line 1355
    :goto_17
    return-wide v2

    .line 1351
    :cond_18
    const-string v2, "[ ]+"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1352
    .local v1, segs:[Ljava/lang/String;
    sget-boolean v2, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v2, :cond_29

    .line 1353
    const-string v2, "ApplicationPolicy"

    const-string v2, "readCpuTime end"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1355
    :cond_29
    const/4 v2, 0x1

    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    const/4 v4, 0x2

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    add-long/2addr v2, v4

    const/4 v4, 0x3

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    add-long/2addr v2, v4

    const/4 v4, 0x4

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    add-long/2addr v2, v4

    const/4 v4, 0x5

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    add-long/2addr v2, v4

    const/4 v4, 0x6

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    add-long/2addr v2, v4

    const/4 v4, 0x7

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    add-long/2addr v2, v4

    goto :goto_17
.end method

.method private readData(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .parameter "aFileName"

    .prologue
    const/4 v6, 0x0

    const-string v5, "ApplicationPolicy"

    .line 1366
    sget-boolean v3, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v3, :cond_1f

    .line 1367
    const-string v3, "ApplicationPolicy"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "readData start for file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1371
    :cond_1f
    :try_start_1f
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/io/FileNotFoundException; {:try_start_1f .. :try_end_24} :catch_3c

    .line 1380
    .local v2, lFstream:Ljava/io/FileReader;
    new-instance v1, Ljava/io/BufferedReader;

    const/16 v3, 0x1f4

    invoke-direct {v1, v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 1382
    .local v1, lBufReader:Ljava/io/BufferedReader;
    :try_start_2b
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_2e
    .catchall {:try_start_2b .. :try_end_2e} :catchall_8d
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2e} :catch_5f

    move-result-object v3

    .line 1391
    if-eqz v2, :cond_35

    .line 1392
    :try_start_31
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    .line 1393
    const/4 v2, 0x0

    .line 1395
    :cond_35
    if-eqz v1, :cond_3b

    .line 1396
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_3a} :catch_a7

    .line 1397
    const/4 v1, 0x0

    .line 1388
    .end local v1           #lBufReader:Ljava/io/BufferedReader;
    .end local v2           #lFstream:Ljava/io/FileReader;
    :cond_3b
    :goto_3b
    return-object v3

    .line 1372
    :catch_3c
    move-exception v3

    move-object v0, v3

    .line 1373
    .local v0, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 1374
    sget-boolean v3, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v3, :cond_5d

    .line 1375
    const-string v3, "ApplicationPolicy"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File access error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5d
    move-object v3, v6

    .line 1377
    goto :goto_3b

    .line 1383
    .end local v0           #e:Ljava/io/FileNotFoundException;
    .restart local v1       #lBufReader:Ljava/io/BufferedReader;
    .restart local v2       #lFstream:Ljava/io/FileReader;
    :catch_5f
    move-exception v0

    .line 1384
    .local v0, e:Ljava/io/IOException;
    :try_start_60
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 1385
    sget-boolean v3, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v3, :cond_7f

    .line 1386
    const-string v3, "ApplicationPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "read error on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7f
    .catchall {:try_start_60 .. :try_end_7f} :catchall_8d

    .line 1391
    :cond_7f
    if-eqz v2, :cond_85

    .line 1392
    :try_start_81
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    .line 1393
    const/4 v2, 0x0

    .line 1395
    :cond_85
    if-eqz v1, :cond_8b

    .line 1396
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_8a
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_8a} :catch_a1

    .line 1397
    const/4 v1, 0x0

    :cond_8b
    :goto_8b
    move-object v3, v6

    .line 1388
    goto :goto_3b

    .line 1390
    .end local v0           #e:Ljava/io/IOException;
    :catchall_8d
    move-exception v3

    .line 1391
    if-eqz v2, :cond_94

    .line 1392
    :try_start_90
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    .line 1393
    const/4 v2, 0x0

    .line 1395
    :cond_94
    if-eqz v1, :cond_9a

    .line 1396
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_99
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_99} :catch_9b

    .line 1397
    const/4 v1, 0x0

    .line 1390
    :cond_9a
    :goto_9a
    throw v3

    .line 1399
    :catch_9b
    move-exception v4

    move-object v0, v4

    .line 1400
    .restart local v0       #e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9a

    .line 1399
    :catch_a1
    move-exception v3

    move-object v0, v3

    .line 1400
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_8b

    .line 1399
    .end local v0           #e:Ljava/io/IOException;
    :catch_a7
    move-exception v4

    move-object v0, v4

    .line 1400
    .restart local v0       #e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3b
.end method

.method private readProcInfo()Ljava/util/Map;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1299
    sget-boolean v10, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v10, :cond_b

    .line 1300
    const-string v10, "ApplicationPolicy"

    const-string v11, "readProcInfo start"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1302
    :cond_b
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 1304
    .local v9, lStats:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    invoke-direct {p0}, Lcom/android/server/enterprise/ApplicationPolicy;->getPidList()Ljava/util/ArrayList;

    move-result-object v3

    .line 1305
    .local v3, lPidList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-eqz v3, :cond_c2

    .line 1306
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1a
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_cd

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 1307
    .local v2, lPid:Ljava/lang/Integer;
    sget-boolean v10, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v10, :cond_42

    .line 1308
    const-string v10, "ApplicationPolicy"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getting cpu usage for pid"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1310
    :cond_42
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/proc/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/stat"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/android/server/enterprise/ApplicationPolicy;->readData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1311
    .local v8, lStat:Ljava/lang/String;
    if-eqz v8, :cond_1a

    .line 1315
    const-string v10, "[ ]+"

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 1316
    .local v7, lSegs:[Ljava/lang/String;
    const/16 v10, 0xd

    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    const/16 v12, 0xe

    aget-object v12, v7, v12

    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    add-long v5, v10, v12

    .line 1318
    .local v5, lRunTime:J
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/proc/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/cmdline"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/android/server/enterprise/ApplicationPolicy;->readData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1319
    .local v4, lPkgName:Ljava/lang/String;
    sget-boolean v10, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v10, :cond_b2

    .line 1320
    const-string v10, "ApplicationPolicy"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "package name"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1322
    :cond_b2
    if-eqz v4, :cond_1a

    .line 1323
    invoke-direct {p0, v4}, Lcom/android/server/enterprise/ApplicationPolicy;->cleanCmdline(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1324
    .local v1, lCmdLine:Ljava/lang/String;
    new-instance v10, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    invoke-direct {v10, p0, v1, v5, v6}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;Ljava/lang/String;J)V

    invoke-interface {v9, v2, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1a

    .line 1328
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #lCmdLine:Ljava/lang/String;
    .end local v2           #lPid:Ljava/lang/Integer;
    .end local v4           #lPkgName:Ljava/lang/String;
    .end local v5           #lRunTime:J
    .end local v7           #lSegs:[Ljava/lang/String;
    .end local v8           #lStat:Ljava/lang/String;
    :cond_c2
    sget-boolean v10, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v10, :cond_cd

    .line 1329
    const-string v10, "ApplicationPolicy"

    const-string v11, "cannot open file "

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1332
    :cond_cd
    sget-boolean v10, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v10, :cond_d8

    .line 1333
    const-string v10, "ApplicationPolicy"

    const-string v11, "readProcInfo end"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1335
    :cond_d8
    return-object v9
.end method

.method private registerPackageChangeReceiver()V
    .registers 5

    .prologue
    .line 108
    :try_start_0
    sget-object v2, Lcom/android/server/enterprise/ApplicationPolicy;->packageChangeIntentReceiver:Landroid/content/BroadcastReceiver;

    if-nez v2, :cond_2f

    .line 109
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 110
    .local v1, intentFilter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 111
    const-string v2, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 112
    const-string v2, "package"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 114
    new-instance v2, Lcom/android/server/enterprise/ApplicationPolicy$1;

    invoke-direct {v2, p0}, Lcom/android/server/enterprise/ApplicationPolicy$1;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;)V

    sput-object v2, Lcom/android/server/enterprise/ApplicationPolicy;->packageChangeIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 143
    iget-object v2, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    sget-object v3, Lcom/android/server/enterprise/ApplicationPolicy;->packageChangeIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 144
    const-string v2, "ApplicationPolicy"

    const-string v3, "registerPackageChangeReceiver() : Done"

    invoke-static {v2, v3}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_30

    .line 149
    .end local v1           #intentFilter:Landroid/content/IntentFilter;
    :cond_2f
    :goto_2f
    return-void

    .line 146
    :catch_30
    move-exception v2

    move-object v0, v2

    .line 147
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2f
.end method


# virtual methods
.method public deleteManagedAppInfo(Ljava/lang/String;)Z
    .registers 5
    .parameter "pkg"

    .prologue
    .line 730
    iget-object v0, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.sec.MDM_APP_MGMT"

    const-string v2, "Application Policy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    iget-object v0, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/android/server/enterprise/DmAppInfo;->deleteDmAppInfo(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getApplicationCacheSize(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .parameter "packageName"

    .prologue
    .line 939
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 940
    const-wide/16 v2, -0x1

    .line 941
    .local v2, total:J
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 942
    if-eqz p1, :cond_17

    .line 944
    :try_start_11
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationPackageStats(Ljava/lang/String;)Landroid/content/pm/PackageStats;

    move-result-object v1

    .line 945
    .local v1, pkgSt:Landroid/content/pm/PackageStats;
    iget-wide v2, v1, Landroid/content/pm/PackageStats;->cacheSize:J
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_17} :catch_1c

    .line 950
    .end local v1           #pkgSt:Landroid/content/pm/PackageStats;
    :cond_17
    :goto_17
    invoke-direct {p0, v2, v3}, Lcom/android/server/enterprise/ApplicationPolicy;->getSizeStr(J)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 946
    :catch_1c
    move-exception v4

    move-object v0, v4

    .line 947
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_17
.end method

.method public getApplicationCodeSize(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .parameter "packageName"

    .prologue
    .line 895
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    const-wide/16 v2, -0x1

    .line 897
    .local v2, total:J
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 898
    if-eqz p1, :cond_17

    .line 900
    :try_start_11
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationPackageStats(Ljava/lang/String;)Landroid/content/pm/PackageStats;

    move-result-object v1

    .line 901
    .local v1, pkgSt:Landroid/content/pm/PackageStats;
    iget-wide v2, v1, Landroid/content/pm/PackageStats;->codeSize:J
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_17} :catch_1c

    .line 906
    .end local v1           #pkgSt:Landroid/content/pm/PackageStats;
    :cond_17
    :goto_17
    invoke-direct {p0, v2, v3}, Lcom/android/server/enterprise/ApplicationPolicy;->getSizeStr(J)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 902
    :catch_1c
    move-exception v4

    move-object v0, v4

    .line 903
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_17
.end method

.method public getApplicationDataSize(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .parameter "packageName"

    .prologue
    .line 917
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    const-wide/16 v2, -0x1

    .line 919
    .local v2, total:J
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 920
    if-eqz p1, :cond_17

    .line 922
    :try_start_11
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationPackageStats(Ljava/lang/String;)Landroid/content/pm/PackageStats;

    move-result-object v1

    .line 923
    .local v1, pkgSt:Landroid/content/pm/PackageStats;
    iget-wide v2, v1, Landroid/content/pm/PackageStats;->dataSize:J
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_17} :catch_1c

    .line 928
    .end local v1           #pkgSt:Landroid/content/pm/PackageStats;
    :cond_17
    :goto_17
    invoke-direct {p0, v2, v3}, Lcom/android/server/enterprise/ApplicationPolicy;->getSizeStr(J)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 924
    :catch_1c
    move-exception v4

    move-object v0, v4

    .line 925
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_17
.end method

.method public getApplicationInstallationEnabled(Ljava/lang/String;)Z
    .registers 10
    .parameter "pkg"

    .prologue
    const/4 v7, 0x0

    .line 743
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 745
    const/4 v3, 0x1

    .line 746
    .local v3, installationEnabled:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 747
    if-eqz p1, :cond_36

    .line 749
    :try_start_11
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    invoke-static {v4, p1}, Lcom/android/server/enterprise/DmAppInfo;->getApplicationsList(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 750
    .local v1, dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    if-eqz v1, :cond_36

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_36

    .line 751
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/enterprise/DmAppInfo;

    .line 752
    .local v0, dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    if-eqz v0, :cond_36

    iget-object v4, v0, Lcom/android/server/enterprise/DmAppInfo;->mAppPkg:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_36

    .line 753
    iget v4, v0, Lcom/android/server/enterprise/DmAppInfo;->mAppInstallationDisabled:I
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_32} :catch_39

    if-nez v4, :cond_37

    const/4 v4, 0x1

    move v3, v4

    .line 760
    .end local v0           #dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    .end local v1           #dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :cond_36
    :goto_36
    return v3

    .restart local v0       #dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    .restart local v1       #dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :cond_37
    move v3, v7

    .line 753
    goto :goto_36

    .line 756
    .end local v0           #dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    .end local v1           #dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :catch_39
    move-exception v4

    move-object v2, v4

    .line 757
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_36
.end method

.method public getApplicationName(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .parameter "packageName"

    .prologue
    .line 826
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 827
    const/4 v1, 0x0

    .line 828
    .local v1, appName:Ljava/lang/String;
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 829
    if-eqz p1, :cond_20

    .line 831
    :try_start_10
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getAppInfo(Ljava/lang/String;)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    .line 832
    .local v3, mAppInfo:Landroid/content/pm/ApplicationInfo;
    if-eqz v3, :cond_20

    .line 833
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v4, v3}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v1, v0
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_20} :catch_21

    .line 838
    .end local v3           #mAppInfo:Landroid/content/pm/ApplicationInfo;
    :cond_20
    :goto_20
    return-object v1

    .line 834
    :catch_21
    move-exception v4

    move-object v2, v4

    .line 835
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_20
.end method

.method public getApplicationStateEnabled(Ljava/lang/String;)Z
    .registers 8
    .parameter "packageName"

    .prologue
    .line 631
    iget-object v3, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v4, "android.permission.sec.MDM_APP_MGMT"

    const-string v5, "Application Policy"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    const/4 v1, 0x0

    .line 633
    .local v1, enabled:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 634
    if-eqz p1, :cond_1b

    .line 636
    :try_start_10
    iget-object v3, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v3, p1}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_15} :catch_1f

    move-result v2

    .line 637
    .local v2, value:I
    const/4 v3, 0x2

    if-eq v2, v3, :cond_1c

    const/4 v3, 0x1

    move v1, v3

    .line 643
    .end local v2           #value:I
    :cond_1b
    :goto_1b
    return v1

    .line 637
    .restart local v2       #value:I
    :cond_1c
    const/4 v3, 0x0

    move v1, v3

    goto :goto_1b

    .line 638
    .end local v2           #value:I
    :catch_1f
    move-exception v3

    move-object v0, v3

    .line 639
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 640
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1b
.end method

.method public getApplicationTotalSize(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .parameter "packageName"

    .prologue
    .line 873
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 874
    const-wide/16 v2, -0x1

    .line 875
    .local v2, total:J
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 876
    if-eqz p1, :cond_1e

    .line 878
    :try_start_11
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationPackageStats(Ljava/lang/String;)Landroid/content/pm/PackageStats;

    move-result-object v1

    .line 879
    .local v1, pkgSt:Landroid/content/pm/PackageStats;
    iget-wide v4, v1, Landroid/content/pm/PackageStats;->cacheSize:J

    iget-wide v6, v1, Landroid/content/pm/PackageStats;->codeSize:J

    add-long/2addr v4, v6

    iget-wide v6, v1, Landroid/content/pm/PackageStats;->dataSize:J
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1c} :catch_23

    add-long v2, v4, v6

    .line 884
    .end local v1           #pkgSt:Landroid/content/pm/PackageStats;
    :cond_1e
    :goto_1e
    invoke-direct {p0, v2, v3}, Lcom/android/server/enterprise/ApplicationPolicy;->getSizeStr(J)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 880
    :catch_23
    move-exception v4

    move-object v0, v4

    .line 881
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1e
.end method

.method public getApplicationUninstallationEnabled(Ljava/lang/String;)Z
    .registers 10
    .parameter "pkg"

    .prologue
    const/4 v7, 0x0

    .line 773
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    const/4 v3, 0x1

    .line 776
    .local v3, uninstallationEnabled:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 777
    if-eqz p1, :cond_36

    .line 779
    :try_start_11
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    invoke-static {v4, p1}, Lcom/android/server/enterprise/DmAppInfo;->getApplicationsList(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 780
    .local v1, dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    if-eqz v1, :cond_36

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_36

    .line 781
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/enterprise/DmAppInfo;

    .line 782
    .local v0, dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    if-eqz v0, :cond_36

    iget-object v4, v0, Lcom/android/server/enterprise/DmAppInfo;->mAppPkg:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_36

    .line 783
    iget v4, v0, Lcom/android/server/enterprise/DmAppInfo;->mAppUninstallationDisabled:I
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_32} :catch_39

    if-nez v4, :cond_37

    const/4 v4, 0x1

    move v3, v4

    .line 790
    .end local v0           #dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    .end local v1           #dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :cond_36
    :goto_36
    return v3

    .restart local v0       #dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    .restart local v1       #dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :cond_37
    move v3, v7

    .line 783
    goto :goto_36

    .line 786
    .end local v0           #dmAppInfo:Lcom/android/server/enterprise/DmAppInfo;
    .end local v1           #dmAppInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :catch_39
    move-exception v4

    move-object v2, v4

    .line 787
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_36
.end method

.method public getApplicationVersion(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .parameter "packageName"

    .prologue
    .line 849
    iget-object v3, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v4, "android.permission.sec.MDM_APP_MGMT"

    const-string v5, "Application Policy"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 850
    const/4 v0, 0x0

    .line 851
    .local v0, appName:Ljava/lang/String;
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 852
    if-eqz p1, :cond_18

    .line 854
    :try_start_10
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getPkgInfo(Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 855
    .local v2, mpkgInfo:Landroid/content/pm/PackageInfo;
    if-eqz v2, :cond_18

    .line 856
    iget-object v0, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_18} :catch_19

    .line 861
    .end local v2           #mpkgInfo:Landroid/content/pm/PackageInfo;
    :cond_18
    :goto_18
    return-object v0

    .line 857
    :catch_19
    move-exception v3

    move-object v1, v3

    .line 858
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_18
.end method

.method public getApplicationsList(Ljava/lang/String;)[Landroid/app/enterprise/ManagedAppInfo;
    .registers 9
    .parameter "pkg"

    .prologue
    .line 696
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 697
    const/4 v0, 0x0

    .line 698
    .local v0, appInfo:[Landroid/app/enterprise/ManagedAppInfo;
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 701
    :try_start_e
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    invoke-static {v4, p1}, Lcom/android/server/enterprise/DmAppInfo;->getApplicationsList(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 702
    .local v3, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    if-eqz v3, :cond_80

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_80

    .line 703
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v0, v4, [Landroid/app/enterprise/ManagedAppInfo;

    .line 704
    const/4 v2, 0x0

    .end local p0
    .local v2, i:I
    :goto_23
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_80

    .line 705
    new-instance v4, Landroid/app/enterprise/ManagedAppInfo;

    invoke-direct {v4}, Landroid/app/enterprise/ManagedAppInfo;-><init>()V

    aput-object v4, v0, v2

    .line 706
    aget-object v4, v0, v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v5, p0, Lcom/android/server/enterprise/DmAppInfo;->mAppPkg:Ljava/lang/String;

    iput-object v5, v4, Landroid/app/enterprise/ManagedAppInfo;->mAppPkg:Ljava/lang/String;

    .line 707
    aget-object v4, v0, v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/enterprise/DmAppInfo;

    iget v5, p0, Lcom/android/server/enterprise/DmAppInfo;->mAppDisabled:I

    iput v5, v4, Landroid/app/enterprise/ManagedAppInfo;->mAppDisabled:I

    .line 708
    aget-object v4, v0, v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/enterprise/DmAppInfo;

    iget v5, p0, Lcom/android/server/enterprise/DmAppInfo;->mAppInstallCount:I

    iput v5, v4, Landroid/app/enterprise/ManagedAppInfo;->mAppInstallCount:I

    .line 709
    aget-object v4, v0, v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/enterprise/DmAppInfo;

    iget v5, p0, Lcom/android/server/enterprise/DmAppInfo;->mAppUninstallCount:I

    iput v5, v4, Landroid/app/enterprise/ManagedAppInfo;->mAppUninstallCount:I

    .line 710
    aget-object v4, v0, v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/enterprise/DmAppInfo;

    iget v5, p0, Lcom/android/server/enterprise/DmAppInfo;->mAppInstallationDisabled:I

    iput v5, v4, Landroid/app/enterprise/ManagedAppInfo;->mAppInstallationDisabled:I

    .line 711
    aget-object v4, v0, v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/enterprise/DmAppInfo;

    iget v5, p0, Lcom/android/server/enterprise/DmAppInfo;->mAppUninstallationDisabled:I

    iput v5, v4, Landroid/app/enterprise/ManagedAppInfo;->mAppUninstallationDisabled:I
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_78} :catch_7b

    .line 704
    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    .line 714
    .end local v2           #i:I
    .end local v3           #list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :catch_7b
    move-exception v4

    move-object v1, v4

    .line 715
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 718
    .end local v1           #e:Ljava/lang/Exception;
    :cond_80
    return-object v0
.end method

.method public getInstalledApplicationsIDList()[Ljava/lang/String;
    .registers 11

    .prologue
    .line 800
    iget-object v7, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v8, "android.permission.sec.MDM_APP_MGMT"

    const-string v9, "Application Policy"

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 801
    const/4 v6, 0x0

    .line 803
    .local v6, packageNameList:[Ljava/lang/String;
    :try_start_a
    iget-object v7, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v0

    .line 804
    .local v0, appinfoList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    if-eqz v0, :cond_3f

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_3f

    .line 805
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    new-array v6, v7, [Ljava/lang/String;

    .line 806
    const/4 v4, 0x0

    .line 807
    .local v4, index:I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    move v5, v4

    .end local v4           #index:I
    .local v5, index:I
    :goto_25
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 808
    .local v1, applicationInfo:Landroid/content/pm/ApplicationInfo;
    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    iget-object v7, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    aput-object v7, v6, v5
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_37} :catch_39

    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_25

    .line 811
    .end local v0           #appinfoList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    .end local v1           #applicationInfo:Landroid/content/pm/ApplicationInfo;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v5           #index:I
    :catch_39
    move-exception v7

    move-object v2, v7

    .line 812
    .local v2, e:Ljava/lang/Exception;
    const/4 v6, 0x0

    .line 813
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 815
    .end local v2           #e:Ljava/lang/Exception;
    :cond_3f
    return-object v6
.end method

.method public declared-synchronized getInstalledManagedApplicationsList()[Ljava/lang/String;
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 652
    monitor-enter p0

    :try_start_2
    iget-object v7, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v8, "android.permission.sec.MDM_APP_MGMT"

    const-string v9, "Application Policy"

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_89

    .line 653
    const/4 v0, 0x0

    .line 655
    .local v0, appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_c
    iget-object v7, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/android/server/enterprise/DmAppInfo;->getApplicationsList(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 656
    .local v6, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    if-eqz v6, :cond_6f

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_6f

    .line 657
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    :try_end_20
    .catchall {:try_start_c .. :try_end_20} :catchall_89
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_20} :catch_8c

    .line 658
    .end local v0           #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v1, appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_20
    invoke-virtual {p0}, Lcom/android/server/enterprise/ApplicationPolicy;->getInstalledApplicationsIDList()[Ljava/lang/String;

    move-result-object v2

    .line 659
    .local v2, deviceApps:[Ljava/lang/String;
    const/4 v3, 0x0

    .line 660
    .local v3, deviceInstalledAppsList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_2e

    array-length v7, v2

    if-lez v7, :cond_2e

    .line 661
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 663
    :cond_2e
    const/4 v5, 0x0

    .local v5, i:I
    :goto_2f
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_8f

    .line 664
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/enterprise/DmAppInfo;

    iget v7, v7, Lcom/android/server/enterprise/DmAppInfo;->mAppInstallCount:I

    if-lez v7, :cond_5a

    .line 665
    if-eqz v3, :cond_5d

    .line 666
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v7, v7, Lcom/android/server/enterprise/DmAppInfo;->mAppPkg:Ljava/lang/String;

    invoke-interface {v3, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5a

    .line 667
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v7, v7, Lcom/android/server/enterprise/DmAppInfo;->mAppPkg:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 663
    :cond_5a
    :goto_5a
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    .line 670
    :cond_5d
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v7, v7, Lcom/android/server/enterprise/DmAppInfo;->mAppPkg:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_68
    .catchall {:try_start_20 .. :try_end_68} :catchall_89
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_68} :catch_69

    goto :goto_5a

    .line 675
    .end local v2           #deviceApps:[Ljava/lang/String;
    .end local v3           #deviceInstalledAppsList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v5           #i:I
    :catch_69
    move-exception v7

    move-object v4, v7

    move-object v0, v1

    .line 676
    .end local v1           #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6           #list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    .restart local v0       #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v4, e:Ljava/lang/Exception;
    :goto_6c
    :try_start_6c
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 678
    .end local v4           #e:Ljava/lang/Exception;
    :cond_6f
    :goto_6f
    if-eqz v0, :cond_87

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_87

    .line 679
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    check-cast v7, [Ljava/lang/String;
    :try_end_85
    .catchall {:try_start_6c .. :try_end_85} :catchall_89

    .line 681
    :goto_85
    monitor-exit p0

    return-object v7

    :cond_87
    move-object v7, v10

    goto :goto_85

    .line 652
    .end local v0           #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catchall_89
    move-exception v7

    monitor-exit p0

    throw v7

    .line 675
    .restart local v0       #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_8c
    move-exception v7

    move-object v4, v7

    goto :goto_6c

    .end local v0           #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v1       #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2       #deviceApps:[Ljava/lang/String;
    .restart local v3       #deviceInstalledAppsList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .restart local v5       #i:I
    .restart local v6       #list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/enterprise/DmAppInfo;>;"
    :cond_8f
    move-object v0, v1

    .end local v1           #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v0       #appsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    goto :goto_6f
.end method

.method public getTopNCPUUsageApp(I)Ljava/util/List;
    .registers 27
    .parameter "aAppCount"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/app/enterprise/AppInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    const-string v22, "android.permission.sec.MDM_APP_MGMT"

    const-string v23, "Application Policy"

    invoke-virtual/range {v21 .. v23}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1231
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_18

    .line 1232
    const-string v21, "ApplicationPolicy"

    const-string v22, "getTopNCPUUsageApp start"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1235
    :cond_18
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApplicationPolicy;->readProcInfo()Ljava/util/Map;

    move-result-object v19

    .line 1236
    .local v19, lPrevState:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApplicationPolicy;->readCpuTime()J

    move-result-wide v17

    .line 1241
    .local v17, lPrevCpuTime:J
    const-wide/16 v21, 0x3e8

    :try_start_22
    invoke-static/range {v21 .. v22}, Ljava/lang/Thread;->sleep(J)V
    :try_end_25
    .catch Ljava/lang/InterruptedException; {:try_start_22 .. :try_end_25} :catch_ab

    .line 1247
    :goto_25
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApplicationPolicy;->readProcInfo()Ljava/util/Map;

    move-result-object v13

    .line 1248
    .local v13, lCurrent:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApplicationPolicy;->readCpuTime()J

    move-result-wide v10

    .line 1249
    .local v10, lCPUTime:J
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_5a

    .line 1250
    const-string v21, "ApplicationPolicy"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "calculating cpu usage between time: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "-"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-wide v1, v10

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1253
    :cond_5a
    sub-long v14, v10, v17

    .line 1255
    .local v14, lDeltaTime:J
    invoke-interface {v13}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v16

    .line 1258
    .local v16, lPids:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 1260
    new-instance v20, Ljava/util/Vector;

    invoke-direct/range {v20 .. v20}, Ljava/util/Vector;-><init>()V

    .line 1262
    .local v20, lResults:Ljava/util/Vector;,"Ljava/util/Vector<Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .end local p0
    .local v7, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/Integer;>;"
    :goto_74
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_b1

    .line 1263
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 1264
    .local v6, index:I
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object v0, v13

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    move-object/from16 v0, p0

    move-object v1, v4

    move-wide v2, v14

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->delta(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;J)Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_74

    .line 1242
    .end local v6           #index:I
    .end local v7           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/Integer;>;"
    .end local v10           #lCPUTime:J
    .end local v13           #lCurrent:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    .end local v14           #lDeltaTime:J
    .end local v16           #lPids:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v20           #lResults:Ljava/util/Vector;,"Ljava/util/Vector<Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    .restart local p0
    :catch_ab
    move-exception v4

    .line 1243
    .local v4, e:Ljava/lang/InterruptedException;
    invoke-virtual {v4}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_25

    .line 1266
    .end local v4           #e:Ljava/lang/InterruptedException;
    .end local p0
    .restart local v7       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/Integer;>;"
    .restart local v10       #lCPUTime:J
    .restart local v13       #lCurrent:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    .restart local v14       #lDeltaTime:J
    .restart local v16       #lPids:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v20       #lResults:Ljava/util/Vector;,"Ljava/util/Vector<Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    :cond_b1
    invoke-static/range {v20 .. v20}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1269
    if-ltz p1, :cond_c0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->size()I

    move-result v21

    move/from16 v0, v21

    move/from16 v1, p1

    if-ge v0, v1, :cond_c4

    .line 1270
    :cond_c0
    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->size()I

    move-result p1

    .line 1274
    :cond_c4
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1275
    .local v9, lCPUInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/enterprise/AppInfo;>;"
    const/4 v5, 0x0

    .local v5, i:I
    :goto_ca
    move v0, v5

    move/from16 v1, p1

    if-ge v0, v1, :cond_12e

    .line 1276
    move-object/from16 v0, v20

    move v1, v5

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    .line 1277
    .local v12, lCpuInfo:Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;
    new-instance v8, Landroid/app/enterprise/AppInfo;

    invoke-direct {v8}, Landroid/app/enterprise/AppInfo;-><init>()V

    .line 1278
    .local v8, lAppInfo:Landroid/app/enterprise/AppInfo;
    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mCmd:Ljava/lang/String;
    invoke-static {v12}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$300(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)Ljava/lang/String;

    move-result-object v21

    move-object v0, v8

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/app/enterprise/AppInfo;->setPackageName(Ljava/lang/String;)V

    .line 1280
    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mUsage:J
    invoke-static {v12}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$400(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)J

    move-result-wide v21

    move-wide/from16 v0, v21

    long-to-float v0, v0

    move/from16 v21, v0

    const/high16 v22, 0x4120

    div-float v21, v21, v22

    move-object v0, v8

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/app/enterprise/AppInfo;->setCPUUsageInfo(F)V

    .line 1281
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1282
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_12b

    .line 1283
    const-string v21, "ApplicationPolicy"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, ""

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mCmd:Ljava/lang/String;
    invoke-static {v12}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$300(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " cpu usage:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mUsage:J
    invoke-static {v12}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$400(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)J

    move-result-wide v23

    invoke-virtual/range {v22 .. v24}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1275
    :cond_12b
    add-int/lit8 v5, v5, 0x1

    goto :goto_ca

    .line 1287
    .end local v8           #lAppInfo:Landroid/app/enterprise/AppInfo;
    .end local v12           #lCpuInfo:Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;
    :cond_12e
    sget-boolean v21, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v21, :cond_139

    .line 1288
    const-string v21, "ApplicationPolicy"

    const-string v22, "getTopNCPUUsageApp end"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1290
    :cond_139
    return-object v9
.end method

.method public getTopNDataUsageApp(I)Ljava/util/List;
    .registers 11
    .parameter "aAppCount"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/app/enterprise/AppInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const-string v8, "ApplicationPolicy"

    .line 1148
    iget-object v5, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v6, "android.permission.sec.MDM_APP_MGMT"

    const-string v7, "Application Policy"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1149
    sget-boolean v5, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v5, :cond_16

    .line 1150
    const-string v5, "ApplicationPolicy"

    const-string v5, "getTopNDataUsageApp start"

    invoke-static {v8, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1153
    :cond_16
    invoke-direct {p0}, Lcom/android/server/enterprise/ApplicationPolicy;->readAppSizeInfo()Ljava/util/List;

    move-result-object v2

    .line 1154
    .local v2, lResults:Ljava/util/List;,"Ljava/util/List<Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1155
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1158
    .local v4, lStorageInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/enterprise/AppInfo;>;"
    if-ltz p1, :cond_2a

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v5, p1, :cond_2e

    .line 1159
    :cond_2a
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p1

    .line 1162
    :cond_2e
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2f
    if-ge v0, p1, :cond_7e

    .line 1163
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    .line 1164
    .local v1, lDataInfo:Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;
    new-instance v3, Landroid/app/enterprise/AppInfo;

    invoke-direct {v3}, Landroid/app/enterprise/AppInfo;-><init>()V

    .line 1165
    .local v3, lStorageInfo:Landroid/app/enterprise/AppInfo;
    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mCmd:Ljava/lang/String;
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$300(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/app/enterprise/AppInfo;->setPackageName(Ljava/lang/String;)V

    .line 1166
    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mUsage:J
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$400(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Landroid/app/enterprise/AppInfo;->setSize(J)V

    .line 1167
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1168
    sget-boolean v5, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v5, :cond_7b

    .line 1169
    const-string v5, "ApplicationPolicy"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mCmd:Ljava/lang/String;
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$300(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " data usage:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mUsage:J
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$400(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1162
    :cond_7b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2f

    .line 1172
    .end local v1           #lDataInfo:Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;
    .end local v3           #lStorageInfo:Landroid/app/enterprise/AppInfo;
    :cond_7e
    sget-boolean v5, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v5, :cond_89

    .line 1173
    const-string v5, "ApplicationPolicy"

    const-string v5, "getTopNDataUsageApp end"

    invoke-static {v8, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1175
    :cond_89
    return-object v4
.end method

.method public getTopNMemoryUsageApp(I)Ljava/util/List;
    .registers 11
    .parameter "aAppCount"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/app/enterprise/AppInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const-string v8, "ApplicationPolicy"

    .line 1065
    iget-object v5, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v6, "android.permission.sec.MDM_APP_MGMT"

    const-string v7, "Application Policy"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1066
    sget-boolean v5, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v5, :cond_16

    .line 1067
    const-string v5, "ApplicationPolicy"

    const-string v5, "getTopNMemoryUsageApp start"

    invoke-static {v8, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1070
    :cond_16
    invoke-direct {p0}, Lcom/android/server/enterprise/ApplicationPolicy;->readAppMemoryInfo()Ljava/util/List;

    move-result-object v2

    .line 1071
    .local v2, lResults:Ljava/util/List;,"Ljava/util/List<Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;>;"
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1072
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1074
    .local v4, lStorageInfoList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/enterprise/AppInfo;>;"
    if-ltz p1, :cond_2a

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v5, p1, :cond_2e

    .line 1075
    :cond_2a
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p1

    .line 1078
    :cond_2e
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2f
    if-ge v0, p1, :cond_7e

    .line 1079
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;

    .line 1080
    .local v1, lMemInfo:Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;
    new-instance v3, Landroid/app/enterprise/AppInfo;

    invoke-direct {v3}, Landroid/app/enterprise/AppInfo;-><init>()V

    .line 1081
    .local v3, lStorageInfo:Landroid/app/enterprise/AppInfo;
    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mCmd:Ljava/lang/String;
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$300(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/app/enterprise/AppInfo;->setPackageName(Ljava/lang/String;)V

    .line 1082
    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mUsage:J
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$400(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Landroid/app/enterprise/AppInfo;->setSize(J)V

    .line 1083
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1084
    sget-boolean v5, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v5, :cond_7b

    .line 1085
    const-string v5, "ApplicationPolicy"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mCmd:Ljava/lang/String;
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$300(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " memory usage:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    #getter for: Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->mUsage:J
    invoke-static {v1}, Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;->access$400(Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1078
    :cond_7b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2f

    .line 1088
    .end local v1           #lMemInfo:Lcom/android/server/enterprise/ApplicationPolicy$AppInfoTask;
    .end local v3           #lStorageInfo:Landroid/app/enterprise/AppInfo;
    :cond_7e
    sget-boolean v5, Lcom/android/server/enterprise/Utils;->mLogEnbaled:Z

    if-eqz v5, :cond_89

    .line 1089
    const-string v5, "ApplicationPolicy"

    const-string v5, "getTopNMemoryUsageApp end"

    invoke-static {v8, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1091
    :cond_89
    return-object v4
.end method

.method public installApplication(Ljava/lang/String;Z)Z
    .registers 21
    .parameter "apkFilePath"
    .parameter "installOnSDCard"

    .prologue
    .line 380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object v3, v0

    const-string v4, "android.permission.sec.MDM_APP_MGMT"

    const-string v5, "Application Policy"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    const/4 v14, 0x0

    .line 383
    .local v14, success:Z
    const-string v3, "ApplicationPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "PID : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    const-string v3, "ApplicationPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "UID : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    const-string v3, "ApplicationPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "PID : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    const-string v3, "ApplicationPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "UID : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    invoke-static/range {p1 .. p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 390
    if-eqz p1, :cond_8f

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".apk"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_91

    :cond_8f
    move v15, v14

    .line 437
    .end local v14           #success:Z
    .local v15, success:I
    :goto_90
    return v15

    .line 393
    .end local v15           #success:I
    .restart local v14       #success:Z
    :cond_91
    const/4 v12, 0x2

    .line 395
    .local v12, installFlags:I
    if-eqz p2, :cond_f7

    .line 396
    or-int/lit8 v12, v12, 0x8

    .line 400
    :goto_96
    new-instance v13, Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;

    move-object v0, v13

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;)V

    .line 402
    .local v13, obs:Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v16

    .line 405
    .local v16, token:J
    :try_start_a2
    new-instance v10, Ljava/io/File;

    move-object v0, v10

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 406
    .local v10, apkFile:Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_fa

    .line 407
    new-instance v3, Ljava/lang/Exception;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ApplicationPolicy: Not a valid file \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_d2
    .catchall {:try_start_a2 .. :try_end_d2} :catchall_129
    .catch Ljava/lang/Exception; {:try_start_a2 .. :try_end_d2} :catch_d2

    .line 427
    .end local v10           #apkFile:Ljava/io/File;
    :catch_d2
    move-exception v3

    move-object v11, v3

    .line 428
    .local v11, e:Ljava/lang/Exception;
    :try_start_d4
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_d7
    .catchall {:try_start_d4 .. :try_end_d7} :catchall_129

    .line 431
    if-eqz v14, :cond_f2

    .line 432
    new-instance v2, Lcom/android/server/enterprise/DmAppInfo;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object v3, v0

    iget-object v4, v13, Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;->pkgName:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v9}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 433
    .local v2, appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v3, 0x1

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-virtual/range {v2 .. v7}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z

    .line 435
    .end local v2           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    .end local v11           #e:Ljava/lang/Exception;
    :cond_f2
    :goto_f2
    invoke-static/range {v16 .. v17}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move v15, v14

    .line 437
    .restart local v15       #success:I
    goto :goto_90

    .line 398
    .end local v13           #obs:Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;
    .end local v15           #success:I
    .end local v16           #token:J
    :cond_f7
    or-int/lit8 v12, v12, 0x10

    goto :goto_96

    .line 409
    .restart local v10       #apkFile:Ljava/io/File;
    .restart local v13       #obs:Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;
    .restart local v16       #token:J
    :cond_fa
    :try_start_fa
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApplicationPolicy;->canRead(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_14a

    .line 410
    new-instance v3, Ljava/lang/Exception;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ApplicationPolicy: Permission denied - Unable to open file \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_129
    .catchall {:try_start_fa .. :try_end_129} :catchall_129
    .catch Ljava/lang/Exception; {:try_start_fa .. :try_end_129} :catch_d2

    .line 431
    .end local v10           #apkFile:Ljava/io/File;
    :catchall_129
    move-exception v3

    move-object v10, v3

    if-eqz v14, :cond_146

    .line 432
    new-instance v2, Lcom/android/server/enterprise/DmAppInfo;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object v3, v0

    iget-object v4, v13, Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;->pkgName:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v9}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 433
    .restart local v2       #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v3, 0x1

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-virtual/range {v2 .. v7}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z

    .line 435
    .end local v2           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_146
    invoke-static/range {v16 .. v17}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 431
    throw v10

    .line 412
    .restart local v10       #apkFile:Ljava/io/File;
    :cond_14a
    :try_start_14a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    move-object v3, v0

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v13, v12, v5}, Landroid/content/pm/PackageManager;->installPackage(Landroid/net/Uri;Landroid/content/pm/IPackageInstallObserver;ILjava/lang/String;)V

    .line 414
    monitor-enter v13
    :try_end_158
    .catchall {:try_start_14a .. :try_end_158} :catchall_129
    .catch Ljava/lang/Exception; {:try_start_14a .. :try_end_158} :catch_d2

    .line 415
    :goto_158
    :try_start_158
    iget-boolean v3, v13, Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;->finished:Z
    :try_end_15a
    .catchall {:try_start_158 .. :try_end_15a} :catchall_188

    if-nez v3, :cond_162

    .line 417
    :try_start_15c
    invoke-virtual {v13}, Ljava/lang/Object;->wait()V
    :try_end_15f
    .catchall {:try_start_15c .. :try_end_15f} :catchall_188
    .catch Ljava/lang/InterruptedException; {:try_start_15c .. :try_end_15f} :catch_160

    goto :goto_158

    .line 418
    :catch_160
    move-exception v3

    goto :goto_158

    .line 421
    :cond_162
    :try_start_162
    iget v3, v13, Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;->result:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_186

    .line 422
    const/4 v14, 0x1

    .line 426
    :goto_168
    monitor-exit v13
    :try_end_169
    .catchall {:try_start_162 .. :try_end_169} :catchall_188

    .line 431
    if-eqz v14, :cond_f2

    .line 432
    new-instance v2, Lcom/android/server/enterprise/DmAppInfo;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object v3, v0

    iget-object v4, v13, Lcom/android/server/enterprise/ApplicationPolicy$PackageInstallObserver;->pkgName:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v9}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 433
    .restart local v2       #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v3, 0x1

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-virtual/range {v2 .. v7}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z

    goto/16 :goto_f2

    .line 424
    .end local v2           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_186
    const/4 v14, 0x0

    goto :goto_168

    .line 426
    :catchall_188
    move-exception v3

    :try_start_189
    monitor-exit v13
    :try_end_18a
    .catchall {:try_start_189 .. :try_end_18a} :catchall_188

    :try_start_18a
    throw v3
    :try_end_18b
    .catchall {:try_start_18a .. :try_end_18b} :catchall_129
    .catch Ljava/lang/Exception; {:try_start_18a .. :try_end_18b} :catch_d2
.end method

.method public isApplicationInstalled(Ljava/lang/String;)Z
    .registers 10
    .parameter "pkgName"

    .prologue
    .line 315
    iget-object v5, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v6, "android.permission.sec.MDM_APP_MGMT"

    const-string v7, "Application Policy"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    const/4 v4, 0x0

    .line 317
    .local v4, isInstalled:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 318
    if-eqz p1, :cond_39

    .line 320
    :try_start_10
    iget-object v5, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    const/16 v6, 0x2000

    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v0

    .line 321
    .local v0, appinfoList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    if-eqz v0, :cond_39

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_39

    .line 322
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_24
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 323
    .local v1, applicationInfo:Landroid/content/pm/ApplicationInfo;
    iget-object v5, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_35} :catch_3a

    move-result v5

    if-eqz v5, :cond_24

    .line 324
    const/4 v4, 0x1

    .line 334
    .end local v0           #appinfoList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    .end local v1           #applicationInfo:Landroid/content/pm/ApplicationInfo;
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_39
    :goto_39
    return v4

    .line 329
    :catch_3a
    move-exception v5

    move-object v2, v5

    .line 330
    .local v2, e:Ljava/lang/Exception;
    const/4 v4, 0x0

    .line 331
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_39
.end method

.method public isApplicationRunning(Ljava/lang/String;)Z
    .registers 11
    .parameter "pkgName"

    .prologue
    .line 345
    iget-object v6, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v7, "android.permission.sec.MDM_APP_MGMT"

    const-string v8, "Application Policy"

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    const/4 v3, 0x0

    .line 347
    .local v3, isInstalled:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 348
    if-eqz p1, :cond_3f

    .line 350
    :try_start_10
    iget-object v6, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v7, "activity"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 351
    .local v0, amgr:Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v4

    .line 353
    .local v4, runninAppinfList:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v4, :cond_3f

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_3f

    .line 354
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 355
    .local v5, runningApplicationInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget-object v6, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v6, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_3b} :catch_40

    move-result v6

    if-eqz v6, :cond_2a

    .line 356
    const/4 v3, 0x1

    .line 366
    .end local v0           #amgr:Landroid/app/ActivityManager;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v4           #runninAppinfList:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v5           #runningApplicationInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_3f
    :goto_3f
    return v3

    .line 361
    :catch_40
    move-exception v6

    move-object v1, v6

    .line 362
    .local v1, e:Ljava/lang/Exception;
    const/4 v3, 0x0

    .line 363
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3f
.end method

.method public removeManagedApplications(Ljava/util/List;)Ljava/util/ArrayList;
    .registers 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    .local p1, packageList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    const/4 v3, 0x0

    .line 168
    .local v3, removedAppList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_3e

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_3e

    .line 169
    new-instance v3, Ljava/util/ArrayList;

    .end local v3           #removedAppList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .restart local v3       #removedAppList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1b
    :goto_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 172
    .local v2, pkg:Ljava/lang/String;
    :try_start_27
    invoke-static {v2}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 173
    if-eqz v2, :cond_1b

    .line 174
    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4}, Lcom/android/server/enterprise/ApplicationPolicy;->uninstallApplication(Ljava/lang/String;Z)Z

    .line 175
    invoke-virtual {p0, v2}, Lcom/android/server/enterprise/ApplicationPolicy;->deleteManagedAppInfo(Ljava/lang/String;)Z

    .line 176
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_37} :catch_38

    goto :goto_1b

    .line 178
    :catch_38
    move-exception v4

    move-object v0, v4

    .line 179
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1b

    .line 183
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #pkg:Ljava/lang/String;
    :cond_3e
    return-object v3
.end method

.method public bridge synthetic removeManagedApplications(Ljava/util/List;)Ljava/util/List;
    .registers 3
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->removeManagedApplications(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public setApplicationInstallationDisabled(Ljava/lang/String;Z)V
    .registers 13
    .parameter "packageName"
    .parameter "disableAppInstallation"

    .prologue
    const/4 v9, 0x0

    .line 587
    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.sec.MDM_APP_MGMT"

    const-string v3, "Application Policy"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 589
    if-eqz p1, :cond_27

    .line 591
    :try_start_10
    new-instance v0, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 592
    .local v0, appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v1, -0x1

    const/4 v2, -0x1

    const/4 v3, -0x1

    if-eqz p2, :cond_28

    const/4 v4, 0x1

    :goto_23
    const/4 v5, -0x1

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_27} :catch_2a

    .line 597
    .end local v0           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_27
    :goto_27
    return-void

    .restart local v0       #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_28
    move v4, v9

    .line 592
    goto :goto_23

    .line 593
    .end local v0           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :catch_2a
    move-exception v1

    move-object v8, v1

    .line 594
    .local v8, e:Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_27
.end method

.method public setApplicationState(Ljava/lang/String;Z)Z
    .registers 21
    .parameter "packageName"
    .parameter "enableApp"

    .prologue
    .line 544
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object v5, v0

    const-string v6, "android.permission.sec.MDM_APP_MGMT"

    const-string v7, "Application Policy"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    const/4 v15, 0x0

    .line 547
    .local v15, success:Z
    invoke-static/range {p1 .. p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 548
    if-eqz p1, :cond_77

    .line 550
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v16

    .line 552
    .local v16, token:J
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    move-object v5, v0

    if-eqz p2, :cond_78

    const/4 v6, 0x1

    :goto_1f
    const/4 v7, 0x0

    move-object v0, v5

    move-object/from16 v1, p1

    move v2, v6

    move v3, v7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->setApplicationEnabledSetting(Ljava/lang/String;II)V

    .line 553
    invoke-virtual/range {p0 .. p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationStateEnabled(Ljava/lang/String;)Z

    move-result v14

    .line 554
    .local v14, state:Z
    move v0, v14

    move/from16 v1, p2

    if-ne v0, v1, :cond_4d

    .line 555
    new-instance v4, Lcom/android/server/enterprise/DmAppInfo;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object v5, v0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v11}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 556
    .local v4, appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v5, -0x1

    const/4 v6, -0x1

    if-eqz p2, :cond_7a

    const/4 v7, 0x0

    :goto_47
    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-virtual/range {v4 .. v9}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z

    .line 557
    const/4 v15, 0x1

    .line 560
    .end local v4           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_4d
    new-instance v13, Landroid/content/Intent;

    if-eqz v14, :cond_7c

    const-string v5, "android.intent.action.PACKAGE_ADDED"

    :goto_53
    const-string v6, "package"

    const/4 v7, 0x0

    move-object v0, v6

    move-object/from16 v1, p1

    move-object v2, v7

    invoke-static {v0, v1, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v13, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 562
    .local v13, intent:Landroid/content/Intent;
    const/high16 v5, 0x1000

    invoke-virtual {v13, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 563
    const-string v5, "android.intent.extra.REPLACING"

    const/4 v6, 0x0

    invoke-virtual {v13, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 564
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    move-object v5, v0

    invoke-virtual {v5, v13}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_74
    .catchall {:try_start_17 .. :try_end_74} :catchall_85
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_74} :catch_7f

    .line 570
    .end local v13           #intent:Landroid/content/Intent;
    .end local v14           #state:Z
    :goto_74
    invoke-static/range {v16 .. v17}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 573
    .end local v16           #token:J
    :cond_77
    return v15

    .line 552
    .restart local v16       #token:J
    :cond_78
    const/4 v6, 0x2

    goto :goto_1f

    .line 556
    .restart local v4       #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    .restart local v14       #state:Z
    :cond_7a
    const/4 v7, 0x1

    goto :goto_47

    .line 560
    .end local v4           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_7c
    :try_start_7c
    const-string v5, "android.intent.action.PACKAGE_REMOVED"
    :try_end_7e
    .catchall {:try_start_7c .. :try_end_7e} :catchall_85
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_7e} :catch_7f

    goto :goto_53

    .line 567
    .end local v14           #state:Z
    :catch_7f
    move-exception v5

    move-object v12, v5

    .line 568
    .local v12, e:Ljava/lang/Exception;
    :try_start_81
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_84
    .catchall {:try_start_81 .. :try_end_84} :catchall_85

    goto :goto_74

    .line 570
    .end local v12           #e:Ljava/lang/Exception;
    :catchall_85
    move-exception v5

    invoke-static/range {v16 .. v17}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5
.end method

.method public setApplicationUninstallationDisabled(Ljava/lang/String;Z)V
    .registers 13
    .parameter "packageName"
    .parameter "disableAppUninstallation"

    .prologue
    const/4 v9, 0x0

    .line 610
    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.sec.MDM_APP_MGMT"

    const-string v3, "Application Policy"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 612
    if-eqz p1, :cond_27

    .line 614
    :try_start_10
    new-instance v0, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 615
    .local v0, appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v1, -0x1

    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, -0x1

    if-eqz p2, :cond_28

    const/4 v5, 0x1

    :goto_24
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_27} :catch_2a

    .line 620
    .end local v0           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_27
    :goto_27
    return-void

    .restart local v0       #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_28
    move v5, v9

    .line 615
    goto :goto_24

    .line 616
    .end local v0           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :catch_2a
    move-exception v1

    move-object v8, v1

    .line 617
    .local v8, e:Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_27
.end method

.method public uninstallApplication(Ljava/lang/String;Z)Z
    .registers 16
    .parameter "packageName"
    .parameter "keepDataAndCache"

    .prologue
    .line 485
    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.sec.MDM_APP_MGMT"

    const-string v3, "Application Policy"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 487
    if-nez p1, :cond_11

    .line 488
    const/4 v1, 0x0

    .line 518
    :goto_10
    return v1

    .line 489
    :cond_11
    const/4 v12, 0x0

    .line 490
    .local v12, unInstallFlags:I
    if-eqz p2, :cond_15

    .line 491
    const/4 v12, 0x1

    .line 494
    :cond_15
    new-instance v9, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;

    invoke-direct {v9, p0}, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;-><init>(Lcom/android/server/enterprise/ApplicationPolicy;)V

    .line 496
    .local v9, obs:Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v10

    .line 499
    .local v10, token:J
    :try_start_1e
    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, p1, v9, v12}, Landroid/content/pm/PackageManager;->deletePackage(Ljava/lang/String;Landroid/content/pm/IPackageDeleteObserver;I)V

    .line 501
    monitor-enter v9
    :try_end_24
    .catchall {:try_start_1e .. :try_end_24} :catchall_70
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_24} :catch_51

    .line 502
    :goto_24
    :try_start_24
    iget-boolean v1, v9, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->finished:Z
    :try_end_26
    .catchall {:try_start_24 .. :try_end_26} :catchall_4e

    if-nez v1, :cond_2e

    .line 504
    :try_start_28
    invoke-virtual {v9}, Ljava/lang/Object;->wait()V
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_4e
    .catch Ljava/lang/InterruptedException; {:try_start_28 .. :try_end_2b} :catch_2c

    goto :goto_24

    .line 505
    :catch_2c
    move-exception v1

    goto :goto_24

    .line 508
    :cond_2e
    :try_start_2e
    monitor-exit v9
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_4e

    .line 512
    iget-boolean v1, v9, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->result:Z

    if-eqz v1, :cond_48

    .line 513
    new-instance v0, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 514
    .local v0, appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z

    .line 516
    .end local v0           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_48
    :goto_48
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 518
    iget-boolean v1, v9, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->result:Z

    goto :goto_10

    .line 508
    :catchall_4e
    move-exception v1

    :try_start_4f
    monitor-exit v9
    :try_end_50
    .catchall {:try_start_4f .. :try_end_50} :catchall_4e

    :try_start_50
    throw v1
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_70
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_51} :catch_51

    .line 509
    :catch_51
    move-exception v1

    move-object v8, v1

    .line 510
    .local v8, e:Ljava/lang/Exception;
    :try_start_53
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_70

    .line 512
    iget-boolean v1, v9, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->result:Z

    if-eqz v1, :cond_48

    .line 513
    new-instance v0, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 514
    .restart local v0       #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z

    goto :goto_48

    .line 512
    .end local v0           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    .end local v8           #e:Ljava/lang/Exception;
    :catchall_70
    move-exception v1

    move-object v8, v1

    iget-boolean v1, v9, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->result:Z

    if-eqz v1, :cond_8b

    .line 513
    new-instance v0, Lcom/android/server/enterprise/DmAppInfo;

    iget-object v1, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/android/server/enterprise/DmAppInfo;-><init>(Landroid/content/Context;Ljava/lang/String;IIIII)V

    .line 514
    .restart local v0       #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/enterprise/DmAppInfo;->updateAppManagerDB(IIIII)Z

    .line 516
    .end local v0           #appInfo:Lcom/android/server/enterprise/DmAppInfo;
    :cond_8b
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 512
    throw v8
.end method

.method public wipeApplicationData(Ljava/lang/String;)Z
    .registers 9
    .parameter "pkgName"

    .prologue
    .line 194
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.sec.MDM_APP_MGMT"

    const-string v6, "Application Policy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    const/4 v1, 0x0

    .line 196
    .local v1, success:Z
    invoke-static {p1}, Lcom/android/server/enterprise/ApplicationPolicy;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 197
    if-eqz p1, :cond_21

    .line 198
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 200
    .local v2, token:J
    :try_start_14
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->clearUserData(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 201
    const/4 v1, 0x1

    .line 202
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/ApplicationPolicy;->clearApplicationCacheFiles(Ljava/lang/String;)Z
    :try_end_1e
    .catchall {:try_start_14 .. :try_end_1e} :catchall_29
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_1e} :catch_22

    .line 208
    :cond_1e
    :goto_1e
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 211
    .end local v2           #token:J
    :cond_21
    return v1

    .line 204
    .restart local v2       #token:J
    :catch_22
    move-exception v4

    move-object v0, v4

    .line 205
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 206
    :try_start_25
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_29

    goto :goto_1e

    .line 208
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_29
    move-exception v4

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4
.end method
