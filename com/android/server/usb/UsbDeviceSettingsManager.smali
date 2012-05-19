.class Lcom/android/server/usb/UsbDeviceSettingsManager;
.super Ljava/lang/Object;
.source "UsbDeviceSettingsManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbDeviceSettingsManager$1;,
        Lcom/android/server/usb/UsbDeviceSettingsManager$MyPackageMonitor;,
        Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "UsbDeviceSettingsManager"

.field private static final sSettingsFile:Ljava/io/File;


# instance fields
.field private final mAccessoryPermissionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/hardware/usb/UsbAccessory;",
            "Landroid/util/SparseBooleanArray;",
            ">;"
        }
    .end annotation
.end field

.field private final mAccessoryPreferenceMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mLock:Ljava/lang/Object;

.field private final mPackageManager:Landroid/content/pm/PackageManager;

.field mPackageMonitor:Lcom/android/server/usb/UsbDeviceSettingsManager$MyPackageMonitor;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 63
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/system/usb_device_manager.xml"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/usb/UsbDeviceSettingsManager;->sSettingsFile:Ljava/io/File;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .parameter "context"

    .prologue
    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    .line 75
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    .line 201
    new-instance v0, Lcom/android/server/usb/UsbDeviceSettingsManager$MyPackageMonitor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/server/usb/UsbDeviceSettingsManager$MyPackageMonitor;-><init>(Lcom/android/server/usb/UsbDeviceSettingsManager;Lcom/android/server/usb/UsbDeviceSettingsManager$1;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageMonitor:Lcom/android/server/usb/UsbDeviceSettingsManager$MyPackageMonitor;

    .line 204
    iput-object p1, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mContext:Landroid/content/Context;

    .line 205
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 206
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 207
    :try_start_2b
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceSettingsManager;->readSettingsLocked()V

    .line 208
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2b .. :try_end_2f} :catchall_36

    .line 209
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageMonitor:Lcom/android/server/usb/UsbDeviceSettingsManager$MyPackageMonitor;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/android/server/usb/UsbDeviceSettingsManager$MyPackageMonitor;->register(Landroid/content/Context;Z)V

    .line 210
    return-void

    .line 208
    :catchall_36
    move-exception v1

    :try_start_37
    monitor-exit v0
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_36

    throw v1
.end method

