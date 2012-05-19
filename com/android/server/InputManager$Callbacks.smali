.class Lcom/android/server/InputManager$Callbacks;
.super Ljava/lang/Object;
.source "InputManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/InputManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Callbacks"
.end annotation


# static fields
.field private static final CALIBRATION_DIR_PATH:Ljava/lang/String; = "usr/idc/"

.field private static final DEBUG_VIRTUAL_KEYS:Z = false

.field private static final EXCLUDED_DEVICES_PATH:Ljava/lang/String; = "etc/excluded-input-devices.xml"

.field static final TAG:Ljava/lang/String; = "InputManager-Callbacks"


# instance fields
.field final synthetic this$0:Lcom/android/server/InputManager;


# direct methods
.method private constructor <init>(Lcom/android/server/InputManager;)V
    .registers 2
    .parameter

    .prologue
    .line 356
    iput-object p1, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/InputManager;Lcom/android/server/InputManager$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 356
    invoke-direct {p0, p1}, Lcom/android/server/InputManager$Callbacks;-><init>(Lcom/android/server/InputManager;)V

    return-void
.end method


# virtual methods
.method public checkInjectEventsPermission(II)Z
    .registers 5
    .parameter "injectorPid"
    .parameter "injectorUid"

    .prologue
    .line 400
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$200(Lcom/android/server/InputManager;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.INJECT_EVENTS"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public filterJumpyTouchEvents()Z
    .registers 3

    .prologue
    .line 413
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$200(Lcom/android/server/InputManager;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10d0015

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method public filterTouchEvents()Z
    .registers 3

    .prologue
    .line 407
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$200(Lcom/android/server/InputManager;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10d0014

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method public getExcludedDeviceNames()[Ljava/lang/String;
    .registers 11

    .prologue
    .line 498
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 501
    .local v5, names:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 503
    .local v6, parser:Lorg/xmlpull/v1/XmlPullParser;
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v7

    const-string v8, "etc/excluded-input-devices.xml"

    invoke-direct {v0, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 504
    .local v0, confFile:Ljava/io/File;
    const/4 v1, 0x0

    .line 506
    .local v1, confreader:Ljava/io/FileReader;
    :try_start_12
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_17
    .catchall {:try_start_12 .. :try_end_17} :catchall_86
    .catch Ljava/io/FileNotFoundException; {:try_start_12 .. :try_end_17} :catch_98
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_17} :catch_5c

    .line 507
    .end local v1           #confreader:Ljava/io/FileReader;
    .local v2, confreader:Ljava/io/FileReader;
    :try_start_17
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v6

    .line 508
    invoke-interface {v6, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 509
    const-string v7, "devices"

    invoke-static {v6, v7}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 512
    :cond_23
    :goto_23
    invoke-static {v6}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 513
    const-string v7, "device"

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2f
    .catchall {:try_start_17 .. :try_end_2f} :catchall_91
    .catch Ljava/io/FileNotFoundException; {:try_start_17 .. :try_end_2f} :catch_52
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_2f} :catch_94

    move-result v7

    if-nez v7, :cond_45

    .line 526
    if-eqz v2, :cond_37

    :try_start_34
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_37} :catch_8f

    :cond_37
    :goto_37
    move-object v1, v2

    .line 529
    .end local v2           #confreader:Ljava/io/FileReader;
    .restart local v1       #confreader:Ljava/io/FileReader;
    :cond_38
    :goto_38
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, [Ljava/lang/String;

    return-object p0

    .line 516
    .end local v1           #confreader:Ljava/io/FileReader;
    .restart local v2       #confreader:Ljava/io/FileReader;
    .restart local p0
    :cond_45
    const/4 v7, 0x0

    :try_start_46
    const-string v8, "name"

    invoke-interface {v6, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 517
    .local v4, name:Ljava/lang/String;
    if-eqz v4, :cond_23

    .line 518
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_51
    .catchall {:try_start_46 .. :try_end_51} :catchall_91
    .catch Ljava/io/FileNotFoundException; {:try_start_46 .. :try_end_51} :catch_52
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_51} :catch_94

    goto :goto_23

    .line 521
    .end local v4           #name:Ljava/lang/String;
    :catch_52
    move-exception v7

    move-object v1, v2

    .line 526
    .end local v2           #confreader:Ljava/io/FileReader;
    .restart local v1       #confreader:Ljava/io/FileReader;
    :goto_54
    if-eqz v1, :cond_38

    :try_start_56
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_59} :catch_5a

    goto :goto_38

    :catch_5a
    move-exception v7

    goto :goto_38

    .line 523
    :catch_5c
    move-exception v7

    move-object v3, v7

    .line 524
    .local v3, e:Ljava/lang/Exception;
    :goto_5e
    :try_start_5e
    const-string v7, "InputManager-Callbacks"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception while parsing \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_80
    .catchall {:try_start_5e .. :try_end_80} :catchall_86

    .line 526
    if-eqz v1, :cond_38

    :try_start_82
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_85
    .catch Ljava/io/IOException; {:try_start_82 .. :try_end_85} :catch_5a

    goto :goto_38

    .end local v3           #e:Ljava/lang/Exception;
    :catchall_86
    move-exception v7

    :goto_87
    if-eqz v1, :cond_8c

    :try_start_89
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_8c
    .catch Ljava/io/IOException; {:try_start_89 .. :try_end_8c} :catch_8d

    :cond_8c
    :goto_8c
    throw v7

    :catch_8d
    move-exception v8

    goto :goto_8c

    .end local v1           #confreader:Ljava/io/FileReader;
    .restart local v2       #confreader:Ljava/io/FileReader;
    :catch_8f
    move-exception v7

    goto :goto_37

    :catchall_91
    move-exception v7

    move-object v1, v2

    .end local v2           #confreader:Ljava/io/FileReader;
    .restart local v1       #confreader:Ljava/io/FileReader;
    goto :goto_87

    .line 523
    .end local v1           #confreader:Ljava/io/FileReader;
    .restart local v2       #confreader:Ljava/io/FileReader;
    :catch_94
    move-exception v7

    move-object v3, v7

    move-object v1, v2

    .end local v2           #confreader:Ljava/io/FileReader;
    .restart local v1       #confreader:Ljava/io/FileReader;
    goto :goto_5e

    .line 521
    :catch_98
    move-exception v7

    goto :goto_54
.end method

.method public getInputDeviceCalibration(Ljava/lang/String;)Lcom/android/server/InputManager$InputDeviceCalibration;
    .registers 12
    .parameter "deviceName"

    .prologue
    const/4 v7, 0x0

    const-string v9, "InputManager-Callbacks"

    const-string v8, "."

    .line 474
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 475
    .local v3, properties:Ljava/util/Properties;
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "usr/idc/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".idc"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 477
    .local v1, calibrationFile:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_90

    .line 479
    :try_start_32
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v3, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_3a} :catch_65

    .line 490
    :goto_3a
    new-instance v0, Lcom/android/server/InputManager$InputDeviceCalibration;

    invoke-direct {v0, v7}, Lcom/android/server/InputManager$InputDeviceCalibration;-><init>(Lcom/android/server/InputManager$1;)V

    .line 491
    .local v0, calibration:Lcom/android/server/InputManager$InputDeviceCalibration;
    invoke-virtual {v3}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/Properties;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, [Ljava/lang/String;

    iput-object p0, v0, Lcom/android/server/InputManager$InputDeviceCalibration;->keys:[Ljava/lang/String;

    .line 492
    invoke-virtual {v3}, Ljava/util/Properties;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/Properties;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    iput-object p0, v0, Lcom/android/server/InputManager$InputDeviceCalibration;->values:[Ljava/lang/String;

    move-object v4, v0

    .line 493
    .end local v0           #calibration:Lcom/android/server/InputManager$InputDeviceCalibration;
    :goto_64
    return-object v4

    .line 480
    .restart local p0
    :catch_65
    move-exception v4

    move-object v2, v4

    .line 481
    .local v2, ex:Ljava/io/IOException;
    const-string v4, "InputManager-Callbacks"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error reading input device calibration properties for device "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3a

    .line 485
    .end local v2           #ex:Ljava/io/IOException;
    :cond_90
    const-string v4, "InputManager-Callbacks"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No input device calibration properties found for device "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v7

    .line 487
    goto :goto_64
.end method

.method public getMaxEventsPerSecond()I
    .registers 3

    .prologue
    .line 534
    const/4 v0, 0x0

    .line 536
    .local v0, result:I
    :try_start_1
    const-string v1, "windowsmgr.max_events_per_sec"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_a} :catch_11

    move-result v0

    .line 539
    :goto_b
    const/4 v1, 0x1

    if-ge v0, v1, :cond_10

    .line 540
    const/16 v0, 0x3c

    .line 542
    :cond_10
    return v0

    .line 537
    :catch_11
    move-exception v1

    goto :goto_b
.end method

.method public getStartedShutdown()Z
    .registers 2

    .prologue
    .line 548
    invoke-static {}, Lcom/android/internal/app/ShutdownThread;->IsShutDownStarted()Z

    move-result v0

    return v0
.end method

.method public getVirtualKeyDefinitions(Ljava/lang/String;)[Lcom/android/server/InputManager$VirtualKeyDefinition;
    .registers 15
    .parameter "deviceName"

    .prologue
    .line 425
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 428
    .local v8, keys:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/InputManager$VirtualKeyDefinition;>;"
    :try_start_5
    new-instance v3, Ljava/io/FileInputStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/sys/board_properties/virtualkeys."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v3, v10}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 430
    .local v3, fis:Ljava/io/FileInputStream;
    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 431
    .local v5, isr:Ljava/io/InputStreamReader;
    new-instance v1, Ljava/io/BufferedReader;

    const/16 v10, 0x800

    invoke-direct {v1, v5, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 432
    .local v1, br:Ljava/io/BufferedReader;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v9

    .line 433
    .local v9, str:Ljava/lang/String;
    if-eqz v9, :cond_10f

    .line 434
    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 436
    .local v6, it:[Ljava/lang/String;
    array-length v10, v6

    const/4 v11, 0x6

    sub-int v0, v10, v11

    .line 437
    .local v0, N:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_3a
    if-gt v4, v0, :cond_10f

    .line 438
    const-string v10, "0x01"

    aget-object v11, v6, v4

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_77

    .line 439
    const-string v10, "InputManager-Callbacks"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unknown virtual key type at elem #"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ": "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    aget-object v12, v6, v4

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " for device "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_74
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_74} :catch_e2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_74} :catch_113

    .line 437
    :goto_74
    add-int/lit8 v4, v4, 0x6

    goto :goto_3a

    .line 444
    :cond_77
    :try_start_77
    new-instance v7, Lcom/android/server/InputManager$VirtualKeyDefinition;

    const/4 v10, 0x0

    invoke-direct {v7, v10}, Lcom/android/server/InputManager$VirtualKeyDefinition;-><init>(Lcom/android/server/InputManager$1;)V

    .line 445
    .local v7, key:Lcom/android/server/InputManager$VirtualKeyDefinition;
    add-int/lit8 v10, v4, 0x1

    aget-object v10, v6, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v7, Lcom/android/server/InputManager$VirtualKeyDefinition;->scanCode:I

    .line 446
    add-int/lit8 v10, v4, 0x2

    aget-object v10, v6, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v7, Lcom/android/server/InputManager$VirtualKeyDefinition;->centerX:I

    .line 447
    add-int/lit8 v10, v4, 0x3

    aget-object v10, v6, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v7, Lcom/android/server/InputManager$VirtualKeyDefinition;->centerY:I

    .line 448
    add-int/lit8 v10, v4, 0x4

    aget-object v10, v6, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v7, Lcom/android/server/InputManager$VirtualKeyDefinition;->width:I

    .line 449
    add-int/lit8 v10, v4, 0x5

    aget-object v10, v6, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v7, Lcom/android/server/InputManager$VirtualKeyDefinition;->height:I

    .line 454
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_b2
    .catch Ljava/lang/NumberFormatException; {:try_start_77 .. :try_end_b2} :catch_b3
    .catch Ljava/io/FileNotFoundException; {:try_start_77 .. :try_end_b2} :catch_e2
    .catch Ljava/io/IOException; {:try_start_77 .. :try_end_b2} :catch_113

    goto :goto_74

    .line 455
    .end local v7           #key:Lcom/android/server/InputManager$VirtualKeyDefinition;
    :catch_b3
    move-exception v10

    move-object v2, v10

    .line 456
    .local v2, e:Ljava/lang/NumberFormatException;
    :try_start_b5
    const-string v10, "InputManager-Callbacks"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Bad number in virtual key definition at region "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " in: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " for device "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e1
    .catch Ljava/io/FileNotFoundException; {:try_start_b5 .. :try_end_e1} :catch_e2
    .catch Ljava/io/IOException; {:try_start_b5 .. :try_end_e1} :catch_113

    goto :goto_74

    .line 462
    .end local v0           #N:I
    .end local v1           #br:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/lang/NumberFormatException;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v4           #i:I
    .end local v5           #isr:Ljava/io/InputStreamReader;
    .end local v6           #it:[Ljava/lang/String;
    .end local v9           #str:Ljava/lang/String;
    :catch_e2
    move-exception v10

    move-object v2, v10

    .line 463
    .local v2, e:Ljava/io/FileNotFoundException;
    const-string v10, "InputManager-Callbacks"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "No virtual keys found for device "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    .end local v2           #e:Ljava/io/FileNotFoundException;
    :goto_102
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v10

    new-array v10, v10, [Lcom/android/server/InputManager$VirtualKeyDefinition;

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, [Lcom/android/server/InputManager$VirtualKeyDefinition;

    return-object p0

    .line 461
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    .restart local v5       #isr:Ljava/io/InputStreamReader;
    .restart local v9       #str:Ljava/lang/String;
    .restart local p0
    :cond_10f
    :try_start_10f
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_112
    .catch Ljava/io/FileNotFoundException; {:try_start_10f .. :try_end_112} :catch_e2
    .catch Ljava/io/IOException; {:try_start_10f .. :try_end_112} :catch_113

    goto :goto_102

    .line 464
    .end local v1           #br:Ljava/io/BufferedReader;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v5           #isr:Ljava/io/InputStreamReader;
    .end local v9           #str:Ljava/lang/String;
    :catch_113
    move-exception v10

    move-object v2, v10

    .line 465
    .local v2, e:Ljava/io/IOException;
    const-string v10, "InputManager-Callbacks"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Error reading virtual keys for device "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_102
.end method

.method public getVirtualKeyQuietTimeMillis()I
    .registers 3

    .prologue
    .line 419
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$200(Lcom/android/server/InputManager;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e0010

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    return v0
.end method

.method public interceptKeyBeforeDispatching(Landroid/view/InputChannel;IIIIIII)Z
    .registers 18
    .parameter "focus"
    .parameter "action"
    .parameter "flags"
    .parameter "keyCode"
    .parameter "scanCode"
    .parameter "metaState"
    .parameter "repeatCount"
    .parameter "policyFlags"

    .prologue
    .line 394
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mWindowManagerService:Lcom/android/server/WindowManagerService;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$100(Lcom/android/server/InputManager;)Lcom/android/server/WindowManagerService;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputMonitor:Lcom/android/server/WindowManagerService$InputMonitor;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lcom/android/server/WindowManagerService$InputMonitor;->interceptKeyBeforeDispatching(Landroid/view/InputChannel;IIIIIII)Z

    move-result v0

    return v0
.end method

.method public interceptKeyBeforeQueueing(JIIIIIZ)I
    .registers 18
    .parameter "whenNanos"
    .parameter "action"
    .parameter "flags"
    .parameter "keyCode"
    .parameter "scanCode"
    .parameter "policyFlags"
    .parameter "isScreenOn"

    .prologue
    .line 386
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mWindowManagerService:Lcom/android/server/WindowManagerService;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$100(Lcom/android/server/InputManager;)Lcom/android/server/WindowManagerService;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputMonitor:Lcom/android/server/WindowManagerService$InputMonitor;

    move-wide v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lcom/android/server/WindowManagerService$InputMonitor;->interceptKeyBeforeQueueing(JIIIIIZ)I

    move-result v0

    return v0
.end method

.method public notifyANR(Ljava/lang/Object;Landroid/view/InputChannel;)J
    .registers 5
    .parameter "token"
    .parameter "inputChannel"

    .prologue
    .line 380
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mWindowManagerService:Lcom/android/server/WindowManagerService;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$100(Lcom/android/server/InputManager;)Lcom/android/server/WindowManagerService;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputMonitor:Lcom/android/server/WindowManagerService$InputMonitor;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/WindowManagerService$InputMonitor;->notifyANR(Ljava/lang/Object;Landroid/view/InputChannel;)J

    move-result-wide v0

    return-wide v0
.end method

.method public notifyConfigurationChanged(J)V
    .registers 4
    .parameter "whenNanos"

    .prologue
    .line 365
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mWindowManagerService:Lcom/android/server/WindowManagerService;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$100(Lcom/android/server/InputManager;)Lcom/android/server/WindowManagerService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/WindowManagerService;->sendNewConfiguration()V

    .line 366
    return-void
.end method

.method public notifyInputChannelBroken(Landroid/view/InputChannel;)V
    .registers 3
    .parameter "inputChannel"

    .prologue
    .line 375
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mWindowManagerService:Lcom/android/server/WindowManagerService;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$100(Lcom/android/server/InputManager;)Lcom/android/server/WindowManagerService;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputMonitor:Lcom/android/server/WindowManagerService$InputMonitor;

    invoke-virtual {v0, p1}, Lcom/android/server/WindowManagerService$InputMonitor;->notifyInputChannelBroken(Landroid/view/InputChannel;)V

    .line 376
    return-void
.end method

.method public notifyLidSwitchChanged(JZ)V
    .registers 5
    .parameter "whenNanos"
    .parameter "lidOpen"

    .prologue
    .line 370
    iget-object v0, p0, Lcom/android/server/InputManager$Callbacks;->this$0:Lcom/android/server/InputManager;

    #getter for: Lcom/android/server/InputManager;->mWindowManagerService:Lcom/android/server/WindowManagerService;
    invoke-static {v0}, Lcom/android/server/InputManager;->access$100(Lcom/android/server/InputManager;)Lcom/android/server/WindowManagerService;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputMonitor:Lcom/android/server/WindowManagerService$InputMonitor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/WindowManagerService$InputMonitor;->notifyLidSwitchChanged(JZ)V

    .line 371
    return-void
.end method
