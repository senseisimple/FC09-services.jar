.class Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp$1;
.super Landroid/sec/clipboard/IClipboardDataUiEvent$Stub;
.source "InternalClipboardExService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;


# direct methods
.method constructor <init>(Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;)V
    .registers 2
    .parameter

    .prologue
    .line 56
    iput-object p1, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp$1;->this$1:Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;

    invoke-direct {p0}, Landroid/sec/clipboard/IClipboardDataUiEvent$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public removeItem(I)V
    .registers 3
    .parameter "arg0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp$1;->this$1:Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;

    invoke-virtual {v0, p1}, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->removeItem(I)V

    .line 60
    return-void
.end method

.method public selectItem(ILandroid/sec/clipboard/IClipboardDataPasteEvent;)V
    .registers 4
    .parameter "index"
    .parameter "clPasteEvent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp$1;->this$1:Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/sec/InternalClipboardExService$ClipBoardDataUiEventImp;->selectItem(ILandroid/sec/clipboard/IClipboardDataPasteEvent;)V

    .line 71
    return-void
.end method
