.class Lcom/android/server/WimaxService$WimaxLock;
.super Lcom/android/server/WimaxService$DeathRecipient;
.source "WimaxService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WimaxService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WimaxLock"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WimaxService;


# direct methods
.method constructor <init>(Lcom/android/server/WimaxService;ILjava/lang/String;Landroid/os/IBinder;)V
    .registers 5
    .parameter
    .parameter "lockMode"
    .parameter "tag"
    .parameter "binder"

    .prologue
    .line 1382
    iput-object p1, p0, Lcom/android/server/WimaxService$WimaxLock;->this$0:Lcom/android/server/WimaxService;

    .line 1383
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/server/WimaxService$DeathRecipient;-><init>(Lcom/android/server/WimaxService;ILjava/lang/String;Landroid/os/IBinder;)V

    .line 1384
    return-void
.end method


# virtual methods
.method public binderDied()V
    .registers 4

    .prologue
    .line 1387
    iget-object v0, p0, Lcom/android/server/WimaxService$WimaxLock;->this$0:Lcom/android/server/WimaxService;

    #getter for: Lcom/android/server/WimaxService;->mLocks:Lcom/android/server/WimaxService$LockList;
    invoke-static {v0}, Lcom/android/server/WimaxService;->access$1500(Lcom/android/server/WimaxService;)Lcom/android/server/WimaxService$LockList;

    move-result-object v0

    monitor-enter v0

    .line 1388
    :try_start_7
    iget-object v1, p0, Lcom/android/server/WimaxService$WimaxLock;->this$0:Lcom/android/server/WimaxService;

    iget-object v2, p0, Lcom/android/server/WimaxService$DeathRecipient;->mBinder:Landroid/os/IBinder;

    #calls: Lcom/android/server/WimaxService;->releaseWimaxLockLocked(Landroid/os/IBinder;)Z
    invoke-static {v1, v2}, Lcom/android/server/WimaxService;->access$1600(Lcom/android/server/WimaxService;Landroid/os/IBinder;)Z

    .line 1389
    monitor-exit v0

    .line 1390
    return-void

    .line 1389
    :catchall_10
    move-exception v1

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_10

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1393
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WimaxLock{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/WimaxService$DeathRecipient;->mTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/WimaxService$DeathRecipient;->mMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " binder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/WimaxService$DeathRecipient;->mBinder:Landroid/os/IBinder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
