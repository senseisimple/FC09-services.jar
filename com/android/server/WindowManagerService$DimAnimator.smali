.class Lcom/android/server/WindowManagerService$DimAnimator;
.super Ljava/lang/Object;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DimAnimator"
.end annotation


# instance fields
.field mDimCurrentAlpha:F

.field mDimDeltaPerMs:F

.field mDimShown:Z

.field mDimSurface:Landroid/view/Surface;

.field mDimTargetAlpha:F

.field mLastDimAnimTime:J

.field mLastDimHeight:I

.field mLastDimWidth:I


# direct methods
.method constructor <init>(Landroid/view/SurfaceSession;)V
    .registers 12
    .parameter "session"

    .prologue
    const/4 v0, 0x0

    .line 11076
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11068
    iput-boolean v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimShown:Z

    .line 11077
    iget-object v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    if-nez v0, :cond_23

    .line 11081
    :try_start_a
    new-instance v0, Landroid/view/Surface;

    const/4 v2, 0x0

    const-string v3, "DimSurface"

    const/4 v4, -0x1

    const/16 v5, 0x10

    const/16 v6, 0x10

    const/4 v7, -0x1

    const/high16 v8, 0x2

    move-object v1, p1

    invoke-direct/range {v0 .. v8}, Landroid/view/Surface;-><init>(Landroid/view/SurfaceSession;ILjava/lang/String;IIIII)V

    iput-object v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    .line 11085
    iget-object v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Surface;->setAlpha(F)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_23} :catch_24

    .line 11090
    :cond_23
    :goto_23
    return-void

    .line 11086
    :catch_24
    move-exception v0

    move-object v9, v0

    .line 11087
    .local v9, e:Ljava/lang/Exception;
    const-string v0, "WindowManagerService"

    const-string v1, "Exception creating Dim surface"

    invoke-static {v0, v1, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_23
.end method


# virtual methods
.method public printTo(Ljava/io/PrintWriter;)V
    .registers 4
    .parameter "pw"

    .prologue
    .line 11211
    const-string v0, "  mDimShown="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimShown:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 11212
    const-string v0, " current="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 11213
    const-string v0, " target="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 11214
    const-string v0, " delta="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimDeltaPerMs:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 11215
    const-string v0, " lastAnimTime="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimAnimTime:J

    invoke-virtual {p1, v0, v1}, Ljava/io/PrintWriter;->println(J)V

    .line 11216
    return-void
.end method

.method show(II)V
    .registers 7
    .parameter "dw"
    .parameter "dh"

    .prologue
    .line 11096
    iget-boolean v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimShown:Z

    if-nez v1, :cond_27

    .line 11099
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimShown:Z

    .line 11101
    :try_start_7
    iput p1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimWidth:I

    .line 11102
    iput p2, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimHeight:I

    .line 11103
    iget-object v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/Surface;->setPosition(II)V

    .line 11104
    iget-object v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v1, p1, p2}, Landroid/view/Surface;->setSize(II)V

    .line 11105
    iget-object v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v1}, Landroid/view/Surface;->show()V
    :try_end_1c
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_1c} :catch_1d

    .line 11114
    :cond_1c
    :goto_1c
    return-void

    .line 11106
    :catch_1d
    move-exception v1

    move-object v0, v1

    .line 11107
    .local v0, e:Ljava/lang/RuntimeException;
    const-string v1, "WindowManagerService"

    const-string v2, "Failure showing dim surface"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1c

    .line 11109
    .end local v0           #e:Ljava/lang/RuntimeException;
    :cond_27
    iget v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimWidth:I

    if-ne v1, p1, :cond_2f

    iget v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimHeight:I

    if-eq v1, p2, :cond_1c

    .line 11110
    :cond_2f
    iput p1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimWidth:I

    .line 11111
    iput p2, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimHeight:I

    .line 11112
    iget-object v1, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v1, p1, p2}, Landroid/view/Surface;->setSize(II)V

    goto :goto_1c
.end method

