.class Lcom/android/server/DropBoxManagerService$1$1;
.super Ljava/lang/Thread;
.source "DropBoxManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/DropBoxManagerService$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/DropBoxManagerService$1;


# direct methods
.method constructor <init>(Lcom/android/server/DropBoxManagerService$1;)V
    .registers 2
    .parameter

    .prologue
    .line 109
    iput-object p1, p0, Lcom/android/server/DropBoxManagerService$1$1;->this$1:Lcom/android/server/DropBoxManagerService$1;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 112
    :try_start_0
    iget-object v1, p0, Lcom/android/server/DropBoxManagerService$1$1;->this$1:Lcom/android/server/DropBoxManagerService$1;

    iget-object v1, v1, Lcom/android/server/DropBoxManagerService$1;->this$0:Lcom/android/server/DropBoxManagerService;

    #calls: Lcom/android/server/DropBoxManagerService;->init()V
    invoke-static {v1}, Lcom/android/server/DropBoxManagerService;->access$100(Lcom/android/server/DropBoxManagerService;)V

    .line 113
    iget-object v1, p0, Lcom/android/server/DropBoxManagerService$1$1;->this$1:Lcom/android/server/DropBoxManagerService$1;

    iget-object v1, v1, Lcom/android/server/DropBoxManagerService$1;->this$0:Lcom/android/server/DropBoxManagerService;

    #calls: Lcom/android/server/DropBoxManagerService;->trimToFit()J
    invoke-static {v1}, Lcom/android/server/DropBoxManagerService;->access$200(Lcom/android/server/DropBoxManagerService;)J
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_f

    .line 117
    :goto_e
    return-void

    .line 114
    :catch_f
    move-exception v1

    move-object v0, v1

    .line 115
    .local v0, e:Ljava/io/IOException;
    const-string v1, "DropBoxManagerService"

    const-string v2, "Can\'t init"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_e
.end method
