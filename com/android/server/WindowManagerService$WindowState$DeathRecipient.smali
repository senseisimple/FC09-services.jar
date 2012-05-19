.class Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;
.super Ljava/lang/Object;
.source "WindowManagerService.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WindowManagerService$WindowState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeathRecipient"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/WindowManagerService$WindowState;


# direct methods
.method private constructor <init>(Lcom/android/server/WindowManagerService$WindowState;)V
    .registers 2
    .parameter

    .prologue
    .line 7559
    iput-object p1, p0, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;->this$1:Lcom/android/server/WindowManagerService$WindowState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/WindowManagerService$WindowState;Lcom/android/server/WindowManagerService$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 7559
    invoke-direct {p0, p1}, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;-><init>(Lcom/android/server/WindowManagerService$WindowState;)V

    return-void
.end method


# virtual methods
.method public binderDied()V
    .registers 7

    .prologue
    .line 7562
    :try_start_0
    iget-object v1, p0, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;->this$1:Lcom/android/server/WindowManagerService$WindowState;

    iget-object v1, v1, Lcom/android/server/WindowManagerService$WindowState;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v1
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_7} :catch_2a

    .line 7563
    :try_start_7
    iget-object v2, p0, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;->this$1:Lcom/android/server/WindowManagerService$WindowState;

    iget-object v2, v2, Lcom/android/server/WindowManagerService$WindowState;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, p0, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;->this$1:Lcom/android/server/WindowManagerService$WindowState;

    iget-object v3, v3, Lcom/android/server/WindowManagerService$WindowState;->mSession:Lcom/android/server/WindowManagerService$Session;

    iget-object v4, p0, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;->this$1:Lcom/android/server/WindowManagerService$WindowState;

    iget-object v4, v4, Lcom/android/server/WindowManagerService$WindowState;->mClient:Landroid/view/IWindow;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/server/WindowManagerService;->windowForClientLocked(Lcom/android/server/WindowManagerService$Session;Landroid/view/IWindow;Z)Lcom/android/server/WindowManagerService$WindowState;

    move-result-object v0

    .line 7565
    .local v0, win:Lcom/android/server/WindowManagerService$WindowState;
    if-eqz v0, :cond_25

    .line 7566
    iget-object v2, p0, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;->this$1:Lcom/android/server/WindowManagerService$WindowState;

    iget-object v2, v2, Lcom/android/server/WindowManagerService$WindowState;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, p0, Lcom/android/server/WindowManagerService$WindowState$DeathRecipient;->this$1:Lcom/android/server/WindowManagerService$WindowState;

    iget-object v3, v3, Lcom/android/server/WindowManagerService$WindowState;->mSession:Lcom/android/server/WindowManagerService$Session;

    invoke-virtual {v2, v3, v0}, Lcom/android/server/WindowManagerService;->removeWindowLocked(Lcom/android/server/WindowManagerService$Session;Lcom/android/server/WindowManagerService$WindowState;)V

    .line 7568
    :cond_25
    monitor-exit v1

    .line 7573
    .end local v0           #win:Lcom/android/server/WindowManagerService$WindowState;
    :goto_26
    return-void

    .line 7568
    :catchall_27
    move-exception v2

    monitor-exit v1
    :try_end_29
    .catchall {:try_start_7 .. :try_end_29} :catchall_27

    :try_start_29
    throw v2
    :try_end_2a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_29 .. :try_end_2a} :catch_2a

    .line 7569
    :catch_2a
    move-exception v1

    goto :goto_26
.end method
