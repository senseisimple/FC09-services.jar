.class Lcom/android/server/EncryptService$7;
.super Ljava/lang/Object;
.source "EncryptService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/EncryptService;->requestEncryptMount()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/EncryptService;


# direct methods
.method constructor <init>(Lcom/android/server/EncryptService;)V
    .registers 2
    .parameter

    .prologue
    .line 2124
    iput-object p1, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const/16 v8, 0xb5

    const-string v7, "EncryptService"

    .line 2128
    const/4 v3, 0x0

    .line 2129
    .local v3, nRet:I
    const/4 v1, 0x0

    .line 2135
    .local v1, isNextJobRet:Z
    :try_start_6
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    invoke-virtual {v4}, Lcom/android/server/EncryptService;->getMountServiceInstance()Landroid/os/storage/IMountService;

    move-result-object v2

    .line 2137
    .local v2, mountService:Landroid/os/storage/IMountService;
    if-eqz v2, :cond_5b

    .line 2139
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v4, v4, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    const-string v5, "working"

    invoke-virtual {v4, v5}, Lcom/android/server/EncryptService$InternalDB;->setState(Ljava/lang/String;)V

    .line 2141
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v4, v4, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    invoke-virtual {v4}, Lcom/android/server/EncryptService$InternalDB;->getWorkingPath()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v5, v5, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    invoke-virtual {v5}, Lcom/android/server/EncryptService$InternalDB;->getPwdHashCode()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v6, v6, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    invoke-virtual {v6}, Lcom/android/server/EncryptService$InternalDB;->getStorageCID()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v4, v5, v6}, Landroid/os/storage/IMountService;->encryptMountVolume(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 2144
    if-eqz v3, :cond_72

    .line 2147
    const-string v4, "EncryptService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " requestEncryptMount : When calling IMountService.encryptMountVolume,  error was occured("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2148
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    const/16 v5, 0xb4

    invoke-virtual {v4, v5}, Lcom/android/server/EncryptService;->setError(I)V
    :try_end_5a
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_5a} :catch_81
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_5a} :catch_a6

    .line 2149
    const/4 v3, -0x1

    .line 2169
    .end local v2           #mountService:Landroid/os/storage/IMountService;
    :cond_5b
    :goto_5b
    if-eqz v1, :cond_5f

    if-eqz v3, :cond_71

    .line 2171
    :cond_5f
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v4, v4, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/android/server/EncryptService$InternalDB;->setWorkingPath(Ljava/lang/String;)V

    .line 2172
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v4, v4, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    const-string v5, "none"

    invoke-virtual {v4, v5}, Lcom/android/server/EncryptService$InternalDB;->setState(Ljava/lang/String;)V

    .line 2177
    :cond_71
    return-void

    .line 2153
    .restart local v2       #mountService:Landroid/os/storage/IMountService;
    :cond_72
    :try_start_72
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v5, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    iget-object v5, v5, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    invoke-virtual {v5}, Lcom/android/server/EncryptService$InternalDB;->getWorkingPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/server/EncryptService;->doWorkNextJob(Ljava/lang/String;)Z
    :try_end_7f
    .catch Landroid/os/RemoteException; {:try_start_72 .. :try_end_7f} :catch_81
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_7f} :catch_a6

    move-result v1

    goto :goto_5b

    .line 2157
    .end local v2           #mountService:Landroid/os/storage/IMountService;
    :catch_81
    move-exception v4

    move-object v0, v4

    .line 2159
    .local v0, e:Landroid/os/RemoteException;
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    invoke-virtual {v4, v8}, Lcom/android/server/EncryptService;->setError(I)V

    .line 2160
    const-string v4, "EncryptService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " requestEncryptMount : RemoteException exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2161
    const/4 v3, -0x2

    .line 2167
    goto :goto_5b

    .line 2163
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_a6
    move-exception v4

    move-object v0, v4

    .line 2164
    .local v0, e:Ljava/lang/Exception;
    iget-object v4, p0, Lcom/android/server/EncryptService$7;->this$0:Lcom/android/server/EncryptService;

    invoke-virtual {v4, v8}, Lcom/android/server/EncryptService;->setError(I)V

    .line 2165
    const-string v4, "EncryptService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " requestEncryptMount : Exception exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2166
    const/4 v3, -0x3

    goto :goto_5b
.end method
