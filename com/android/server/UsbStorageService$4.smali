.class Lcom/android/server/UsbStorageService$4;
.super Ljava/lang/Thread;
.source "UsbStorageService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/UsbStorageService;->onEventInner(ILjava/lang/String;[Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/UsbStorageService;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 219
    iput-object p1, p0, Lcom/android/server/UsbStorageService$4;->this$0:Lcom/android/server/UsbStorageService;

    iput-object p2, p0, Lcom/android/server/UsbStorageService$4;->val$path:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 223
    :try_start_0
    iget-object v1, p0, Lcom/android/server/UsbStorageService$4;->this$0:Lcom/android/server/UsbStorageService;

    iget-object v2, p0, Lcom/android/server/UsbStorageService$4;->val$path:Ljava/lang/String;

    #calls: Lcom/android/server/UsbStorageService;->updatePartitionsList(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/android/server/UsbStorageService;->access$300(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V

    .line 224
    iget-object v1, p0, Lcom/android/server/UsbStorageService$4;->this$0:Lcom/android/server/UsbStorageService;

    iget-object v2, p0, Lcom/android/server/UsbStorageService$4;->val$path:Ljava/lang/String;

    const-string v3, "disk"

    #calls: Lcom/android/server/UsbStorageService;->doMountVolume(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {v1, v2, v3}, Lcom/android/server/UsbStorageService;->access$400(Lcom/android/server/UsbStorageService;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_11

    .line 228
    :goto_10
    return-void

    .line 225
    :catch_11
    move-exception v1

    move-object v0, v1

    .line 226
    .local v0, ex:Ljava/lang/Exception;
    const-string v1, "UsbStorageService"

    const-string v2, "Failed to mount media on insertion"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_10
.end method
