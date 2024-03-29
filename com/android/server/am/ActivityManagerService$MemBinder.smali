.class Lcom/android/server/am/ActivityManagerService$MemBinder;
.super Landroid/os/Binder;
.source "ActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/ActivityManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MemBinder"
.end annotation


# instance fields
.field mActivityManagerService:Lcom/android/server/am/ActivityManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityManagerService;)V
    .registers 2
    .parameter "activityManagerService"

    .prologue
    .line 1344
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 1345
    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService$MemBinder;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    .line 1346
    return-void
.end method


# virtual methods
.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 12
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 1350
    iget-object v4, p0, Lcom/android/server/am/ActivityManagerService$MemBinder;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    .line 1352
    .local v4, service:Lcom/android/server/am/ActivityManagerService;
    iget-object v5, p0, Lcom/android/server/am/ActivityManagerService$MemBinder;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v5

    .line 1353
    if-eqz p3, :cond_73

    :try_start_7
    array-length v6, p3

    if-lez v6, :cond_73

    const/4 v6, 0x0

    aget-object v6, p3, v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2d

    if-eq v6, v7, :cond_73

    .line 1355
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_4f

    .line 1356
    .local v3, procs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    const/4 v1, -0x1

    .line 1358
    .local v1, pid:I
    const/4 v6, 0x0

    :try_start_1d
    aget-object v6, p3, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_22
    .catchall {:try_start_1d .. :try_end_22} :catchall_4f
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_22} :catch_81

    move-result v1

    .line 1362
    :goto_23
    :try_start_23
    iget-object v6, v4, Lcom/android/server/am/ActivityManagerService;->mLruProcesses:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x1

    sub-int v0, v6, v7

    .local v0, i:I
    :goto_2c
    if-ltz v0, :cond_52

    .line 1363
    iget-object v6, v4, Lcom/android/server/am/ActivityManagerService;->mLruProcesses:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/ProcessRecord;

    .line 1364
    .local v2, proc:Lcom/android/server/am/ProcessRecord;
    iget v6, v2, Lcom/android/server/am/ProcessRecord;->pid:I

    if-ne v6, v1, :cond_40

    .line 1365
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1362
    :cond_3d
    :goto_3d
    add-int/lit8 v0, v0, -0x1

    goto :goto_2c

    .line 1366
    :cond_40
    iget-object v6, v2, Lcom/android/server/am/ProcessRecord;->processName:Ljava/lang/String;

    const/4 v7, 0x0

    aget-object v7, p3, v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3d

    .line 1367
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3d

    .line 1377
    .end local v0           #i:I
    .end local v1           #pid:I
    .end local v2           #proc:Lcom/android/server/am/ProcessRecord;
    .end local v3           #procs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    :catchall_4f
    move-exception v6

    monitor-exit v5
    :try_end_51
    .catchall {:try_start_23 .. :try_end_51} :catchall_4f

    throw v6

    .line 1370
    .restart local v0       #i:I
    .restart local v1       #pid:I
    .restart local v3       #procs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    :cond_52
    :try_start_52
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-gtz v6, :cond_7a

    .line 1371
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No process found for: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v7, p3, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1372
    monitor-exit v5

    .line 1379
    .end local v0           #i:I
    .end local v1           #pid:I
    :goto_72
    return-void

    .line 1375
    .end local v3           #procs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    :cond_73
    new-instance v3, Ljava/util/ArrayList;

    iget-object v6, v4, Lcom/android/server/am/ActivityManagerService;->mLruProcesses:Ljava/util/ArrayList;

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1377
    .restart local v3       #procs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    :cond_7a
    monitor-exit v5
    :try_end_7b
    .catchall {:try_start_52 .. :try_end_7b} :catchall_4f

    .line 1378
    const-string v5, "  "

    invoke-static {p1, p2, v3, v5, p3}, Lcom/android/server/am/ActivityManagerService;->dumpApplicationMemoryUsage(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;Ljava/util/List;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_72

    .line 1359
    .restart local v1       #pid:I
    :catch_81
    move-exception v6

    goto :goto_23
.end method
