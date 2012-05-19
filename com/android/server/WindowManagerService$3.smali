.class Lcom/android/server/WindowManagerService$3;
.super Landroid/content/BroadcastReceiver;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WindowManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/WindowManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 286
    iput-object p1, p0, Lcom/android/server/WindowManagerService$3;->this$0:Lcom/android/server/WindowManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .parameter "context"
    .parameter "intent"

    .prologue
    const-string v2, "WindowManagerService"

    .line 290
    const-string v1, "DATA"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 291
    .local v0, cmd:Ljava/lang/String;
    const-string v1, "SKIP_ROTATE_CHECK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_20

    .line 293
    const-string v1, "WindowManagerService"

    const-string v1, "bSkipRotateCheck_from_Slate=true"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    iget-object v1, p0, Lcom/android/server/WindowManagerService$3;->this$0:Lcom/android/server/WindowManagerService;

    const/4 v2, 0x1

    #setter for: Lcom/android/server/WindowManagerService;->bSkipRotateCheck_from_Slate:Z
    invoke-static {v1, v2}, Lcom/android/server/WindowManagerService;->access$302(Lcom/android/server/WindowManagerService;Z)Z

    .line 301
    :goto_1f
    return-void

    .line 298
    :cond_20
    const-string v1, "WindowManagerService"

    const-string v1, "bSkipRotateCheck_from_Slate=false"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    iget-object v1, p0, Lcom/android/server/WindowManagerService$3;->this$0:Lcom/android/server/WindowManagerService;

    const/4 v2, 0x0

    #setter for: Lcom/android/server/WindowManagerService;->bSkipRotateCheck_from_Slate:Z
    invoke-static {v1, v2}, Lcom/android/server/WindowManagerService;->access$302(Lcom/android/server/WindowManagerService;Z)Z

    goto :goto_1f
.end method
