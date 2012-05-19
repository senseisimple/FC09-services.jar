.class Lcom/android/server/WindowManagerService$5;
.super Ljava/lang/Object;
.source "WindowManagerService.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/WindowManagerService;->watchRotation(Landroid/view/IRotationWatcher;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WindowManagerService;

.field final synthetic val$watcherBinder:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Lcom/android/server/WindowManagerService;Landroid/os/IBinder;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 4904
    iput-object p1, p0, Lcom/android/server/WindowManagerService$5;->this$0:Lcom/android/server/WindowManagerService;

    iput-object p2, p0, Lcom/android/server/WindowManagerService$5;->val$watcherBinder:Landroid/os/IBinder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public binderDied()V
    .registers 6

    .prologue
    .line 4906
    iget-object v2, p0, Lcom/android/server/WindowManagerService$5;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 4907
    const/4 v0, 0x0

    .local v0, i:I
    :goto_6
    :try_start_6
    iget-object v2, p0, Lcom/android/server/WindowManagerService$5;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/WindowManagerService;->mRotationWatchers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3b

    .line 4908
    iget-object v4, p0, Lcom/android/server/WindowManagerService$5;->val$watcherBinder:Landroid/os/IBinder;

    iget-object v2, p0, Lcom/android/server/WindowManagerService$5;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/WindowManagerService;->mRotationWatchers:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/IRotationWatcher;

    invoke-interface {v2}, Landroid/view/IRotationWatcher;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    if-ne v4, v2, :cond_38

    .line 4909
    iget-object v2, p0, Lcom/android/server/WindowManagerService$5;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/WindowManagerService;->mRotationWatchers:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/IRotationWatcher;

    .line 4910
    .local v1, removed:Landroid/view/IRotationWatcher;
    if-eqz v1, :cond_36

    .line 4911
    invoke-interface {v1}, Landroid/view/IRotationWatcher;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    const/4 v4, 0x0

    invoke-interface {v2, p0, v4}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 4913
    :cond_36
    add-int/lit8 v0, v0, -0x1

    .line 4907
    .end local v1           #removed:Landroid/view/IRotationWatcher;
    :cond_38
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 4916
    :cond_3b
    monitor-exit v3

    .line 4917
    return-void

    .line 4916
    :catchall_3d
    move-exception v2

    monitor-exit v3
    :try_end_3f
    .catchall {:try_start_6 .. :try_end_3f} :catchall_3d

    throw v2
.end method
