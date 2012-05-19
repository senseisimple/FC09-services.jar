.class Lcom/android/server/DeviceStorageMonitorService$4;
.super Ljava/lang/Object;
.source "DeviceStorageMonitorService.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/DeviceStorageMonitorService;->sendFullNotification()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/DeviceStorageMonitorService;


# direct methods
.method constructor <init>(Lcom/android/server/DeviceStorageMonitorService;)V
    .registers 2
    .parameter

    .prologue
    .line 689
    iput-object p1, p0, Lcom/android/server/DeviceStorageMonitorService$4;->this$0:Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 693
    #calls: Lcom/android/server/DeviceStorageMonitorService;->deleteMemBumper()V
    invoke-static {}, Lcom/android/server/DeviceStorageMonitorService;->access$600()V

    .line 694
    return-void
.end method