.method static synthetic access$000(Lcom/android/server/usb/UsbDeviceSettingsManager;Ljava/lang/String;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->handlePackageUpdate(Ljava/lang/String;)V

    return-void
.end method

.method private clearCompatibleMatchesLocked(Ljava/lang/String;Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;)Z
    .registers 7
    .parameter "packageName"
    .parameter "filter"

    .prologue
    .line 458
    const/4 v0, 0x0

    .line 459
    .local v0, changed:Z
    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    .line 460
    .local v2, test:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    invoke-virtual {p2, v2}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;->matches(Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 461
    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    const/4 v0, 0x1

    goto :goto_b

    .line 465
    .end local v2           #test:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    :cond_24
    return v0
.end method

.method private clearPackageDefaultsLocked(Ljava/lang/String;)Z
    .registers 8
    .parameter "packageName"

    .prologue
    .line 636
    const/4 v0, 0x0

    .line 637
    .local v0, cleared:Z
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 638
    :try_start_4
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v5, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 640
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v3

    .line 641
    .local v3, keys:[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_17
    array-length v5, v3

    if-ge v1, v5, :cond_31

    .line 642
    aget-object v2, v3, v1

    .line 643
    .local v2, key:Ljava/lang/Object;
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 644
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 645
    const/4 v0, 0x1

    .line 641
    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 649
    .end local v1           #i:I
    .end local v2           #key:Ljava/lang/Object;
    .end local v3           #keys:[Ljava/lang/Object;
    :cond_31
    monitor-exit v4

    return v0

    .line 650
    :catchall_33
    move-exception v5

    monitor-exit v4
    :try_end_35
    .catchall {:try_start_4 .. :try_end_35} :catchall_33

    throw v5
.end method

.method private final getAccessoryMatchesLocked(Landroid/hardware/usb/UsbAccessory;Landroid/content/Intent;)Ljava/util/ArrayList;
    .registers 10
    .parameter "accessory"
    .parameter "intent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/usb/UsbAccessory;",
            "Landroid/content/Intent;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 326
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 327
    .local v2, matches:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/ResolveInfo;>;"
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    const/16 v6, 0x80

    invoke-virtual {v5, p2, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    .line 329
    .local v4, resolveInfos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    .line 330
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_12
    if-ge v1, v0, :cond_2a

    .line 331
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 332
    .local v3, resolveInfo:Landroid/content/pm/ResolveInfo;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v3, v5, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->packageMatchesLocked(Landroid/content/pm/ResolveInfo;Ljava/lang/String;Landroid/hardware/usb/UsbAccessory;)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 333
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 330
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 336
    .end local v3           #resolveInfo:Landroid/content/pm/ResolveInfo;
    :cond_2a
    return-object v2
.end method

.method private handlePackageUpdate(Ljava/lang/String;)V
    .registers 11
    .parameter "packageName"

    .prologue
    .line 499
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 501
    const/4 v1, 0x0

    .line 504
    .local v1, changed:Z
    :try_start_4
    iget-object v6, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    const/16 v7, 0x81

    invoke-virtual {v6, p1, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_2e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_b} :catch_12

    move-result-object v4

    .line 511
    .local v4, info:Landroid/content/pm/PackageInfo;
    :try_start_c
    iget-object v0, v4, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    .line 512
    .local v0, activities:[Landroid/content/pm/ActivityInfo;
    if-nez v0, :cond_31

    monitor-exit v5

    .line 525
    .end local v0           #activities:[Landroid/content/pm/ActivityInfo;
    .end local v4           #info:Landroid/content/pm/PackageInfo;
    :goto_11
    return-void

    .line 506
    :catch_12
    move-exception v6

    move-object v2, v6

    .line 507
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v6, "UsbDeviceSettingsManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "handlePackageUpdate could not find package "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 508
    monitor-exit v5

    goto :goto_11

    .line 524
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catchall_2e
    move-exception v6

    monitor-exit v5
    :try_end_30
    .catchall {:try_start_c .. :try_end_30} :catchall_2e

    throw v6

    .line 513
    .restart local v0       #activities:[Landroid/content/pm/ActivityInfo;
    .restart local v4       #info:Landroid/content/pm/PackageInfo;
    :cond_31
    const/4 v3, 0x0

    .local v3, i:I
    :goto_32
    :try_start_32
    array-length v6, v0

    if-ge v3, v6, :cond_43

    .line 515
    aget-object v6, v0, v3

    const-string v7, "android.hardware.usb.action.USB_ACCESSORY_ATTACHED"

    invoke-direct {p0, p1, v6, v7}, Lcom/android/server/usb/UsbDeviceSettingsManager;->handlePackageUpdateLocked(Ljava/lang/String;Landroid/content/pm/ActivityInfo;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_40

    .line 517
    const/4 v1, 0x1

    .line 513
    :cond_40
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    .line 521
    :cond_43
    if-eqz v1, :cond_48

    .line 522
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceSettingsManager;->writeSettingsLocked()V

    .line 524
    :cond_48
    monitor-exit v5
    :try_end_49
    .catchall {:try_start_32 .. :try_end_49} :catchall_2e

    goto :goto_11
.end method

.method private handlePackageUpdateLocked(Ljava/lang/String;Landroid/content/pm/ActivityInfo;Ljava/lang/String;)Z
    .registers 12
    .parameter "packageName"
    .parameter "aInfo"
    .parameter "metaDataName"

    .prologue
    .line 470
    const/4 v3, 0x0

    .line 471
    .local v3, parser:Landroid/content/res/XmlResourceParser;
    const/4 v0, 0x0

    .line 474
    .local v0, changed:Z
    :try_start_2
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p2, v5, p3}, Landroid/content/pm/ActivityInfo;->loadXmlMetaData(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/res/XmlResourceParser;
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_5b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_36

    move-result-object v3

    .line 475
    if-nez v3, :cond_11

    const/4 v5, 0x0

    .line 491
    if-eqz v3, :cond_10

    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V

    .line 493
    :cond_10
    :goto_10
    return v5

    .line 477
    :cond_11
    :try_start_11
    invoke-static {v3}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 478
    :goto_14
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_62

    .line 479
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 480
    .local v4, tagName:Ljava/lang/String;
    const-string v5, "usb-accessory"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 481
    invoke-static {v3}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    move-result-object v2

    .line 482
    .local v2, filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    invoke-direct {p0, p1, v2}, Lcom/android/server/usb/UsbDeviceSettingsManager;->clearCompatibleMatchesLocked(Ljava/lang/String;Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 483
    const/4 v0, 0x1

    .line 486
    .end local v2           #filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    :cond_32
    invoke-static {v3}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_35
    .catchall {:try_start_11 .. :try_end_35} :catchall_5b
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_35} :catch_36

    goto :goto_14

    .line 488
    .end local v4           #tagName:Ljava/lang/String;
    :catch_36
    move-exception v5

    move-object v1, v5

    .line 489
    .local v1, e:Ljava/lang/Exception;
    :try_start_38
    const-string v5, "UsbDeviceSettingsManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to load component info "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Landroid/content/pm/ActivityInfo;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_54
    .catchall {:try_start_38 .. :try_end_54} :catchall_5b

    .line 491
    if-eqz v3, :cond_59

    .end local v1           #e:Ljava/lang/Exception;
    :goto_56
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_59
    move v5, v0

    .line 493
    goto :goto_10

    .line 491
    :catchall_5b
    move-exception v5

    if-eqz v3, :cond_61

    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_61
    throw v5

    :cond_62
    if-eqz v3, :cond_59

    goto :goto_56
.end method

.method private packageMatchesLocked(Landroid/content/pm/ResolveInfo;Ljava/lang/String;Landroid/hardware/usb/UsbAccessory;)Z
    .registers 13
    .parameter "info"
    .parameter "metaDataName"
    .parameter "accessory"

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    const-string v5, "UsbDeviceSettingsManager"

    .line 295
    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 297
    .local v0, ai:Landroid/content/pm/ActivityInfo;
    const/4 v3, 0x0

    .line 299
    .local v3, parser:Landroid/content/res/XmlResourceParser;
    :try_start_7
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v0, v5, p2}, Landroid/content/pm/ActivityInfo;->loadXmlMetaData(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/res/XmlResourceParser;

    move-result-object v3

    .line 300
    if-nez v3, :cond_2e

    .line 301
    const-string v5, "UsbDeviceSettingsManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "no meta-data for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_27
    .catchall {:try_start_7 .. :try_end_27} :catchall_7f
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_27} :catch_5a

    .line 319
    if-eqz v3, :cond_2c

    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_2c
    move v5, v8

    .line 321
    :goto_2d
    return v5

    .line 305
    :cond_2e
    :try_start_2e
    invoke-static {v3}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 306
    :goto_31
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v5

    if-eq v5, v6, :cond_86

    .line 307
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 308
    .local v4, tagName:Ljava/lang/String;
    if-eqz p3, :cond_56

    const-string v5, "usb-accessory"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_56

    .line 309
    invoke-static {v3}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    move-result-object v2

    .line 310
    .local v2, filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    invoke-virtual {v2, p3}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;->matches(Landroid/hardware/usb/UsbAccessory;)Z
    :try_end_4c
    .catchall {:try_start_2e .. :try_end_4c} :catchall_7f
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_4c} :catch_5a

    move-result v5

    if-eqz v5, :cond_56

    .line 319
    if-eqz v3, :cond_54

    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_54
    move v5, v6

    .line 311
    goto :goto_2d

    .line 314
    .end local v2           #filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    :cond_56
    :try_start_56
    invoke-static {v3}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_7f
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_59} :catch_5a

    goto :goto_31

    .line 316
    .end local v4           #tagName:Ljava/lang/String;
    :catch_5a
    move-exception v5

    move-object v1, v5

    .line 317
    .local v1, e:Ljava/lang/Exception;
    :try_start_5c
    const-string v5, "UsbDeviceSettingsManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to load component info "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Landroid/content/pm/ResolveInfo;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_78
    .catchall {:try_start_5c .. :try_end_78} :catchall_7f

    .line 319
    if-eqz v3, :cond_7d

    .end local v1           #e:Ljava/lang/Exception;
    :goto_7a
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_7d
    move v5, v8

    .line 321
    goto :goto_2d

    .line 319
    :catchall_7f
    move-exception v5

    if-eqz v3, :cond_85

    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_85
    throw v5

    :cond_86
    if-eqz v3, :cond_7d

    goto :goto_7a
.end method

.method private readPreference(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 8
    .parameter "parser"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    const/4 v3, 0x0

    .line 215
    .local v3, packageName:Ljava/lang/String;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    .line 216
    .local v0, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_6
    if-ge v2, v0, :cond_18

    .line 217
    const-string v4, "package"

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    .line 218
    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    .line 222
    :cond_18
    invoke-static {p1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 223
    const-string v4, "usb-accessory"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    .line 224
    invoke-static {p1}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    move-result-object v1

    .line 225
    .local v1, filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .end local v1           #filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    :cond_30
    invoke-static {p1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 228
    return-void

    .line 216
    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method private readSettingsLocked()V
    .registers 8

    .prologue
    const-string v5, "UsbDeviceSettingsManager"

    .line 231
    const/4 v2, 0x0

    .line 233
    .local v2, stream:Ljava/io/FileInputStream;
    :try_start_3
    new-instance v3, Ljava/io/FileInputStream;

    sget-object v5, Lcom/android/server/usb/UsbDeviceSettingsManager;->sSettingsFile:Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_5e
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_a} :catch_6f
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_a} :catch_6c

    .line 234
    .end local v2           #stream:Ljava/io/FileInputStream;
    .local v3, stream:Ljava/io/FileInputStream;
    :try_start_a
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    .line 235
    .local v1, parser:Lorg/xmlpull/v1/XmlPullParser;
    const/4 v5, 0x0

    invoke-interface {v1, v3, v5}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 237
    invoke-static {v1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 238
    :goto_15
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_57

    .line 239
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 240
    .local v4, tagName:Ljava/lang/String;
    const-string v5, "preference"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 241
    invoke-direct {p0, v1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->readPreference(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_2b
    .catchall {:try_start_a .. :try_end_2b} :catchall_69
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_2b} :catch_2c
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_2b} :catch_40

    goto :goto_15

    .line 246
    .end local v1           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v4           #tagName:Ljava/lang/String;
    :catch_2c
    move-exception v5

    move-object v0, v5

    move-object v2, v3

    .line 247
    .end local v3           #stream:Ljava/io/FileInputStream;
    .local v0, e:Ljava/io/FileNotFoundException;
    .restart local v2       #stream:Ljava/io/FileInputStream;
    :goto_2f
    :try_start_2f
    const-string v5, "UsbDeviceSettingsManager"

    const-string v6, "settings file not found"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_36
    .catchall {:try_start_2f .. :try_end_36} :catchall_5e

    .line 252
    if-eqz v2, :cond_3b

    .line 254
    :try_start_38
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_3b} :catch_55

    .line 259
    .end local v0           #e:Ljava/io/FileNotFoundException;
    :cond_3b
    :goto_3b
    return-void

    .line 243
    .end local v2           #stream:Ljava/io/FileInputStream;
    .restart local v1       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v3       #stream:Ljava/io/FileInputStream;
    .restart local v4       #tagName:Ljava/lang/String;
    :cond_3c
    :try_start_3c
    invoke-static {v1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_69
    .catch Ljava/io/FileNotFoundException; {:try_start_3c .. :try_end_3f} :catch_2c
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_3f} :catch_40

    goto :goto_15

    .line 248
    .end local v1           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v4           #tagName:Ljava/lang/String;
    :catch_40
    move-exception v5

    move-object v0, v5

    move-object v2, v3

    .line 249
    .end local v3           #stream:Ljava/io/FileInputStream;
    .local v0, e:Ljava/lang/Exception;
    .restart local v2       #stream:Ljava/io/FileInputStream;
    :goto_43
    :try_start_43
    const-string v5, "UsbDeviceSettingsManager"

    const-string v6, "error reading settings file, deleting to start fresh"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 250
    sget-object v5, Lcom/android/server/usb/UsbDeviceSettingsManager;->sSettingsFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z
    :try_end_4f
    .catchall {:try_start_43 .. :try_end_4f} :catchall_5e

    .line 252
    if-eqz v2, :cond_3b

    .line 254
    :try_start_51
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_54} :catch_55

    goto :goto_3b

    .line 255
    .end local v0           #e:Ljava/lang/Exception;
    :catch_55
    move-exception v5

    goto :goto_3b

    .line 252
    .end local v2           #stream:Ljava/io/FileInputStream;
    .restart local v1       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v3       #stream:Ljava/io/FileInputStream;
    :cond_57
    if-eqz v3, :cond_5c

    .line 254
    :try_start_59
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_5c} :catch_67

    :cond_5c
    :goto_5c
    move-object v2, v3

    .line 258
    .end local v3           #stream:Ljava/io/FileInputStream;
    .restart local v2       #stream:Ljava/io/FileInputStream;
    goto :goto_3b

    .line 252
    .end local v1           #parser:Lorg/xmlpull/v1/XmlPullParser;
    :catchall_5e
    move-exception v5

    :goto_5f
    if-eqz v2, :cond_64

    .line 254
    :try_start_61
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_64} :catch_65

    .line 252
    :cond_64
    :goto_64
    throw v5

    .line 255
    :catch_65
    move-exception v6

    goto :goto_64

    .end local v2           #stream:Ljava/io/FileInputStream;
    .restart local v1       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v3       #stream:Ljava/io/FileInputStream;
    :catch_67
    move-exception v5

    goto :goto_5c

    .line 252
    .end local v1           #parser:Lorg/xmlpull/v1/XmlPullParser;
    :catchall_69
    move-exception v5

    move-object v2, v3

    .end local v3           #stream:Ljava/io/FileInputStream;
    .restart local v2       #stream:Ljava/io/FileInputStream;
    goto :goto_5f

    .line 248
    :catch_6c
    move-exception v5

    move-object v0, v5

    goto :goto_43

    .line 246
    :catch_6f
    move-exception v5

    move-object v0, v5

    goto :goto_2f
.end method

.method private requestPermissionDialog(Landroid/content/Intent;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 13
    .parameter "intent"
    .parameter "packageName"
    .parameter "pi"

    .prologue
    const-string v8, "package "

    .line 544
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v4

    .line 548
    .local v4, uid:I
    :try_start_6
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v6, 0x0

    invoke-virtual {v5, p2, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 549
    .local v0, aInfo:Landroid/content/pm/ApplicationInfo;
    iget v5, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    if-eq v5, v4, :cond_55

    .line 550
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "package "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " does not match caller\'s uid "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_34
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_34} :catch_34

    .line 553
    .end local v0           #aInfo:Landroid/content/pm/ApplicationInfo;
    :catch_34
    move-exception v5

    move-object v1, v5

    .line 554
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "package "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " not found"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 557
    .end local v1           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v0       #aInfo:Landroid/content/pm/ApplicationInfo;
    :cond_55
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 558
    .local v2, identity:J
    const-string v5, "com.android.systemui"

    const-string v6, "com.android.systemui.usb.UsbPermissionActivity"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 560
    const/high16 v5, 0x1000

    invoke-virtual {p1, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 561
    const-string v5, "android.intent.extra.INTENT"

    invoke-virtual {p1, v5, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 562
    const-string v5, "package"

    invoke-virtual {p1, v5, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 563
    const-string v5, "uid"

    invoke-virtual {p1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 565
    :try_start_74
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_79
    .catchall {:try_start_74 .. :try_end_79} :catchall_87
    .catch Landroid/content/ActivityNotFoundException; {:try_start_74 .. :try_end_79} :catch_7d

    .line 569
    :goto_79
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 571
    return-void

    .line 566
    :catch_7d
    move-exception v5

    move-object v1, v5

    .line 567
    .local v1, e:Landroid/content/ActivityNotFoundException;
    :try_start_7f
    const-string v5, "UsbDeviceSettingsManager"

    const-string v6, "unable to start UsbPermissionActivity"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_86
    .catchall {:try_start_7f .. :try_end_86} :catchall_87

    goto :goto_79

    .line 569
    .end local v1           #e:Landroid/content/ActivityNotFoundException;
    :catchall_87
    move-exception v5

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5
.end method

.method private resolveActivity(Landroid/content/Intent;Ljava/util/ArrayList;Ljava/lang/String;Landroid/hardware/usb/UsbAccessory;)V
    .registers 16
    .parameter "intent"
    .parameter
    .parameter "defaultPackage"
    .parameter "accessory"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;",
            "Ljava/lang/String;",
            "Landroid/hardware/usb/UsbAccessory;",
            ")V"
        }
    .end annotation

    .prologue
    .line 368
    .local p2, matches:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/ResolveInfo;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 371
    .local v0, count:I
    if-nez v0, :cond_3f

    .line 372
    if-eqz p4, :cond_34

    .line 373
    invoke-virtual {p4}, Landroid/hardware/usb/UsbAccessory;->getUri()Ljava/lang/String;

    move-result-object v7

    .line 374
    .local v7, uri:Ljava/lang/String;
    if-eqz v7, :cond_34

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_34

    .line 377
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 378
    .local v2, dialogIntent:Landroid/content/Intent;
    const-string v8, "com.android.systemui"

    const-string v9, "com.android.systemui.usb.UsbAccessoryUriActivity"

    invoke-virtual {v2, v8, v9}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 380
    const/high16 v8, 0x1000

    invoke-virtual {v2, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 381
    const-string v8, "accessory"

    invoke-virtual {v2, v8, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 382
    const-string v8, "uri"

    invoke-virtual {v2, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 384
    :try_start_2f
    iget-object v8, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_34
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2f .. :try_end_34} :catch_35

    .line 455
    .end local v2           #dialogIntent:Landroid/content/Intent;
    .end local v7           #uri:Ljava/lang/String;
    .end local p1
    :cond_34
    :goto_34
    return-void

    .line 385
    .restart local v2       #dialogIntent:Landroid/content/Intent;
    .restart local v7       #uri:Ljava/lang/String;
    .restart local p1
    :catch_35
    move-exception v8

    move-object v3, v8

    .line 386
    .local v3, e:Landroid/content/ActivityNotFoundException;
    const-string v8, "UsbDeviceSettingsManager"

    const-string v9, "unable to start UsbAccessoryUriActivity"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34

    .line 395
    .end local v2           #dialogIntent:Landroid/content/Intent;
    .end local v3           #e:Landroid/content/ActivityNotFoundException;
    .end local v7           #uri:Ljava/lang/String;
    :cond_3f
    const/4 v1, 0x0

    .line 396
    .local v1, defaultRI:Landroid/content/pm/ResolveInfo;
    const/4 v8, 0x1

    if-ne v0, v8, :cond_61

    if-nez p3, :cond_61

    .line 399
    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    .line 400
    .local v5, rInfo:Landroid/content/pm/ResolveInfo;
    iget-object v8, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v8, :cond_61

    iget-object v8, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v8, :cond_61

    iget-object v8, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v8, v8, 0x1

    if-eqz v8, :cond_61

    .line 403
    move-object v1, v5

    .line 407
    .end local v5           #rInfo:Landroid/content/pm/ResolveInfo;
    :cond_61
    if-nez v1, :cond_7d

    if-eqz p3, :cond_7d

    .line 409
    const/4 v4, 0x0

    .local v4, i:I
    :goto_66
    if-ge v4, v0, :cond_7d

    .line 410
    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    .line 411
    .restart local v5       #rInfo:Landroid/content/pm/ResolveInfo;
    iget-object v8, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v8, :cond_a8

    iget-object v8, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ComponentInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a8

    .line 413
    move-object v1, v5

    .line 419
    .end local v4           #i:I
    .end local v5           #rInfo:Landroid/content/pm/ResolveInfo;
    :cond_7d
    if-eqz v1, :cond_ab

    .line 421
    iget-object v8, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {p0, p4, v8}, Lcom/android/server/usb/UsbDeviceSettingsManager;->grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V

    .line 425
    :try_start_88
    new-instance v8, Landroid/content/ComponentName;

    iget-object v9, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ComponentInfo;->packageName:Ljava/lang/String;

    iget-object v10, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v10, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    invoke-direct {v8, v9, v10}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v8}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 428
    iget-object v8, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_9d
    .catch Landroid/content/ActivityNotFoundException; {:try_start_88 .. :try_end_9d} :catch_9e

    goto :goto_34

    .line 429
    :catch_9e
    move-exception v8

    move-object v3, v8

    .line 430
    .restart local v3       #e:Landroid/content/ActivityNotFoundException;
    const-string v8, "UsbDeviceSettingsManager"

    const-string v9, "startActivity failed"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_34

    .line 409
    .end local v3           #e:Landroid/content/ActivityNotFoundException;
    .restart local v4       #i:I
    .restart local v5       #rInfo:Landroid/content/pm/ResolveInfo;
    :cond_a8
    add-int/lit8 v4, v4, 0x1

    goto :goto_66

    .line 433
    .end local v4           #i:I
    .end local v5           #rInfo:Landroid/content/pm/ResolveInfo;
    :cond_ab
    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 434
    .local v6, resolverIntent:Landroid/content/Intent;
    const/high16 v8, 0x1000

    invoke-virtual {v6, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 436
    const/4 v8, 0x1

    if-ne v0, v8, :cond_f3

    .line 438
    const-string v8, "com.android.systemui"

    const-string v9, "com.android.systemui.usb.UsbConfirmActivity"

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 440
    const-string v8, "rinfo"

    const/4 v9, 0x0

    invoke-virtual {p2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1
    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {v6, v8, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 441
    const-string v8, "accessory"

    invoke-virtual {v6, v8, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 450
    :goto_d0
    :try_start_d0
    iget-object v8, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8, v6}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_d5
    .catch Landroid/content/ActivityNotFoundException; {:try_start_d0 .. :try_end_d5} :catch_d7

    goto/16 :goto_34

    .line 451
    :catch_d7
    move-exception v8

    move-object v3, v8

    .line 452
    .restart local v3       #e:Landroid/content/ActivityNotFoundException;
    const-string v8, "UsbDeviceSettingsManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "unable to start activity "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_34

    .line 444
    .end local v3           #e:Landroid/content/ActivityNotFoundException;
    .restart local p1
    :cond_f3
    const-string v8, "com.android.systemui"

    const-string v9, "com.android.systemui.usb.UsbResolverActivity"

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 446
    const-string v8, "rlist"

    invoke-virtual {v6, v8, p2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 447
    const-string v8, "android.intent.extra.INTENT"

    invoke-virtual {v6, v8, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_d0
.end method

.method private writeSettingsLocked()V
    .registers 12

    .prologue
    const-string v7, "settings"

    const-string v7, "preference"

    const-string v10, "UsbDeviceSettingsManager"

    .line 262
    const/4 v2, 0x0

    .line 264
    .local v2, fos:Ljava/io/FileOutputStream;
    :try_start_7
    new-instance v3, Ljava/io/FileOutputStream;

    sget-object v7, Lcom/android/server/usb/UsbDeviceSettingsManager;->sSettingsFile:Ljava/io/File;

    invoke-direct {v3, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 265
    .local v3, fstr:Ljava/io/FileOutputStream;
    const-string v7, "UsbDeviceSettingsManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "writing settings to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    new-instance v6, Ljava/io/BufferedOutputStream;

    invoke-direct {v6, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 267
    .local v6, str:Ljava/io/BufferedOutputStream;
    new-instance v5, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v5}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 268
    .local v5, serializer:Lcom/android/internal/util/FastXmlSerializer;
    const-string v7, "utf-8"

    invoke-virtual {v5, v6, v7}, Lcom/android/internal/util/FastXmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 269
    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lcom/android/internal/util/FastXmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 270
    const-string v7, "http://xmlpull.org/v1/doc/features.html#indent-output"

    const/4 v8, 0x1

    invoke-virtual {v5, v7, v8}, Lcom/android/internal/util/FastXmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 271
    const/4 v7, 0x0

    const-string v8, "settings"

    invoke-virtual {v5, v7, v8}, Lcom/android/internal/util/FastXmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 273
    iget-object v7, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_54
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    .line 274
    .local v1, filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    const/4 v7, 0x0

    const-string v8, "preference"

    invoke-virtual {v5, v7, v8}, Lcom/android/internal/util/FastXmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 275
    const/4 v8, 0x0

    const-string v9, "package"

    iget-object v7, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v7, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v5, v8, v9, v7}, Lcom/android/internal/util/FastXmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 276
    invoke-virtual {v1, v5}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 277
    const/4 v7, 0x0

    const-string v8, "preference"

    invoke-virtual {v5, v7, v8}, Lcom/android/internal/util/FastXmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7d} :catch_7e

    goto :goto_54

    .line 286
    .end local v1           #filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    .end local v3           #fstr:Ljava/io/FileOutputStream;
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #serializer:Lcom/android/internal/util/FastXmlSerializer;
    .end local v6           #str:Ljava/io/BufferedOutputStream;
    :catch_7e
    move-exception v7

    move-object v0, v7

    .line 287
    .local v0, e:Ljava/lang/Exception;
    const-string v7, "UsbDeviceSettingsManager"

    const-string v7, "error writing settings file, deleting to start fresh"

    invoke-static {v10, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 288
    sget-object v7, Lcom/android/server/usb/UsbDeviceSettingsManager;->sSettingsFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 290
    .end local v0           #e:Ljava/lang/Exception;
    :goto_8c
    return-void

    .line 280
    .restart local v3       #fstr:Ljava/io/FileOutputStream;
    .restart local v4       #i$:Ljava/util/Iterator;
    .restart local v5       #serializer:Lcom/android/internal/util/FastXmlSerializer;
    .restart local v6       #str:Ljava/io/BufferedOutputStream;
    :cond_8d
    const/4 v7, 0x0

    :try_start_8e
    const-string v8, "settings"

    invoke-virtual {v5, v7, v8}, Lcom/android/internal/util/FastXmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 281
    invoke-virtual {v5}, Lcom/android/internal/util/FastXmlSerializer;->endDocument()V

    .line 283
    invoke-virtual {v6}, Ljava/io/BufferedOutputStream;->flush()V

    .line 284
    invoke-static {v3}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 285
    invoke-virtual {v6}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_9f} :catch_7e

    goto :goto_8c
.end method


# virtual methods
.method public accessoryAttached(Landroid/hardware/usb/UsbAccessory;)V
    .registers 8
    .parameter "accessory"

    .prologue
    .line 340
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.hardware.usb.action.USB_ACCESSORY_ATTACHED"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 341
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "accessory"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 342
    const/high16 v3, 0x1000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 346
    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 347
    :try_start_14
    invoke-direct {p0, p1, v1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->getAccessoryMatchesLocked(Landroid/hardware/usb/UsbAccessory;Landroid/content/Intent;)Ljava/util/ArrayList;

    move-result-object v2

    .line 350
    .local v2, matches:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/ResolveInfo;>;"
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    new-instance v5, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    invoke-direct {v5, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;-><init>(Landroid/hardware/usb/UsbAccessory;)V

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 351
    .local v0, defaultPackage:Ljava/lang/String;
    monitor-exit v3
    :try_end_26
    .catchall {:try_start_14 .. :try_end_26} :catchall_2a

    .line 353
    invoke-direct {p0, v1, v2, v0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->resolveActivity(Landroid/content/Intent;Ljava/util/ArrayList;Ljava/lang/String;Landroid/hardware/usb/UsbAccessory;)V

    .line 354
    return-void

    .line 351
    .end local v0           #defaultPackage:Ljava/lang/String;
    .end local v2           #matches:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/ResolveInfo;>;"
    :catchall_2a
    move-exception v4

    :try_start_2b
    monitor-exit v3
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2a

    throw v4
.end method

.method public accessoryDetached(Landroid/hardware/usb/UsbAccessory;)V
    .registers 4
    .parameter "accessory"

    .prologue
    .line 358
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.hardware.usb.action.USB_ACCESSORY_DETACHED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 362
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "accessory"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 363
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 364
    return-void
.end method

.method public checkPermission(Landroid/hardware/usb/UsbAccessory;)V
    .registers 5
    .parameter "accessory"

    .prologue
    .line 538
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->hasPermission(Landroid/hardware/usb/UsbAccessory;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 539
    new-instance v0, Ljava/lang/SecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "User has not given permission to accessory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 541
    :cond_1f
    return-void
.end method

.method public clearDefaults(Ljava/lang/String;)V
    .registers 4
    .parameter "packageName"

    .prologue
    .line 628
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 629
    :try_start_3
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->clearPackageDefaultsLocked(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 630
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceSettingsManager;->writeSettingsLocked()V

    .line 632
    :cond_c
    monitor-exit v0

    .line 633
    return-void

    .line 632
    :catchall_e
    move-exception v1

    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v1
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;)V
    .registers 12
    .parameter "fd"
    .parameter "pw"

    .prologue
    const-string v6, ": "

    const-string v6, "    "

    .line 654
    iget-object v7, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v7

    .line 655
    :try_start_7
    const-string v6, "  Accessory permissions:"

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 656
    iget-object v6, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_16
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_77

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbAccessory;

    .line 657
    .local v0, accessory:Landroid/hardware/usb/UsbAccessory;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ": "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 658
    iget-object v6, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/SparseBooleanArray;

    .line 659
    .local v5, uidList:Landroid/util/SparseBooleanArray;
    invoke-virtual {v5}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    .line 660
    .local v1, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_4b
    if-ge v3, v1, :cond_6e

    .line 661
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 660
    add-int/lit8 v3, v3, 0x1

    goto :goto_4b

    .line 663
    :cond_6e
    const-string v6, ""

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_16

    .line 669
    .end local v0           #accessory:Landroid/hardware/usb/UsbAccessory;
    .end local v1           #count:I
    .end local v3           #i:I
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #uidList:Landroid/util/SparseBooleanArray;
    :catchall_74
    move-exception v6

    monitor-exit v7
    :try_end_76
    .catchall {:try_start_7 .. :try_end_76} :catchall_74

    throw v6

    .line 665
    .restart local v4       #i$:Ljava/util/Iterator;
    :cond_77
    :try_start_77
    const-string v6, "  Accessory preferences:"

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 666
    iget-object v6, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_86
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_bb

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    .line 667
    .local v2, filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ": "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v6, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_86

    .line 669
    .end local v2           #filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    :cond_bb
    monitor-exit v7
    :try_end_bc
    .catchall {:try_start_77 .. :try_end_bc} :catchall_74

    .line 670
    return-void
.end method

.method public grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V
    .registers 6
    .parameter "accessory"
    .parameter "uid"

    .prologue
    .line 611
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 612
    :try_start_3
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 613
    .local v0, uidList:Landroid/util/SparseBooleanArray;
    if-nez v0, :cond_18

    .line 614
    new-instance v0, Landroid/util/SparseBooleanArray;

    .end local v0           #uidList:Landroid/util/SparseBooleanArray;
    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/util/SparseBooleanArray;-><init>(I)V

    .line 615
    .restart local v0       #uidList:Landroid/util/SparseBooleanArray;
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 617
    :cond_18
    const/4 v2, 0x1

    invoke-virtual {v0, p2, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 618
    monitor-exit v1

    .line 619
    return-void

    .line 618
    .end local v0           #uidList:Landroid/util/SparseBooleanArray;
    :catchall_1e
    move-exception v2

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v2
.end method

.method public hasDefaults(Ljava/lang/String;)Z
    .registers 4
    .parameter "packageName"

    .prologue
    .line 622
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 623
    :try_start_3
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    monitor-exit v0

    return v1

    .line 624
    :catchall_f
    move-exception v1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v1
.end method

.method public hasPermission(Landroid/hardware/usb/UsbAccessory;)Z
    .registers 5
    .parameter "accessory"

    .prologue
    .line 528
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 529
    :try_start_3
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 530
    .local v0, uidList:Landroid/util/SparseBooleanArray;
    if-nez v0, :cond_11

    .line 531
    const/4 v2, 0x0

    monitor-exit v1

    move v1, v2

    .line 533
    :goto_10
    return v1

    :cond_11
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v2

    monitor-exit v1

    move v1, v2

    goto :goto_10

    .line 534
    .end local v0           #uidList:Landroid/util/SparseBooleanArray;
    :catchall_1c
    move-exception v2

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public requestPermission(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 8
    .parameter "accessory"
    .parameter "packageName"
    .parameter "pi"

    .prologue
    const-string v3, "accessory"

    .line 574
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 577
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager;->hasPermission(Landroid/hardware/usb/UsbAccessory;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 578
    const-string v2, "accessory"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 579
    const-string v2, "permission"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 581
    :try_start_18
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-virtual {p3, v2, v3, v1}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_1e
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_18 .. :try_end_1e} :catch_1f

    .line 590
    :goto_1e
    return-void

    .line 582
    :catch_1f
    move-exception v2

    move-object v0, v2

    .line 583
    .local v0, e:Landroid/app/PendingIntent$CanceledException;
    const-string v2, "UsbDeviceSettingsManager"

    const-string v3, "requestPermission PendingIntent was cancelled"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1e

    .line 588
    .end local v0           #e:Landroid/app/PendingIntent$CanceledException;
    :cond_29
    const-string v2, "accessory"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 589
    invoke-direct {p0, v1, p2, p3}, Lcom/android/server/usb/UsbDeviceSettingsManager;->requestPermissionDialog(Landroid/content/Intent;Ljava/lang/String;Landroid/app/PendingIntent;)V

    goto :goto_1e
.end method

.method public setAccessoryPackage(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;)V
    .registers 9
    .parameter "accessory"
    .parameter "packageName"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 593
    new-instance v1, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;

    invoke-direct {v1, p1}, Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;-><init>(Landroid/hardware/usb/UsbAccessory;)V

    .line 594
    .local v1, filter:Lcom/android/server/usb/UsbDeviceSettingsManager$AccessoryFilter;
    const/4 v0, 0x0

    .line 595
    .local v0, changed:Z
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 596
    if-nez p2, :cond_1f

    .line 597
    :try_start_d
    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1d

    move v0, v5

    .line 604
    :cond_16
    :goto_16
    if-eqz v0, :cond_1b

    .line 605
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceSettingsManager;->writeSettingsLocked()V

    .line 607
    :cond_1b
    monitor-exit v2

    .line 608
    return-void

    :cond_1d
    move v0, v4

    .line 597
    goto :goto_16

    .line 599
    :cond_1f
    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_37

    move v0, v5

    .line 600
    :goto_2c
    if-eqz v0, :cond_16

    .line 601
    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    .line 607
    :catchall_34
    move-exception v3

    monitor-exit v2
    :try_end_36
    .catchall {:try_start_d .. :try_end_36} :catchall_34

    throw v3

    :cond_37
    move v0, v4

    .line 599
    goto :goto_2c
.end method
