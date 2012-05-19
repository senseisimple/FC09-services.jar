.class Lcom/android/server/WindowManagerService$FadeInOutAnimation;
.super Landroid/view/animation/Animation;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FadeInOutAnimation"
.end annotation


# instance fields
.field mFadeIn:Z

.field mWidth:I


# direct methods
.method public constructor <init>(Z)V
    .registers 4
    .parameter "fadeIn"

    .prologue
    .line 11227
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 11228
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {p0, v0}, Lcom/android/server/WindowManagerService$FadeInOutAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 11229
    const-wide/16 v0, 0x190

    invoke-virtual {p0, v0, v1}, Lcom/android/server/WindowManagerService$FadeInOutAnimation;->setDuration(J)V

    .line 11230
    iput-boolean p1, p0, Lcom/android/server/WindowManagerService$FadeInOutAnimation;->mFadeIn:Z

    .line 11231
    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .registers 9
    .parameter "interpolatedTime"
    .parameter "t"

    .prologue
    const/4 v5, 0x0

    .line 11235
    move v0, p1

    .line 11236
    .local v0, x:F
    iget-boolean v1, p0, Lcom/android/server/WindowManagerService$FadeInOutAnimation;->mFadeIn:Z

    if-nez v1, :cond_a

    .line 11237
    const/high16 v1, 0x3f80

    sub-float v0, v1, v0

    .line 11239
    :cond_a
    float-to-double v1, v0

    const-wide/high16 v3, 0x3fe0

    cmpg-double v1, v1, v3

    if-gez v1, :cond_1c

    .line 11241
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget v2, p0, Lcom/android/server/WindowManagerService$FadeInOutAnimation;->mWidth:I

    int-to-float v2, v2

    invoke-virtual {v1, v2, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 11246
    :goto_1b
    return-void

    .line 11243
    :cond_1c
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v5, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 11244
    const/high16 v1, 0x3f00

    sub-float v1, v0, v1

    const/high16 v2, 0x4000

    mul-float/2addr v1, v2

    invoke-virtual {p2, v1}, Landroid/view/animation/Transformation;->setAlpha(F)V

    goto :goto_1b
.end method

.method public getZAdjustment()I
    .registers 2

    .prologue
    .line 11256
    const/4 v0, 0x1

    return v0
.end method

.method public initialize(IIII)V
    .registers 5
    .parameter "width"
    .parameter "height"
    .parameter "parentWidth"
    .parameter "parentHeight"

    .prologue
    .line 11251
    iput p1, p0, Lcom/android/server/WindowManagerService$FadeInOutAnimation;->mWidth:I

    .line 11252
    return-void
.end method
