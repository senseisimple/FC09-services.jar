.class Lcom/android/server/EncryptService$2;
.super Ljava/lang/Object;
.source "EncryptService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/EncryptService;->setPassword(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/EncryptService;

.field final synthetic val$password:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/server/EncryptService;Ljava/lang/String;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 210
    iput-object p1, p0, Lcom/android/server/EncryptService$2;->this$0:Lcom/android/server/EncryptService;

    iput-object p2, p0, Lcom/android/server/EncryptService$2;->val$password:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 215
    iget-object v0, p0, Lcom/android/server/EncryptService$2;->val$password:Ljava/lang/String;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/android/server/EncryptService$2;->val$password:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_16

    .line 216
    iget-object v0, p0, Lcom/android/server/EncryptService$2;->this$0:Lcom/android/server/EncryptService;

    iget-object v0, v0, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    iget-object v1, p0, Lcom/android/server/EncryptService$2;->val$password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/server/EncryptService$InternalDB;->setPwdHashCode(Ljava/lang/String;)V

    .line 219
    :goto_15
    return-void

    .line 218
    :cond_16
    iget-object v0, p0, Lcom/android/server/EncryptService$2;->this$0:Lcom/android/server/EncryptService;

    iget-object v0, v0, Lcom/android/server/EncryptService;->inter_db:Lcom/android/server/EncryptService$InternalDB;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/android/server/EncryptService$InternalDB;->setPwdHashCode(Ljava/lang/String;)V

    goto :goto_15
.end method
