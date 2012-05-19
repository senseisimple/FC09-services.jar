.class final Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;
.super Ljava/lang/Object;
.source "UsbStorageService.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/UsbStorageService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UsbStorageServiceBinderListener"
.end annotation


# instance fields
.field final mListener:Landroid/os/storage/IUsbStorageServiceListener;

.field final synthetic this$0:Lcom/android/server/UsbStorageService;


# direct methods
.method constructor <init>(Lcom/android/server/UsbStorageService;Landroid/os/storage/IUsbStorageServiceListener;)V
    .registers 3
    .parameter
    .parameter "listener"

    .prologue
    .line 604
    iput-object p1, p0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;->this$0:Lcom/android/server/UsbStorageService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 605
    iput-object p2, p0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;->mListener:Landroid/os/storage/IUsbStorageServiceListener;

    .line 607
    return-void
.end method


# virtual methods
.method public binderDied()V
    .registers 4

    .prologue
    .line 610
    const-string v0, "UsbStorageService"

    const-string v1, "An IUsbStorageServiceListener has died!"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 611
    iget-object v0, p0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;->this$0:Lcom/android/server/UsbStorageService;

    #getter for: Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/android/server/UsbStorageService;->access$600(Lcom/android/server/UsbStorageService;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    .line 612
    :try_start_e
    iget-object v1, p0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;->this$0:Lcom/android/server/UsbStorageService;

    #getter for: Lcom/android/server/UsbStorageService;->mListeners:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/android/server/UsbStorageService;->access$600(Lcom/android/server/UsbStorageService;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 613
    iget-object v1, p0, Lcom/android/server/UsbStorageService$UsbStorageServiceBinderListener;->mListener:Landroid/os/storage/IUsbStorageServiceListener;

    invoke-interface {v1}, Landroid/os/storage/IUsbStorageServiceListener;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p0, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 614
    monitor-exit v0

    .line 615
    return-void

    .line 614
    :catchall_23
    move-exception v1

    monitor-exit v0
    :try_end_25
    .catchall {:try_start_e .. :try_end_25} :catchall_23

    throw v1
.end method
