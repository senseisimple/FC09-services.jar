.class Lcom/android/server/WindowManagerService$AppWindowToken;
.super Lcom/android/server/WindowManagerService$WindowToken;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AppWindowToken"
.end annotation


# instance fields
.field final allAppWindows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/WindowManagerService$WindowState;",
            ">;"
        }
    .end annotation
.end field

.field allDrawn:Z

.field animLayerAdjustment:I

.field animating:Z

.field animation:Landroid/view/animation/Animation;

.field appFullscreen:Z

.field final appToken:Landroid/view/IApplicationToken;

.field clientHidden:Z

.field firstWindowDrawn:Z

.field freezingScreen:Z

.field groupId:I

.field hasTransformation:Z

.field hiddenRequested:Z

.field inPendingTransaction:Z

.field inputDispatchingTimeoutNanos:J

.field lastTransactionSequence:I

.field numDrawnWindows:I

.field numInterestingWindows:I

.field removed:Z

.field reportedVisible:Z

.field requestedOrientation:I

.field startingData:Lcom/android/server/WindowManagerService$StartingData;

.field startingDisplayed:Z

.field startingMoved:Z

.field startingView:Landroid/view/View;

.field startingWindow:Lcom/android/server/WindowManagerService$WindowState;

.field final synthetic this$0:Lcom/android/server/WindowManagerService;

.field final transformation:Landroid/view/animation/Transformation;

.field willBeHidden:Z


# direct methods
.method constructor <init>(Lcom/android/server/WindowManagerService;Landroid/view/IApplicationToken;)V
    .registers 7
    .parameter
    .parameter "_token"

    .prologue
    const/4 v3, 0x1

    const/4 v2, -0x1

    .line 7963
    iput-object p1, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    .line 7964
    invoke-interface {p2}, Landroid/view/IApplicationToken;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v3}, Lcom/android/server/WindowManagerService$WindowToken;-><init>(Lcom/android/server/WindowManagerService;Landroid/os/IBinder;IZ)V

    .line 7906
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    .line 7908
    iput v2, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->groupId:I

    .line 7910
    iput v2, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->requestedOrientation:I

    .line 7918
    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget v0, v0, Lcom/android/server/WindowManagerService;->mTransactionSequence:I

    sub-int/2addr v0, v3

    iput v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->lastTransactionSequence:I

    .line 7949
    new-instance v0, Landroid/view/animation/Transformation;

    invoke-direct {v0}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->transformation:Landroid/view/animation/Transformation;

    .line 7966
    iput-object p0, p0, Lcom/android/server/WindowManagerService$WindowToken;->appWindowToken:Lcom/android/server/WindowManagerService$AppWindowToken;

    .line 7967
    iput-object p2, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    .line 7968
    return-void
.end method


# virtual methods
.method public clearAnimation()V
    .registers 2

    .prologue
    .line 8000
    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_a

    .line 8001
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    .line 8002
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    .line 8004
    :cond_a
    return-void
.end method

