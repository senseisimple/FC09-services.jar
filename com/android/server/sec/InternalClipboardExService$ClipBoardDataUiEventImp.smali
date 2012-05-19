.class Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;
.super Ljava/lang/Object;
.source "InternalClipboardExService.java"

# interfaces
.implements Landroid/sec/clipboard/IClipboardDataUiEvent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/sec/InternalClipboardExService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClipBoardDataUiEventImp"
.end annotation


# instance fields
.field private final mBind:Landroid/sec/clipboard/IClipboardDataUiEvent$Stub;

.field final synthetic this$0:Lcom/android/server/sec/InternalClipboardExService;


# direct methods
.method private constructor <init>(Lcom/android/server/sec/InternalClipboardExService;)V
    .registers 3
    .parameter

    .prologue
    .line 55
    iput-object p1, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->this$0:Lcom/android/server/sec/InternalClipboardExService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp$1;

    invoke-direct {v0, p0}, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp$1;-><init>(Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;)V

    iput-object v0, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->mBind:Landroid/sec/clipboard/IClipboardDataUiEvent$Stub;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/sec/InternalClipboardExService;Lcom/android/server/sec/InternalClipboardExService$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;-><init>(Lcom/android/server/sec/InternalClipboardExService;)V

    return-void
.end method

.method private ListChange()V
    .registers 5

    .prologue
    const-string v3, "ClipboardServiceEx"

    .line 75
    iget-object v1, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->this$0:Lcom/android/server/sec/InternalClipboardExService;

    #getter for: Lcom/android/server/sec/InternalClipboardExService;->mClipboardWorkingFormUiInterface:Landroid/sec/clipboard/IClipboardWorkingFormUiInterface;
    invoke-static {v1}, Lcom/android/server/sec/InternalClipboardExService;->access$100(Lcom/android/server/sec/InternalClipboardExService;)Landroid/sec/clipboard/IClipboardWorkingFormUiInterface;

    move-result-object v1

    if-eqz v1, :cond_13

    .line 77
    :try_start_a
    iget-object v1, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->this$0:Lcom/android/server/sec/InternalClipboardExService;

    #getter for: Lcom/android/server/sec/InternalClipboardExService;->mClipboardWorkingFormUiInterface:Landroid/sec/clipboard/IClipboardWorkingFormUiInterface;
    invoke-static {v1}, Lcom/android/server/sec/InternalClipboardExService;->access$100(Lcom/android/server/sec/InternalClipboardExService;)Landroid/sec/clipboard/IClipboardWorkingFormUiInterface;

    move-result-object v1

    invoke-interface {v1}, Landroid/sec/clipboard/IClipboardWorkingFormUiInterface;->setClipboardDataListChange()V
    :try_end_13
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_13} :catch_14
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_13} :catch_33

    .line 87
    :cond_13
    :goto_13
    return-void

    .line 79
    :catch_14
    move-exception v1

    move-object v0, v1

    .line 80
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "ClipboardServiceEx"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ListChange(RemoteException) : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_13

    .line 82
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_33
    move-exception v1

    move-object v0, v1

    .line 83
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "ClipboardServiceEx"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ListChange(: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_13
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->mBind:Landroid/sec/clipboard/IClipboardDataUiEvent$Stub;

    return-object v0
.end method

.method public removeItem(I)V
    .registers 7
    .parameter "index"

    .prologue
    const-string v2, "ClipboardServiceEx"

    .line 100
    monitor-enter p0

    .line 101
    :try_start_3
    const-string v2, "ClipboardServiceEx"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Clipboard Service removeItem index : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    iget-object v2, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->this$0:Lcom/android/server/sec/InternalClipboardExService;

    #getter for: Lcom/android/server/sec/InternalClipboardExService;->mDataList:Landroid/sec/clipboard/data/ClipboardDataMgr;
    invoke-static {v2}, Lcom/android/server/sec/InternalClipboardExService;->access$200(Lcom/android/server/sec/InternalClipboardExService;)Landroid/sec/clipboard/data/ClipboardDataMgr;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/sec/clipboard/data/ClipboardDataMgr;->getItem(I)Landroid/sec/clipboard/data/ClipboardData;

    move-result-object v1

    .line 105
    .local v1, delDt:Landroid/sec/clipboard/data/ClipboardData;
    if-eqz v1, :cond_3b

    .line 106
    instance-of v2, v1, Landroid/sec/clipboard/data/list/ClipboardDataBitmapFile;

    if-eqz v2, :cond_3b

    .line 108
    const-string v2, "ClipboardServiceEx"

    const-string v3, "ImageFormat file delete."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    check-cast v1, Landroid/sec/clipboard/data/list/ClipboardDataBitmapFile;

    .end local v1           #delDt:Landroid/sec/clipboard/data/ClipboardData;
    invoke-virtual {v1}, Landroid/sec/clipboard/data/list/ClipboardDataBitmapFile;->DeleteFile()V

    .line 112
    :cond_3b
    iget-object v2, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->this$0:Lcom/android/server/sec/InternalClipboardExService;

    #getter for: Lcom/android/server/sec/InternalClipboardExService;->mDataList:Landroid/sec/clipboard/data/ClipboardDataMgr;
    invoke-static {v2}, Lcom/android/server/sec/InternalClipboardExService;->access$200(Lcom/android/server/sec/InternalClipboardExService;)Landroid/sec/clipboard/data/ClipboardDataMgr;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/sec/clipboard/data/ClipboardDataMgr;->removeData(I)Z

    move-result v0

    .line 114
    .local v0, bRes:Z
    if-eqz v0, :cond_4a

    .line 115
    invoke-direct {p0}, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->ListChange()V

    .line 116
    :cond_4a
    monitor-exit p0

    .line 117
    return-void

    .line 116
    .end local v0           #bRes:Z
    :catchall_4c
    move-exception v2

    monitor-exit p0
    :try_end_4e
    .catchall {:try_start_3 .. :try_end_4e} :catchall_4c

    throw v2
.end method

.method public selectItem(ILandroid/sec/clipboard/IClipboardDataPasteEvent;)V
    .registers 8
    .parameter "index"
    .parameter "clPasteEvent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const-string v2, "ClipboardServiceEx"

    .line 128
    monitor-enter p0

    .line 129
    if-nez p2, :cond_e

    .line 130
    :try_start_5
    const-string v2, "ClipboardServiceEx"

    const-string v3, "ClipboardDataPasteEvent is null."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    monitor-exit p0

    .line 160
    :goto_d
    return-void

    .line 135
    :cond_e
    const-string v2, "ClipboardServiceEx"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Clipboard Service selectItem index : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2a
    .catchall {:try_start_5 .. :try_end_2a} :catchall_42

    .line 139
    const/4 v1, 0x0

    .line 142
    .local v1, resData:Landroid/sec/clipboard/data/ClipboardData;
    :try_start_2b
    iget-object v2, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->this$0:Lcom/android/server/sec/InternalClipboardExService;

    #getter for: Lcom/android/server/sec/InternalClipboardExService;->mDataList:Landroid/sec/clipboard/data/ClipboardDataMgr;
    invoke-static {v2}, Lcom/android/server/sec/InternalClipboardExService;->access$200(Lcom/android/server/sec/InternalClipboardExService;)Landroid/sec/clipboard/data/ClipboardDataMgr;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/sec/clipboard/data/ClipboardDataMgr;->getItem(I)Landroid/sec/clipboard/data/ClipboardData;

    move-result-object v1

    .line 146
    instance-of v2, v1, Landroid/sec/clipboard/data/list/ClipboardDataBitmapFile;

    if-eqz v2, :cond_3d

    .line 147
    invoke-static {v1}, Landroid/sec/clipboard/data/list/ClipboardDataBitmapFile;->convertClipboardDataBitmap(Landroid/sec/clipboard/data/ClipboardData;)Landroid/sec/clipboard/data/ClipboardData;

    move-result-object v1

    .line 149
    :cond_3d
    invoke-interface {p2, v1}, Landroid/sec/clipboard/IClipboardDataPasteEvent;->onClipboardDataPaste(Landroid/sec/clipboard/data/ClipboardData;)V
    :try_end_40
    .catchall {:try_start_2b .. :try_end_40} :catchall_42
    .catch Landroid/os/RemoteException; {:try_start_2b .. :try_end_40} :catch_45
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_40} :catch_64

    .line 159
    :goto_40
    :try_start_40
    monitor-exit p0

    goto :goto_d

    .end local v1           #resData:Landroid/sec/clipboard/data/ClipboardData;
    :catchall_42
    move-exception v2

    monitor-exit p0
    :try_end_44
    .catchall {:try_start_40 .. :try_end_44} :catchall_42

    throw v2

    .line 150
    .restart local v1       #resData:Landroid/sec/clipboard/data/ClipboardData;
    :catch_45
    move-exception v2

    move-object v0, v2

    .line 151
    .local v0, e:Landroid/os/RemoteException;
    :try_start_47
    const-string v2, "ClipboardServiceEx"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Clipboard Service selectItem error : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_40

    .line 154
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_64
    move-exception v2

    move-object v0, v2

    .line 155
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "ClipboardServiceEx"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Clipboard Service selectItem-getItem error : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_82
    .catchall {:try_start_47 .. :try_end_82} :catchall_42

    goto :goto_40
.end method
