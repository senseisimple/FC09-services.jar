.class Lcom/android/server/UsbStorageService$2;
.super Landroid/content/BroadcastReceiver;
.source "UsbStorageService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/UsbStorageService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/UsbStorageService;


# direct methods
.method constructor <init>(Lcom/android/server/UsbStorageService;)V
    .registers 2
    .parameter

    .prologue
    .line 117
    iput-object p1, p0, Lcom/android/server/UsbStorageService$2;->this$0:Lcom/android/server/UsbStorageService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 119
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 122
    new-instance v1, Lcom/android/server/UsbStorageService$2$1;

    invoke-direct {v1, p0}, Lcom/android/server/UsbStorageService$2$1;-><init>(Lcom/android/server/UsbStorageService$2;)V

    invoke-virtual {v1}, Lcom/android/server/UsbStorageService$2$1;->start()V

    .line 172
    :cond_14
    return-void
.end method
