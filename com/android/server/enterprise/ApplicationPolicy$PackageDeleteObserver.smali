.class Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;
.super Landroid/content/pm/IPackageDeleteObserver$Stub;
.source "ApplicationPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/enterprise/ApplicationPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PackageDeleteObserver"
.end annotation


# instance fields
.field finished:Z

.field result:Z

.field final synthetic this$0:Lcom/android/server/enterprise/ApplicationPolicy;


# direct methods
.method constructor <init>(Lcom/android/server/enterprise/ApplicationPolicy;)V
    .registers 2
    .parameter

    .prologue
    .line 521
    iput-object p1, p0, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->this$0:Lcom/android/server/enterprise/ApplicationPolicy;

    invoke-direct {p0}, Landroid/content/pm/IPackageDeleteObserver$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public packageDeleted(Z)V
    .registers 3
    .parameter "succeeded"

    .prologue
    .line 527
    monitor-enter p0

    .line 528
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->finished:Z

    .line 529
    iput-boolean p1, p0, Lcom/android/server/enterprise/ApplicationPolicy$PackageDeleteObserver;->result:Z

    .line 530
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 531
    monitor-exit p0

    .line 532
    return-void

    .line 531
    :catchall_b
    move-exception v0

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_2 .. :try_end_d} :catchall_b

    throw v0
.end method