.method updateParameters(Lcom/android/server/WindowManagerService$WindowState;J)V
    .registers 10
    .parameter "w"
    .parameter "currentTime"

    .prologue
    .line 11121
    iget-object v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    iget v4, p1, Lcom/android/server/WindowManagerService$WindowState;->mAnimLayer:I

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/view/Surface;->setLayer(I)V

    .line 11123
    iget-boolean v3, p1, Lcom/android/server/WindowManagerService$WindowState;->mExiting:Z

    if-eqz v3, :cond_43

    const/4 v3, 0x0

    move v2, v3

    .line 11126
    .local v2, target:F
    :goto_f
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    cmpl-float v3, v3, v2

    if-eqz v3, :cond_42

    .line 11129
    iput-wide p2, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimAnimTime:J

    .line 11130
    iget-boolean v3, p1, Lcom/android/server/WindowManagerService$WindowState;->mAnimating:Z

    if-eqz v3, :cond_49

    iget-object v3, p1, Lcom/android/server/WindowManagerService$WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_49

    iget-object v3, p1, Lcom/android/server/WindowManagerService$WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v3}, Landroid/view/animation/Animation;->computeDurationHint()J

    move-result-wide v3

    move-wide v0, v3

    .line 11133
    .local v0, duration:J
    :goto_26
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    cmpl-float v3, v2, v3

    if-lez v3, :cond_2f

    .line 11138
    const-wide/16 v3, 0x6

    mul-long/2addr v0, v3

    .line 11140
    :cond_2f
    const-wide/16 v3, 0x1

    cmp-long v3, v0, v3

    if-gez v3, :cond_37

    .line 11142
    const-wide/16 v0, 0x1

    .line 11144
    :cond_37
    iput v2, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    .line 11145
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    iget v4, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    sub-float/2addr v3, v4

    long-to-float v4, v0

    div-float/2addr v3, v4

    iput v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimDeltaPerMs:F

    .line 11147
    .end local v0           #duration:J
    :cond_42
    return-void

    .line 11123
    .end local v2           #target:F
    :cond_43
    iget-object v3, p1, Lcom/android/server/WindowManagerService$WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    move v2, v3

    goto :goto_f

    .line 11130
    .restart local v2       #target:F
    :cond_49
    const-wide/16 v3, 0xc8

    move-wide v0, v3

    goto :goto_26
.end method

.method updateSurface(ZJZ)Z
    .registers 15
    .parameter "dimming"
    .parameter "currentTime"
    .parameter "displayFrozen"

    .prologue
    const-wide/16 v8, 0x0

    const/4 v7, 0x0

    .line 11154
    if-nez p1, :cond_17

    .line 11155
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    cmpl-float v3, v3, v7

    if-eqz v3, :cond_17

    .line 11156
    iput-wide p2, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimAnimTime:J

    .line 11157
    iput v7, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    .line 11158
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    neg-float v3, v3

    const/high16 v4, 0x4348

    div-float/2addr v3, v4

    iput v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimDeltaPerMs:F

    .line 11162
    :cond_17
    const/4 v0, 0x0

    .line 11163
    .local v0, animating:Z
    iget-wide v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimAnimTime:J

    cmp-long v3, v3, v8

    if-eqz v3, :cond_3b

    .line 11164
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    iget v4, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimDeltaPerMs:F

    iget-wide v5, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimAnimTime:J

    sub-long v5, p2, v5

    long-to-float v5, v5

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    iput v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    .line 11166
    const/4 v2, 0x1

    .line 11167
    .local v2, more:Z
    if-eqz p4, :cond_3c

    .line 11169
    const/4 v2, 0x0

    .line 11183
    :cond_2f
    :goto_2f
    if-eqz v2, :cond_5e

    .line 11186
    iput-wide p2, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimAnimTime:J

    .line 11187
    iget-object v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    iget v4, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    invoke-virtual {v3, v4}, Landroid/view/Surface;->setAlpha(F)V

    .line 11188
    const/4 v0, 0x1

    .line 11207
    .end local v2           #more:Z
    :cond_3b
    :goto_3b
    return v0

    .line 11170
    .restart local v2       #more:Z
    :cond_3c
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimDeltaPerMs:F

    cmpl-float v3, v3, v7

    if-lez v3, :cond_4c

    .line 11171
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    iget v4, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2f

    .line 11172
    const/4 v2, 0x0

    goto :goto_2f

    .line 11174
    :cond_4c
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimDeltaPerMs:F

    cmpg-float v3, v3, v7

    if-gez v3, :cond_5c

    .line 11175
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    iget v4, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_2f

    .line 11176
    const/4 v2, 0x0

    goto :goto_2f

    .line 11179
    :cond_5c
    const/4 v2, 0x0

    goto :goto_2f

    .line 11190
    :cond_5e
    iget v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimTargetAlpha:F

    iput v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    .line 11191
    iput-wide v8, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mLastDimAnimTime:J

    .line 11194
    iget-object v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    iget v4, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimCurrentAlpha:F

    invoke-virtual {v3, v4}, Landroid/view/Surface;->setAlpha(F)V

    .line 11195
    if-nez p1, :cond_3b

    .line 11199
    :try_start_6d
    iget-object v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v3}, Landroid/view/Surface;->hide()V
    :try_end_72
    .catch Ljava/lang/RuntimeException; {:try_start_6d .. :try_end_72} :catch_76

    .line 11203
    :goto_72
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/server/WindowManagerService$DimAnimator;->mDimShown:Z

    goto :goto_3b

    .line 11200
    :catch_76
    move-exception v3

    move-object v1, v3

    .line 11201
    .local v1, e:Ljava/lang/RuntimeException;
    const-string v3, "WindowManagerService"

    const-string v4, "Illegal argument exception hiding dim surface"

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_72
.end method
