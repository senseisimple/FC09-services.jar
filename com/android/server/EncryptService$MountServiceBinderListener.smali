.class Lcom/android/server/EncryptService$MountServiceBinderListener;
.super Landroid/os/storage/IMountServiceListener$Stub;
.source "EncryptService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/EncryptService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MountServiceBinderListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/EncryptService;


# direct methods
.method private constructor <init>(Lcom/android/server/EncryptService;)V
    .registers 2
    .parameter

    .prologue
    .line 551
    iput-object p1, p0, Lcom/android/server/EncryptService$MountServiceBinderListener;->this$0:Lcom/android/server/EncryptService;

    invoke-direct {p0}, Landroid/os/storage/IMountServiceListener$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/EncryptService;Lcom/android/server/EncryptService$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 551
    invoke-direct {p0, p1}, Lcom/android/server/EncryptService$MountServiceBinderListener;-><init>(Lcom/android/server/EncryptService;)V

    return-void
.end method


# virtual methods
.method public onStorageStateChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .parameter "path"
    .parameter "oldState"
    .parameter "newState"

    .prologue
    .line 561
    iget-object v0, p0, Lcom/android/server/EncryptService$MountServiceBinderListener;->this$0:Lcom/android/server/EncryptService;

    iget-object v0, v0, Lcom/android/server/EncryptService;->mCheckStorageState:Lcom/android/server/EncryptService$CheckStorageState;

    if-eqz v0, :cond_d

    .line 562
    iget-object v0, p0, Lcom/android/server/EncryptService$MountServiceBinderListener;->this$0:Lcom/android/server/EncryptService;

    iget-object v0, v0, Lcom/android/server/EncryptService;->mCheckStorageState:Lcom/android/server/EncryptService$CheckStorageState;

    invoke-virtual {v0, p1, p3}, Lcom/android/server/EncryptService$CheckStorageState;->updateStorageSharedState(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    :cond_d
    return-void
.end method

.method public onUsbMassStorageConnectionChanged(Z)V
    .registers 2
    .parameter "available"

    .prologue
    .line 554
    return-void
.end method