.method dump(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .registers 4
    .parameter "pw"
    .parameter "prefix"

    .prologue
    .line 8204
    invoke-super {p0, p1, p2}, Lcom/android/server/WindowManagerService$WindowToken;->dump(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 8205
    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    if-eqz v0, :cond_f

    .line 8206
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "app=true"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 8208
    :cond_f
    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_24

    .line 8209
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "allAppWindows="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 8211
    :cond_24
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "groupId="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->groupId:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 8212
    const-string v0, " appFullscreen="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->appFullscreen:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8213
    const-string v0, " requestedOrientation="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->requestedOrientation:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 8214
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "hiddenRequested="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->hiddenRequested:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8215
    const-string v0, " clientHidden="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->clientHidden:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8216
    const-string v0, " willBeHidden="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->willBeHidden:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8217
    const-string v0, " reportedVisible="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->reportedVisible:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 8218
    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    if-nez v0, :cond_78

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->freezingScreen:Z

    if-eqz v0, :cond_8f

    .line 8219
    :cond_78
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "paused="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8220
    const-string v0, " freezingScreen="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->freezingScreen:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 8222
    :cond_8f
    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->numInterestingWindows:I

    if-nez v0, :cond_9f

    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->numDrawnWindows:I

    if-nez v0, :cond_9f

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->inPendingTransaction:Z

    if-nez v0, :cond_9f

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allDrawn:Z

    if-eqz v0, :cond_ca

    .line 8224
    :cond_9f
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "numInterestingWindows="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 8225
    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->numInterestingWindows:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 8226
    const-string v0, " numDrawnWindows="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->numDrawnWindows:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 8227
    const-string v0, " inPendingTransaction="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->inPendingTransaction:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8228
    const-string v0, " allDrawn="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allDrawn:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 8230
    :cond_ca
    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    if-nez v0, :cond_d2

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_e9

    .line 8231
    :cond_d2
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "animating="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8232
    const-string v0, " animation="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 8234
    :cond_e9
    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animLayerAdjustment:I

    if-eqz v0, :cond_fa

    .line 8235
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "animLayerAdjustment="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animLayerAdjustment:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 8237
    :cond_fa
    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->hasTransformation:Z

    if-eqz v0, :cond_118

    .line 8238
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "hasTransformation="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->hasTransformation:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8239
    const-string v0, " transformation="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->transformation:Landroid/view/animation/Transformation;

    invoke-virtual {v0, p1}, Landroid/view/animation/Transformation;->printShortString(Ljava/io/PrintWriter;)V

    .line 8240
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 8242
    :cond_118
    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingData:Lcom/android/server/WindowManagerService$StartingData;

    if-nez v0, :cond_124

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->removed:Z

    if-nez v0, :cond_124

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->firstWindowDrawn:Z

    if-eqz v0, :cond_145

    .line 8243
    :cond_124
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "startingData="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingData:Lcom/android/server/WindowManagerService$StartingData;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 8244
    const-string v0, " removed="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->removed:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8245
    const-string v0, " firstWindowDrawn="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->firstWindowDrawn:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 8247
    :cond_145
    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    if-nez v0, :cond_155

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingView:Landroid/view/View;

    if-nez v0, :cond_155

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingDisplayed:Z

    if-nez v0, :cond_155

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingMoved:Z

    if-eqz v0, :cond_180

    .line 8249
    :cond_155
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "startingWindow="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 8250
    const-string v0, " startingView="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingView:Landroid/view/View;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 8251
    const-string v0, " startingDisplayed="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingDisplayed:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 8252
    const-string v0, " startingMoved"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingMoved:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 8254
    :cond_180
    return-void
.end method

.method findMainWindow()Lcom/android/server/WindowManagerService$WindowState;
    .registers 5

    .prologue
    .line 8191
    iget-object v2, p0, Lcom/android/server/WindowManagerService$WindowToken;->windows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 8192
    .local v0, j:I
    :cond_6
    if-lez v0, :cond_22

    .line 8193
    add-int/lit8 v0, v0, -0x1

    .line 8194
    iget-object v2, p0, Lcom/android/server/WindowManagerService$WindowToken;->windows:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WindowManagerService$WindowState;

    .line 8195
    .local v1, win:Lcom/android/server/WindowManagerService$WindowState;
    iget-object v2, v1, Lcom/android/server/WindowManagerService$WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_20

    iget-object v2, v1, Lcom/android/server/WindowManagerService$WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_6

    :cond_20
    move-object v2, v1

    .line 8200
    .end local v1           #win:Lcom/android/server/WindowManagerService$WindowState;
    :goto_21
    return-object v2

    :cond_22
    const/4 v2, 0x0

    goto :goto_21
.end method

.method sendAppVisibilityToClients()V
    .registers 6

    .prologue
    .line 8024
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 8025
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_7
    if-ge v1, v0, :cond_2b

    .line 8026
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/WindowManagerService$WindowState;

    .line 8027
    .local v2, win:Lcom/android/server/WindowManagerService$WindowState;
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    if-ne v2, v3, :cond_1c

    iget-boolean v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->clientHidden:Z

    if-eqz v3, :cond_1c

    .line 8025
    :goto_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 8034
    :cond_1c
    :try_start_1c
    iget-object v3, v2, Lcom/android/server/WindowManagerService$WindowState;->mClient:Landroid/view/IWindow;

    iget-boolean v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->clientHidden:Z

    if-nez v4, :cond_29

    const/4 v4, 0x1

    :goto_23
    invoke-interface {v3, v4}, Landroid/view/IWindow;->dispatchAppVisibility(Z)V
    :try_end_26
    .catch Landroid/os/RemoteException; {:try_start_1c .. :try_end_26} :catch_27

    goto :goto_19

    .line 8035
    :catch_27
    move-exception v3

    goto :goto_19

    .line 8034
    :cond_29
    const/4 v4, 0x0

    goto :goto_23

    .line 8038
    .end local v2           #win:Lcom/android/server/WindowManagerService$WindowState;
    :cond_2b
    return-void
.end method

.method public setAnimation(Landroid/view/animation/Animation;)V
    .registers 6
    .parameter "anim"

    .prologue
    .line 7973
    iput-object p1, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    .line 7974
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    .line 7975
    const-wide/16 v2, 0x2710

    invoke-virtual {p1, v2, v3}, Landroid/view/animation/Animation;->restrictDuration(J)V

    .line 7976
    iget-object v2, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget v2, v2, Lcom/android/server/WindowManagerService;->mTransitionAnimationScale:F

    invoke-virtual {p1, v2}, Landroid/view/animation/Animation;->scaleCurrentDuration(F)V

    .line 7977
    invoke-virtual {p1}, Landroid/view/animation/Animation;->getZAdjustment()I

    move-result v1

    .line 7978
    .local v1, zorder:I
    const/4 v0, 0x0

    .line 7979
    .local v0, adj:I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_25

    .line 7980
    const/16 v0, 0x3e8

    .line 7985
    :cond_1b
    :goto_1b
    iget v2, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animLayerAdjustment:I

    if-eq v2, v0, :cond_24

    .line 7986
    iput v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animLayerAdjustment:I

    .line 7987
    invoke-virtual {p0}, Lcom/android/server/WindowManagerService$AppWindowToken;->updateLayers()V

    .line 7989
    :cond_24
    return-void

    .line 7981
    :cond_25
    const/4 v2, -0x1

    if-ne v1, v2, :cond_1b

    .line 7982
    const/16 v0, -0x3e8

    goto :goto_1b
.end method

.method public setDummyAnimation()V
    .registers 2

    .prologue
    .line 7992
    iget-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-nez v0, :cond_8

    .line 7995
    sget-object v0, Lcom/android/server/WindowManagerService;->sDummyAnimation:Landroid/view/animation/Animation;

    iput-object v0, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    .line 7997
    :cond_8
    return-void
.end method

.method showAllWindowsLocked()V
    .registers 5

    .prologue
    .line 8041
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 8042
    .local v0, NW:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_7
    if-ge v1, v0, :cond_17

    .line 8043
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/WindowManagerService$WindowState;

    .line 8046
    .local v2, w:Lcom/android/server/WindowManagerService$WindowState;
    invoke-virtual {v2}, Lcom/android/server/WindowManagerService$WindowState;->performShowLocked()Z

    .line 8042
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 8048
    .end local v2           #w:Lcom/android/server/WindowManagerService$WindowState;
    :cond_17
    return-void
.end method

.method stepAnimationLocked(JII)Z
    .registers 13
    .parameter "currentTime"
    .parameter "dw"
    .parameter "dh"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 8052
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-boolean v3, v3, Lcom/android/server/WindowManagerService;->mDisplayFrozen:Z

    if-nez v3, :cond_58

    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    invoke-interface {v3}, Landroid/view/WindowManagerPolicy;->isScreenOn()Z

    move-result v3

    if-eqz v3, :cond_58

    .line 8055
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    sget-object v4, Lcom/android/server/WindowManagerService;->sDummyAnimation:Landroid/view/animation/Animation;

    if-ne v3, v4, :cond_1b

    move v3, v5

    .line 8125
    :goto_1a
    return v3

    .line 8063
    :cond_1b
    iget-boolean v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allDrawn:Z

    if-nez v3, :cond_27

    iget-boolean v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    if-nez v3, :cond_27

    iget-boolean v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingDisplayed:Z

    if-eqz v3, :cond_50

    :cond_27
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_50

    .line 8064
    iget-boolean v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    if-nez v3, :cond_3b

    .line 8070
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    invoke-virtual {v3, p3, p4, p3, p4}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 8071
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    invoke-virtual {v3, p1, p2}, Landroid/view/animation/Animation;->setStartTime(J)V

    .line 8072
    iput-boolean v6, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    .line 8074
    :cond_3b
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->transformation:Landroid/view/animation/Transformation;

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->clear()V

    .line 8075
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->transformation:Landroid/view/animation/Transformation;

    invoke-virtual {v3, p1, p2, v4}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v2

    .line 8080
    .local v2, more:Z
    if-eqz v2, :cond_4e

    .line 8082
    iput-boolean v6, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->hasTransformation:Z

    move v3, v6

    .line 8083
    goto :goto_1a

    .line 8088
    :cond_4e
    iput-object v7, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    .line 8097
    .end local v2           #more:Z
    :cond_50
    :goto_50
    iput-boolean v5, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->hasTransformation:Z

    .line 8099
    iget-boolean v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    if-nez v3, :cond_61

    move v3, v5

    .line 8100
    goto :goto_1a

    .line 8090
    :cond_58
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_50

    .line 8093
    iput-boolean v6, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    .line 8094
    iput-object v7, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animation:Landroid/view/animation/Animation;

    goto :goto_50

    .line 8103
    :cond_61
    invoke-virtual {p0}, Lcom/android/server/WindowManagerService$AppWindowToken;->clearAnimation()V

    .line 8104
    iput-boolean v5, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animating:Z

    .line 8105
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/WindowManagerService;->mInputMethodTarget:Lcom/android/server/WindowManagerService$WindowState;

    if-eqz v3, :cond_79

    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/WindowManagerService;->mInputMethodTarget:Lcom/android/server/WindowManagerService$WindowState;

    iget-object v3, v3, Lcom/android/server/WindowManagerService$WindowState;->mAppToken:Lcom/android/server/WindowManagerService$AppWindowToken;

    if-ne v3, p0, :cond_79

    .line 8106
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    invoke-virtual {v3, v6}, Lcom/android/server/WindowManagerService;->moveInputMethodWindowsIfNeededLocked(Z)Z

    .line 8113
    :cond_79
    iget-object v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->transformation:Landroid/view/animation/Transformation;

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->clear()V

    .line 8114
    iget v3, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animLayerAdjustment:I

    if-eqz v3, :cond_87

    .line 8115
    iput v5, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animLayerAdjustment:I

    .line 8116
    invoke-virtual {p0}, Lcom/android/server/WindowManagerService$AppWindowToken;->updateLayers()V

    .line 8119
    :cond_87
    iget-object v3, p0, Lcom/android/server/WindowManagerService$WindowToken;->windows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 8120
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_8e
    if-ge v1, v0, :cond_9e

    .line 8121
    iget-object v3, p0, Lcom/android/server/WindowManagerService$WindowToken;->windows:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/WindowManagerService$WindowState;

    invoke-virtual {v3}, Lcom/android/server/WindowManagerService$WindowState;->finishExit()V

    .line 8120
    add-int/lit8 v1, v1, 0x1

    goto :goto_8e

    .line 8123
    :cond_9e
    invoke-virtual {p0}, Lcom/android/server/WindowManagerService$AppWindowToken;->updateReportedVisibilityLocked()V

    move v3, v5

    .line 8125
    goto/16 :goto_1a
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 8258
    iget-object v1, p0, Lcom/android/server/WindowManagerService$WindowToken;->stringName:Ljava/lang/String;

    if-nez v1, :cond_2e

    .line 8259
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8260
    .local v0, sb:Ljava/lang/StringBuilder;
    const-string v1, "AppWindowToken{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8261
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8262
    const-string v1, " token="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/server/WindowManagerService$WindowToken;->token:Landroid/os/IBinder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 8263
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/WindowManagerService$WindowToken;->stringName:Ljava/lang/String;

    .line 8265
    .end local v0           #sb:Ljava/lang/StringBuilder;
    :cond_2e
    iget-object v1, p0, Lcom/android/server/WindowManagerService$WindowToken;->stringName:Ljava/lang/String;

    return-object v1
.end method

.method updateLayers()V
    .registers 6

    .prologue
    .line 8007
    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 8008
    .local v0, N:I
    iget v1, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->animLayerAdjustment:I

    .line 8009
    .local v1, adj:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_9
    if-ge v2, v0, :cond_37

    .line 8010
    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/WindowManagerService$WindowState;

    .line 8011
    .local v3, w:Lcom/android/server/WindowManagerService$WindowState;
    iget v4, v3, Lcom/android/server/WindowManagerService$WindowState;->mLayer:I

    add-int/2addr v4, v1

    iput v4, v3, Lcom/android/server/WindowManagerService$WindowState;->mAnimLayer:I

    .line 8014
    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mInputMethodTarget:Lcom/android/server/WindowManagerService$WindowState;

    if-ne v3, v4, :cond_23

    .line 8015
    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    invoke-virtual {v4, v1}, Lcom/android/server/WindowManagerService;->setInputMethodAnimLayerAdjustment(I)V

    .line 8017
    :cond_23
    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWallpaperTarget:Lcom/android/server/WindowManagerService$WindowState;

    if-ne v3, v4, :cond_34

    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mLowerWallpaperTarget:Lcom/android/server/WindowManagerService$WindowState;

    if-nez v4, :cond_34

    .line 8018
    iget-object v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    invoke-virtual {v4, v1}, Lcom/android/server/WindowManagerService;->setWallpaperAnimLayerAdjustmentLocked(I)V

    .line 8009
    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 8021
    .end local v3           #w:Lcom/android/server/WindowManagerService$WindowState;
    :cond_37
    return-void
.end method

.method updateReportedVisibilityLocked()V
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 8129
    iget-object v8, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    if-nez v8, :cond_7

    .line 8188
    :cond_6
    :goto_6
    return-void

    .line 8133
    :cond_7
    const/4 v5, 0x0

    .line 8134
    .local v5, numInteresting:I
    const/4 v6, 0x0

    .line 8135
    .local v6, numVisible:I
    const/4 v3, 0x1

    .line 8138
    .local v3, nowGone:Z
    iget-object v8, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 8139
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_11
    if-ge v1, v0, :cond_4b

    .line 8140
    iget-object v8, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->allAppWindows:Ljava/util/ArrayList;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/WindowManagerService$WindowState;

    .line 8141
    .local v7, win:Lcom/android/server/WindowManagerService$WindowState;
    iget-object v8, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    if-eq v7, v8, :cond_2e

    iget-boolean v8, v7, Lcom/android/server/WindowManagerService$WindowState;->mAppFreezing:Z

    if-nez v8, :cond_2e

    iget v8, v7, Lcom/android/server/WindowManagerService$WindowState;->mViewVisibility:I

    if-nez v8, :cond_2e

    iget-object v8, v7, Lcom/android/server/WindowManagerService$WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v8, v8, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v9, 0x3

    if-ne v8, v9, :cond_31

    .line 8139
    :cond_2e
    :goto_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 8162
    :cond_31
    add-int/lit8 v5, v5, 0x1

    .line 8163
    invoke-virtual {v7}, Lcom/android/server/WindowManagerService$WindowState;->isDrawnLw()Z

    move-result v8

    if-eqz v8, :cond_43

    .line 8164
    invoke-virtual {v7}, Lcom/android/server/WindowManagerService$WindowState;->isAnimating()Z

    move-result v8

    if-nez v8, :cond_41

    .line 8165
    add-int/lit8 v6, v6, 0x1

    .line 8167
    :cond_41
    const/4 v3, 0x0

    goto :goto_2e

    .line 8168
    :cond_43
    invoke-virtual {v7}, Lcom/android/server/WindowManagerService$WindowState;->isAnimating()Z

    move-result v8

    if-eqz v8, :cond_2e

    .line 8169
    const/4 v3, 0x0

    goto :goto_2e

    .line 8173
    .end local v7           #win:Lcom/android/server/WindowManagerService$WindowState;
    :cond_4b
    if-lez v5, :cond_6e

    if-lt v6, v5, :cond_6e

    move v4, v12

    .line 8176
    .local v4, nowVisible:Z
    :goto_50
    iget-boolean v8, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->reportedVisible:Z

    if-eq v4, v8, :cond_6

    .line 8180
    iput-boolean v4, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->reportedVisible:Z

    .line 8181
    iget-object v8, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v8, v8, Lcom/android/server/WindowManagerService;->mH:Lcom/android/server/WindowManagerService$H;

    const/16 v9, 0x8

    if-eqz v4, :cond_70

    move v10, v12

    :goto_5f
    if-eqz v3, :cond_62

    move v11, v12

    :cond_62
    invoke-virtual {v8, v9, v10, v11, p0}, Lcom/android/server/WindowManagerService$H;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 8186
    .local v2, m:Landroid/os/Message;
    iget-object v8, p0, Lcom/android/server/WindowManagerService$AppWindowToken;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v8, v8, Lcom/android/server/WindowManagerService;->mH:Lcom/android/server/WindowManagerService$H;

    invoke-virtual {v8, v2}, Lcom/android/server/WindowManagerService$H;->sendMessage(Landroid/os/Message;)Z

    goto :goto_6

    .end local v2           #m:Landroid/os/Message;
    .end local v4           #nowVisible:Z
    :cond_6e
    move v4, v11

    .line 8173
    goto :goto_50

    .restart local v4       #nowVisible:Z
    :cond_70
    move v10, v11

    .line 8181
    goto :goto_5f
.end method
