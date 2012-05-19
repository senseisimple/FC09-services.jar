.class Lcom/android/server/UsbStorageService$UsbStorageMap;
.super Ljava/lang/Object;
.source "UsbStorageService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/UsbStorageService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UsbStorageMap"
.end annotation


# instance fields
.field public final label:Ljava/lang/String;

.field public final path:Ljava/lang/String;

.field public state:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/UsbStorageService;


# direct methods
.method constructor <init>(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V
    .registers 4
    .parameter
    .parameter "label"

    .prologue
    .line 71
    iput-object p1, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->this$0:Lcom/android/server/UsbStorageService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p2, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    .line 74
    const-string v0, "unmounted"

    iput-object v0, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->state:Ljava/lang/String;

    .line 75
    return-void
.end method

.method constructor <init>(Lcom/android/server/UsbStorageService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .parameter
    .parameter "label"
    .parameter "path"
    .parameter "state"

    .prologue
    .line 65
    iput-object p1, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->this$0:Lcom/android/server/UsbStorageService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p2, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    .line 67
    iput-object p3, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->path:Ljava/lang/String;

    .line 68
    iput-object p4, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->state:Ljava/lang/String;

    .line 69
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .parameter "obj"

    .prologue
    .line 82
    instance-of v2, p1, Lcom/android/server/UsbStorageService$UsbStorageMap;

    if-eqz v2, :cond_3d

    .line 83
    move-object v0, p1

    check-cast v0, Lcom/android/server/UsbStorageService$UsbStorageMap;

    move-object v1, v0

    .line 84
    .local v1, tmp:Lcom/android/server/UsbStorageService$UsbStorageMap;
    const-string v2, "UsbStorageService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UsbStorageMap :: in \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' label = \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    iget-object v2, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    iget-object v3, v1, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 87
    .end local v1           #tmp:Lcom/android/server/UsbStorageService$UsbStorageMap;
    :goto_3c
    return v2

    :cond_3d
    const/4 v2, 0x0

    goto :goto_3c
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/server/UsbStorageService$UsbStorageMap;->label:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
