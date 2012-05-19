.class public Lcom/android/server/ClipboardService;
.super Landroid/text/IClipboard$Stub;
.source "ClipboardService.java"


# static fields
.field private static sServiceEx:Landroid/sec/clipboard/IClipboardService;


# instance fields
.field private mClipboard:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "context"

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/text/IClipboard$Stub;-><init>()V

    .line 32
    const-string v0, ""

    iput-object v0, p0, Lcom/android/server/ClipboardService;->mClipboard:Ljava/lang/CharSequence;

    .line 50
    return-void
.end method

.method private static getServiceEx()Landroid/sec/clipboard/IClipboardService;
    .registers 2

    .prologue
    .line 37
    sget-object v1, Lcom/android/server/ClipboardService;->sServiceEx:Landroid/sec/clipboard/IClipboardService;

    if-eqz v1, :cond_7

    .line 38
    sget-object v1, Lcom/android/server/ClipboardService;->sServiceEx:Landroid/sec/clipboard/IClipboardService;

    .line 44
    :goto_6
    return-object v1

    .line 41
    :cond_7
    const-string v1, "clipboardEx"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 42
    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/sec/clipboard/IClipboardService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/sec/clipboard/IClipboardService;

    move-result-object v1

    sput-object v1, Lcom/android/server/ClipboardService;->sServiceEx:Landroid/sec/clipboard/IClipboardService;

    .line 44
    sget-object v1, Lcom/android/server/ClipboardService;->sServiceEx:Landroid/sec/clipboard/IClipboardService;

    goto :goto_6
.end method


# virtual methods
.method public getClipboardText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 87
    monitor-enter p0

    .line 88
    :try_start_1
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mClipboard:Ljava/lang/CharSequence;

    monitor-exit p0

    return-object v0

    .line 89
    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public hasClipboardText()Z
    .registers 2

    .prologue
    .line 94
    monitor-enter p0

    .line 95
    :try_start_1
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mClipboard:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    :goto_a
    monitor-exit p0

    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_a

    .line 96
    :catchall_e
    move-exception v0

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public setClipboardText(Ljava/lang/CharSequence;)V
    .registers 6
    .parameter "text"

    .prologue
    .line 54
    monitor-enter p0

    .line 55
    if-nez p1, :cond_5

    .line 56
    :try_start_3
    const-string p1, ""
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_2f

    .line 60
    :cond_5
    :try_start_5
    invoke-static {}, Lcom/android/server/ClipboardService;->getServiceEx()Landroid/sec/clipboard/IClipboardService;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/sec/clipboard/IClipboardService;->SetSyncClipboardData(Ljava/lang/CharSequence;)Z
    :try_end_c
    .catchall {:try_start_5 .. :try_end_c} :catchall_2f
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_c} :catch_10

    .line 67
    :goto_c
    :try_start_c
    iput-object p1, p0, Lcom/android/server/ClipboardService;->mClipboard:Ljava/lang/CharSequence;

    .line 68
    monitor-exit p0

    .line 69
    return-void

    .line 61
    :catch_10
    move-exception v1

    move-object v0, v1

    .line 62
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "ClipboardService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getServiceEx().SetSyncClipboardData(text) : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 68
    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_2f
    move-exception v1

    monitor-exit p0
    :try_end_31
    .catchall {:try_start_c .. :try_end_31} :catchall_2f

    throw v1
.end method

.method public setSyncClipboardText(Ljava/lang/CharSequence;)V
    .registers 3
    .parameter "text"

    .prologue
    .line 76
    monitor-enter p0

    .line 77
    if-nez p1, :cond_5

    .line 78
    :try_start_3
    const-string p1, ""

    .line 81
    :cond_5
    iput-object p1, p0, Lcom/android/server/ClipboardService;->mClipboard:Ljava/lang/CharSequence;

    .line 82
    monitor-exit p0

    .line 83
    return-void

    .line 82
    :catchall_9
    move-exception v0

    monitor-exit p0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method
