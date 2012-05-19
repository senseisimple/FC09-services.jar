.class Lcom/android/server/WimaxService$LockList;
.super Ljava/lang/Object;
.source "WimaxService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WimaxService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LockList"
.end annotation


# instance fields
.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/WimaxService$WimaxLock;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/server/WimaxService;


# direct methods
.method private constructor <init>(Lcom/android/server/WimaxService;)V
    .registers 3
    .parameter

    .prologue
    .line 1400
    iput-object p1, p0, Lcom/android/server/WimaxService$LockList;->this$0:Lcom/android/server/WimaxService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1401
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    .line 1402
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/WimaxService;Lcom/android/server/WimaxService$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1397
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService$LockList;-><init>(Lcom/android/server/WimaxService;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/android/server/WimaxService$LockList;Ljava/io/PrintWriter;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1397
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService$LockList;->dump(Ljava/io/PrintWriter;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/server/WimaxService$LockList;Lcom/android/server/WimaxService$WimaxLock;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1397
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService$LockList;->addLock(Lcom/android/server/WimaxService$WimaxLock;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/server/WimaxService$LockList;Landroid/os/IBinder;)Lcom/android/server/WimaxService$WimaxLock;
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1397
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService$LockList;->removeLock(Landroid/os/IBinder;)Lcom/android/server/WimaxService$WimaxLock;

    move-result-object v0

    return-object v0
.end method

.method private addLock(Lcom/android/server/WimaxService$WimaxLock;)V
    .registers 3
    .parameter "lock"

    .prologue
    .line 1421
    iget-object v0, p1, Lcom/android/server/WimaxService$DeathRecipient;->mBinder:Landroid/os/IBinder;

    invoke-direct {p0, v0}, Lcom/android/server/WimaxService$LockList;->findLockByBinder(Landroid/os/IBinder;)I

    move-result v0

    if-gez v0, :cond_d

    .line 1422
    iget-object v0, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1424
    :cond_d
    return-void
.end method

.method private dump(Ljava/io/PrintWriter;)V
    .registers 5
    .parameter "pw"

    .prologue
    .line 1446
    iget-object v2, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WimaxService$WimaxLock;

    .line 1447
    .local v1, l:Lcom/android/server/WimaxService$WimaxLock;
    const-string v2, "    "

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1448
    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    goto :goto_6

    .line 1450
    .end local v1           #l:Lcom/android/server/WimaxService$WimaxLock;
    :cond_1b
    return-void
.end method

.method private findLockByBinder(Landroid/os/IBinder;)I
    .registers 5
    .parameter "binder"

    .prologue
    .line 1438
    iget-object v2, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 1439
    .local v1, size:I
    const/4 v2, 0x1

    sub-int v0, v1, v2

    .local v0, i:I
    :goto_9
    if-ltz v0, :cond_1c

    .line 1440
    iget-object v2, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/WimaxService$WimaxLock;

    iget-object v2, v2, Lcom/android/server/WimaxService$DeathRecipient;->mBinder:Landroid/os/IBinder;

    if-ne v2, p1, :cond_19

    move v2, v0

    .line 1442
    :goto_18
    return v2

    .line 1439
    :cond_19
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 1442
    :cond_1c
    const/4 v2, -0x1

    goto :goto_18
.end method

.method private declared-synchronized getStrongestLockMode()I
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 1409
    monitor-enter p0

    :try_start_2
    iget-object v2, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_27

    move-result v2

    if-eqz v2, :cond_d

    move v2, v3

    .line 1417
    :goto_b
    monitor-exit p0

    return v2

    .line 1412
    :cond_d
    :try_start_d
    iget-object v2, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WimaxService$WimaxLock;

    .line 1413
    .local v1, l:Lcom/android/server/WimaxService$WimaxLock;
    iget v2, v1, Lcom/android/server/WimaxService$DeathRecipient;->mMode:I
    :try_end_21
    .catchall {:try_start_d .. :try_end_21} :catchall_27

    if-ne v2, v3, :cond_13

    move v2, v3

    .line 1414
    goto :goto_b

    .line 1417
    .end local v1           #l:Lcom/android/server/WimaxService$WimaxLock;
    :cond_25
    const/4 v2, 0x2

    goto :goto_b

    .line 1409
    .end local v0           #i$:Ljava/util/Iterator;
    :catchall_27
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized hasLocks()Z
    .registers 2

    .prologue
    .line 1405
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_e

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_a
    monitor-exit p0

    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_a

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private removeLock(Landroid/os/IBinder;)Lcom/android/server/WimaxService$WimaxLock;
    .registers 5
    .parameter "binder"

    .prologue
    .line 1427
    invoke-direct {p0, p1}, Lcom/android/server/WimaxService$LockList;->findLockByBinder(Landroid/os/IBinder;)I

    move-result v0

    .line 1428
    .local v0, index:I
    if-ltz v0, :cond_13

    .line 1429
    iget-object v2, p0, Lcom/android/server/WimaxService$LockList;->mList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WimaxService$WimaxLock;

    .line 1430
    .local v1, ret:Lcom/android/server/WimaxService$WimaxLock;
    invoke-virtual {v1}, Lcom/android/server/WimaxService$WimaxLock;->unlinkDeathRecipient()V

    move-object v2, v1

    .line 1433
    .end local v1           #ret:Lcom/android/server/WimaxService$WimaxLock;
    :goto_12
    return-object v2

    :cond_13
    const/4 v2, 0x0

    goto :goto_12
.end method
